# 311 Infrastructure Issue Identifier — Project Summary

## Project Overview

This project is an end-to-end NLP and data engineering pipeline that collects, classifies, and visualizes illegal parking reports from the City of Boston's 311 system to identify infrastructure issues affecting cyclists, pedestrians, and public transit users. The system ingests raw, unstructured service request data from the Boston Open311 API, applies text classification techniques (both keyword-based and unsupervised embedding-based) to categorize each report by the type of infrastructure affected, and outputs interactive geospatial visualizations for use by urban planners.

The project was developed for CS4120 — Natural Language Processing (April 2024) and includes both a research component (unsupervised classification via Lbl2Vec) and a production-oriented pipeline (keyword + fuzzy matching classification with map visualization).

A prototype visualization is available at [this link](https://marcusaroldan.github.io/311-infrastructure-issue-identifier/).

---

## Pipeline Architecture

The pipeline consists of three stages, each implemented as a Jupyter Notebook:

```
Boston 311 API  →  collect-new-service-reports.ipynb
                        ↓
                   data/service_requests.json
                        ↓
               infrastructure-issue-identifier.ipynb
                        ↓
                   data/infra_issues.json
                        ↓
           infrastructure-issues-map-preprocess.ipynb
                        ↓
                   data/infra_issues.geojson
                        ↓
                   index.html (Mapbox GL JS)
```

---

## Component Overviews

### 1. Data Collection — `collect-new-service-reports.ipynb`

Automates the retrieval of Illegal Parking Service Requests from the Boston Open311 API.

- Paginates through the API (100 results per page, ~100 pages) to collect all available reports from the last 90 days (~10,000+ requests per run, ~19,000 in the example dataset).
- Handles API rate limiting (10 requests/min) with automatic retry after a 60-second cooldown.
- Supports incremental collection — new requests are appended to an existing JSON file, then duplicates are removed using a set-based deduplication on service request IDs.
- Output: a single JSON array of raw Open311 service request objects containing fields like `service_request_id`, `description`, `lat`, `long`, `requested_datetime`, `media_url`, and `address`.

### 2. Text Classification — `infrastructure-issue-identifier.ipynb`

Classifies each service request into one or more infrastructure issue categories using keyword matching with Levenshtein-distance-based fuzzy matching.

**Classification Scheme (8 categories):**

| Category | Keywords |
|---|---|
| Bike Infrastructure Issue | bike, cycle |
| Public Transit Infrastructure Issue | bus |
| Emergency Services Infrastructure Issue | hydrant, fire |
| Resident Parking Violation | resident, nonresident, sticker |
| Driveway Obstruction | driveway |
| Pedestrian Infrastructure Issue | crosswalk, sidewalk |
| ADA Infrastructure Issue | handicap |
| Traffic Flow Impediment | double, stopped |

**Classification Process:**
1. Descriptions are tokenized using gensim's `simple_preprocess` (accent/special character removal, lowercase, word-level tokens).
2. Exact keyword matching is performed first using regex patterns that allow prefix/suffix affixes around keywords.
3. Fuzzy matching via Levenshtein edit distance is then applied to remaining unclassified documents, with safeguards:
   - Typo count must not exceed 1/5 of the token length (prevents short-word false positives like "bus" → "mut").
   - Tokens that are valid English words (checked against NLTK's word corpus) are excluded from fuzzy matching.
4. Each classified document is enriched with its assigned class(es), the edit distance of the match, and the specific keyword matches found.

**Results on example dataset (~19,208 documents):**
- 12,976 classified (67.6%)
- 7,382 unclassified (38.4%)
- Largest category: Resident Parking Violation (4,567), followed by Emergency Services (1,808) and Pedestrian Infrastructure (1,744)

### 3. GeoJSON Preprocessing — `infrastructure-issues-map-preprocess.ipynb`

Converts classified service request JSON into a GeoJSON FeatureCollection for map display.

- Each service request becomes a GeoJSON Point Feature with properties: Address, Date/Time, Description, Type of Issue, Keyword Matches, and Attached Media URL.
- Handles overlapping coordinates at the same address by applying a small layer offset to prevent exact point overlap on the map.

### 4. Interactive Map Visualization — `index.html`

A client-side web application built with Mapbox GL JS that renders the GeoJSON data on an interactive map of Boston.

- Displays all classified infrastructure issues as circle markers.
- Provides checkbox filters for each of the 8 issue categories, allowing users to toggle visibility.
- Click-to-inspect popups show full details for each report including description, classification, keyword matches, and a link to any attached media (photos).

---

## Research Component: Unsupervised Classification with Lbl2Vec

In addition to the keyword-based pipeline, the project explored unsupervised text classification using the Lbl2Vec model (a Doc2Vec/Word2Vec variant that jointly embeds documents, words, and predefined label-keyword pairs).

### Approach
- Corpus: ~10,000 service request descriptions.
- Custom stop-word removal: words appearing in >10% of documents were removed (e.g., "parked", "parking", "car") to increase contextual differentiation, with keyword terms protected from removal.
- Documents were tagged with integer IDs using an index-based hash to satisfy gensim's TaggedDocument requirements.
- Data split: 70/15/15 (train/validation/test).

### Hyperparameter Tuning
Manual grid search over two rounds (gensim lacks built-in hyperparameter search):
- Round 1: window ∈ [5, 20], negative ∈ [3, 7], similarity_threshold ∈ [0.5, 0.8]
- Round 2: refined around best results → final: window=10, negative=5, similarity_threshold=0.3

### Results
- Silhouette Score: 0.70 on test data — indicating strong cluster cohesion and separation.
- However, manual inspection revealed that document-to-label similarity variation was extremely low (often <0.001 between labels), meaning documents were nearly equidistant from all labels. This is a consequence of the high semantic similarity across the corpus (all documents describe illegal parking).
- The keyword-based approach ultimately proved more practical for this domain, leading to its adoption in the production pipeline.

---

## Key Technical Aspects and Challenges

### Working with Rate-Limited Public APIs
The Boston Open311 API enforces a 10-request-per-minute rate limit and only exposes the last 90 days of data. The collection script handles this gracefully with automatic retry logic and supports incremental data collection with deduplication, enabling the dataset to grow over time.

### High Intra-Corpus Similarity
The single biggest technical challenge was that all documents in the corpus describe the same general topic (illegal parking). This made unsupervised classification extremely difficult — standard NLP embeddings could not differentiate between "car blocking a bike lane" and "car blocking a fire hydrant" because the shared vocabulary overwhelmed the distinguishing terms. This motivated:
- Domain-specific stop-word removal (high-frequency terms like "parked", "car")
- The pivot from unsupervised embeddings to a keyword + fuzzy matching approach for the production system

### Fuzzy Keyword Matching with False Positive Mitigation
The Levenshtein-distance-based fuzzy matching needed careful tuning to avoid false positives. Two key safeguards were implemented:
- A proportional edit distance cap (edits ≤ 1/5 of token length) prevents short keywords from matching unrelated short words.
- A dictionary check against NLTK's English word list filters out correctly-spelled words that happen to be close in edit distance to a keyword.

### Extensible Classification Scheme
The classification system is designed to be easily extended — new categories and keywords can be added to a single dictionary, and the entire pipeline re-runs without code changes. The system also tracks multi-class assignments (a single report can match multiple categories).

### GeoJSON Coordinate Deconfliction
Multiple reports at the same address would render as a single overlapping point. A layer-offset technique was implemented to slightly shift coordinates for co-located reports, making them individually selectable on the map.

### End-to-End Pipeline from Raw Data to Visualization
The project demonstrates a complete data pipeline: API ingestion → NLP classification → geospatial transformation → interactive web visualization, all implemented in Python notebooks with a lightweight HTML/JS frontend.

---

## Tech Stack

- **Language:** Python 3.10
- **NLP:** gensim (tokenization, Doc2Vec/Lbl2Vec), NLTK (stop words, word corpus), Levenshtein (edit distance)
- **Data:** pandas, JSON, GeoJSON
- **Visualization:** matplotlib (analysis charts), Mapbox GL JS (interactive map)
- **API:** Boston Open311 REST API, Python requests library
- **Environment:** Jupyter Notebooks (JupyterLab)
