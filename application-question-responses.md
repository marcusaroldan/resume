#### In 150 words or less, can you describe a full stack project that you worked on recently, and share details around your contributions, tech stack decisions, and learnings from that experience?

At Eden, I architected a full-stack healthcare platform managing 250+ AWS resources across 18 CloudFormation stacks. I built a Backend-for-Frontend service using Node.js/TypeScript on Lambda, synthesizing multiple microservices (insurance verification, EHR integration, patient/doctor management) into a unified API for our offshore team. Key contributions included engineering a VPC-isolated pVerify proxy with DynamoDB token caching, developing serverless patient/doctor backends with OTP authentication and emergency alerts, and overseeing Lua-based EHR middleware providing FHIR R4-compliant data transformation.

AWS serverless architecture was chosen for cost efficiency and auto-scaling, TypeScript for type safety across services, and infrastructure-as-code via CDK for reproducible deployments. The biggest learning was balancing rapid feature delivery with HIPAA compliance—implementing CDK-Nag validation and comprehensive testing coverage. This experience taught me to architect for security-first without sacrificing developer velocity, as well as coordination across global and cross-functional teams.


#### In 150 words or less, can you tell us what drew you to apply for the Junior Full-Stack Developer role at PJMF at this point in your career? We’re especially interested in how this role aligns with your interests in technology and its impact. Please be specific about what excites you about the work and what you hope to grow or develop in this next chapter.
- For my next chapter, I want to build on the skills I learned at Eden. I resonate with the mission of eden (alleviating healthcare burdens from patients and providers), but there aren't many mentorship opportunities/senior experienced developers to facilitate my growth
- I want to contribute to the development of AI and technology with an emphasis on morality and ethics to facilitate the growth of truly positive impacts on society
- PJMF's mission to bridge the frontiers of AI, data science, and social impact is deeply inspiring to me. I want to be part of an organization that is not only advancing technology but doing so with a strong ethical framework and a focus on social good.
- At eden, because of the development stage of the platform, I was not able to work on direct AI initiatives as much as I would have wanted

PJMF's mission to bridge AI, data science, and social impact resonates deeply with my career trajectory. At Eden, I built healthcare infrastructure that alleviated burdens for patients and providers, but as a founding engineer in an early-stage startup, I lacked mentorship opportunities to deepen my technical expertise and couldn't focus on direct AI initiatives as much as I wanted.

What excites me most about PJMF is the "fierce urgency of now" to use technology to tackle pressing challenges like health inequities and climate change with ethical frameworks at the core. I'm drawn to working alongside experienced developers and visionary leaders who prioritize the democratization AI's benefits. In this next chapter, I hope to grow my AI/data science capabilities while contributing to bold innovations that serve the common good, building on my full-stack foundation and AI academic experience to create technology that advances social impact at scale.

##### Patrick J. McGovern Foundation About Me page
A global, 21st century philanthropy, the Patrick J. McGovern Foundation is committed to bridging the frontiers of artificial intelligence, data science, and social impact.

The Foundation is the legacy of IDG founder Patrick J. McGovern, who often said, “The best is yet to come.” He recognized the potential for information technology and neuroscience to democratize access to knowledge, improve the human condition, and advance social good. A generation of rapid advances in technology have led us to new possibilities at the intersection of information technology and neuroscience — artificial intelligence and data science. The promise of AI and data science represent the future Patrick J. McGovern always envisioned. With his optimism about what is possible, the Foundation invests in the exploration, enhancement, and development of AI and data science for good.
Fierce Urgency of Now

A sense of urgency drives our work. Technology, AI, and data increasingly influence our daily lives and society. We aim to create a shared understanding, language, and vision for how these tools can be ethically developed and applied for the greater good. At scale, AI and data can be instrumental in solving the world’s most pressing challenges, from the COVID-19 pandemic to climate change to health inequities. If we are to realize this transformative potential, we will need guiding frameworks for ethical AI and data, new approaches to privacy and stewardship of data, and bold innovations in AI applications.

We believe philanthropy must play a significant role in supporting the diverse talent, courageous conversations, and new institutions needed to make change and reimagine the future. The Patrick J. McGovern Foundation is helping to build that future by serving as a convener, collaborator, and co-creator with other visionary leaders and organizations dedicated to advancing AI and data science for good.
Bridging Technology and Community

We believe in trust-based philanthropic relationships, and democratizing the development and rewards of AI and data.

To build a better future in the digital era, the benefits of technological advancement must be shared by all. The Foundation takes new approaches to how AI and data are conceptualized, developed, applied, and deployed to serve the common good.

### Tell us what excites you most about this role, especially specific technologies?
#### Role description:
About Endgame 🌎

The best sales relationships are built on insight, speed, and trust.

At Endgame, we’re building the intelligence layer that makes that possible—transforming the unstructured mess of CRM, calls, Slack, and enablement data into clear, actionable context for every deal and every conversation.

This isn’t another AI experiment. It’s the operating system for how modern revenue teams work: shared awareness, instant access to knowledge, and a faster path to outcomes.

Backed by world-class investors and built by a team obsessed with elegant systems and measurable impact, we’re redefining how go-to-market teams think, decide, and execute.

Your Mission 🚀

We’re seeking a Backend Platform Engineer who’s excited to learn about graph databases, LLMs, and other emerging technologies. You’ll help shape how enterprise sellers navigate and act on complex data, creating insightful, data-driven capabilities that improve visibility into customer pain points. If you enjoy building scalable backend systems in Python—and have a passion for learning and applying the latest tech—read on.

Responsibilities 🗓

    Design and optimize backend systems for processing and analyzing complex data structures.
    Collaborate with cross-functional teams (engineering, product, go-to-market) to turn technical solutions into business impact.
    Implement and maintain pipelines for data querying and management.
    Contribute to information extraction and relevance techniques, such as Retrieval-Augmented Generation (RAG).
    Stay current on emerging technologies (graph databases, ML/AI, large language models) and bring innovative solutions to the team.
    In short: Building and shipping dope stuff and then working to make it even better.

Ideal Candidate 🏅

    Strong platform engineering background with proficiency in Python.
    Solid grasp of algorithms, data structures, and performance optimization.
    Experience or eagerness to learn and experiment with graph databases (Neo4j, TigerGraph) and query languages (Cypher, Gremlin) is a plus.
    Familiarity with large language models (LLMs) or knowledge graphs is beneficial but not required.
    Comfortable in a fast-paced startup environment, adapting quickly and collaborating across diverse teams.
    Effective communicator, able to navigate ambiguity and drive impactful solutions.
    You default to collaborative action and are comfortable driving change.
    Excitement about teaching yourself new tools and methodologies in a rapidly changing space.

What excites me most is building the intelligence layer where backend engineering meets AI, particularly contributing to RAG pipelines and graph-based data modeling. At Eden, I designed scalable Python and TypeScript backend systems processing complex healthcare data across microservices, built data transformation pipelines (Lua-based FHIR R4 middleware), and managed infrastructure for 250+ AWS resources. I've also built a personal RAG system using LangChain, OpenAI models, and ChromaDB with vector similarity search, so contributing to Endgame's retrieval and relevance techniques is a natural extension. The startup pace is familiar—at Eden I wore every hat from infrastructure architect to cross-functional team lead, rapidly adapting to shifting priorities while shipping production systems. I'm eager to apply that adaptability to graph databases and LLMs in a revenue intelligence context, learning emerging tools while leveraging my strong Python and cloud platform foundation.



### Describe the most interesting and challenging technical aspects of a project you've worked on.

#### 311 Infrastructure Issue Identifier

This project is an end-to-end NLP pipeline that classifies ~19,000 illegal parking reports from Boston's 311 API to identify infrastructure issues affecting cyclists, pedestrians, and transit users, visualized on an interactive Mapbox GL map built in collaboration with the Boston Cyclist Union.

The most interesting and challenging aspect was the high intra-corpus similarity problem. Every document describes illegal parking, so standard NLP embeddings (Lbl2Vec/Doc2Vec) couldn't differentiate between "car blocking a bike lane" and "car blocking a fire hydrant" — documents were nearly equidistant from all labels despite a strong 0.70 silhouette score. This motivated a pivot from unsupervised classification to keyword-based fuzzy matching using Levenshtein distance, which required careful false-positive mitigation: a proportional edit distance cap (edits ≤ 1/5 token length) prevented short keywords like "bus" from matching unrelated words like "mut," and an NLTK dictionary check filtered correctly-spelled words that happened to be close in edit distance to keywords. The system achieved 67.6% classification across 8 infrastructure categories while remaining extensible — new categories require only a dictionary entry, no code changes.


### Please describe your experience working on web applications that involve REST APIs, back-end development (such as Spring Boot), front-end technologies (such as Angular and JavaScript), and SQL databases. This can include academic projects, internships, or professional experience.

My experience spans the full web application stack across professional and academic settings. At Eden, I designed and deployed multiple RESTful backend services using Node.js/Express.js on AWS Lambda, including a Backend-for-Frontend layer that aggregated insurance verification, EHR integration, and patient/doctor management microservices into a unified API with API key authentication, CORS configuration, and comprehensive request validation. I also built serverless CRUD backends with DynamoDB persistence, session management, and OTP-based authentication, and engineered a VPC-isolated proxy service handling insurance eligibility checks with token caching and credential management via Secrets Manager. I also oversaw a Lua-based EHR middleware on EC2 that transformed vendor-specific API payloads into FHIR R4-compliant data structures—effectively an adapter/proxy layer integrating with AthenaHealth's OAuth 2.0 APIs.

At Wishroute, I worked directly with SQL databases—designing data models and writing queries powering KPI and analytics dashboards that provided real-time insights for internal teams and customers. I also enhanced the Java backend within an AWS serverless architecture, upgrading product features across both internal tools and customer-facing products.

On the front-end side, my 311 Infrastructure Issue Identifier project includes a client-side web application built with JavaScript and Mapbox GL JS, rendering GeoJSON data on an interactive map with category filtering and click-to-inspect popups. I've also worked with React in academic and personal projects, including my portfolio site.


### what makes you unique - your superpower, or something we should know about you that’s not on your résumé, in your own words

I am an extremely resilient problem solver. At Eden, I am the highest-experience technical member of the team (startups are weird...), so often I am tacking projects or problems that I have never seen before. This means I need to first understand the technological context, the business context, and then evaluate possible solution plans to find the most optimal one for our current organizational context. Not every solution is a winner, but by failing fast and incorporating feedback from my teammates and external partners, I am able to iterate on solutions to work towards a final goal that works best.

### Please describe your experience using Data Visualization software.

I have experience with data visualization across both JavaScript and Python ecosystems. For my 311 Infrastructure Issue Identifier, I built an interactive geospatial visualization using Mapbox GL JS that renders ~19,000 classified infrastructure issue reports on a map of Boston. The frontend includes checkbox filters for 8 issue categories, click-to-inspect popups with full report details, and coordinate deconfliction logic to handle overlapping points at the same address—making co-located reports individually selectable. This project also used Matplotlib for analysis charts during the NLP classification research phase, visualizing classification distributions, silhouette scores, and document-to-label similarity metrics across the Lbl2Vec experiments.

In Python, I regularly use Matplotlib, Pandas, and NumPy for data analysis and visualization in ML/AI projects, including my MBTA Data Analysis project found on my portfolio website, and coursework in my AI concentration at Northeastern. At Wishroute, I designed SQL-powered KPI and analytics dashboards that provided real-time data visualizations for internal teams and customers, enabling better decision-making through accessible, data-driven insights.

### Why do you want to work for the Alliance?

I want to work for the Alliance because its mission to end extreme poverty, environmental destruction, democratic decline, and dangerous technological development matches my drive to use technology for ethical, large-scale social impact. I am inspired by the Alliance’s emphasis on reliable member action, evidence-based planning, and the ability to turn small, consistent commitments into precise, high-leverage change.

My experience building healthcare platform systems at Eden taught me that real progress depends on disciplined coordination, strong governance, and accountability. The Alliance’s model—where members approve direction while an office retains the freedom to plan effective actions—resonates with my belief that urgency should be paired with principled execution.

I’m eager to bring my technical adaptability, collaborative mindset, and commitment to measurable impact to a community that values doing good reliably and rapidly.

### Why are you interested in working at WHOOP?

I'm drawn to WHOOP because its mission to unlock human performance and healthspan lies at the intersection of my passions and interests: data-driven health technology, rigorous scientific understanding, and building products that genuinely change and improve how people live.

At Eden, I spent the last year architecting secure, scalable backend systems for healthcare. I have direct experience designing microservices for insurance verification, EHR integration, and patient management across 250+ AWS resources while maintaining HIPAA compliance. That experience gave me deep respect for the engineering rigor required to build trustworthy health platforms. WHOOP's obsession with understanding the human body through 24/7 physiological measurement mirrors my belief that technology's greatest impact comes from turning raw data into truly actionable insights.

What excites me most about WHOOP is the opportunity to contribute to systems that power evidence-based performance optimization at scale. The core platform ingests continuous health data and must synthesize it into signals that help members make better decisions. That requires building robust, low-latency backend pipelines, designing microservices that handle millions of data points, and architecting for privacy and reliability. I've done this at Eden; I want to do it at WHOOP, where the impact is measured in improved recovery, extended healthspan, and unlocked human potential.

Beyond the technical fit, WHOOP's culture resonates with me. High standards paired with high humility, bias for action, obsession with member experience, and the belief that research, design, and privacy are foundational and aligned with my personality and lifestyle. At Eden, I wore every hat I needed to, spanning from infrastructure architect to cross-functional team lead, adapting rapidly to shifting priorities while shipping production systems. I thrive in environments where intensity and excellence are non-negotiable, and I'm excited to bring that adaptability and problem-solving resilience to WHOOP. I want to be part of a team that's relentless in pursuit of understanding the human body and uncompromising in the engineering standards we set.

### Which programming languages are you most familiar with, and which kinds of projects have you worked on with them?

My primary languages are **TypeScript/JavaScript**, **Python**, and **SQL**, each shaped by distinct use cases across my professional and academic work.

**TypeScript** is my go-to for production backend systems. At Eden, I built a Backend-for-Frontend service in Node.js/TypeScript on AWS Lambda, synthesizing multiple healthcare microservices into a unified API contract. I architected serverless patient and doctor management systems with OTP authentication, session management, and DynamoDB persistence—all leveraging TypeScript's type safety to prevent runtime errors in mission-critical healthcare code. TypeScript's compile-time guarantees are invaluable when working with HIPAA-regulated systems where data integrity is non-negotiable. I also use JavaScript in frontend contexts: my 311 Infrastructure Issue Identifier project includes an interactive geospatial visualization built with JavaScript and Mapbox GL JS, featuring dynamic filtering, click-to-inspect popups, and coordinate deconfliction logic.

**Python** is my language for data science, AI, and rapid prototyping. I engineered an end-to-end NLP pipeline for the 311 project that classifies ~19,000 Boston parking reports using fuzzy keyword matching with Levenshtein distance and false-positive mitigation via NLTK. More recently, I built a production-ready Retrieval Augmented Generation (RAG) system using LangChain, OpenAI GPT models, and ChromaDB vector search, implementing a scalable document pipeline (PDF/HTML/Markdown extraction) with a YAML-configurable CLI for dynamic model and embedding tuning. In academic contexts, I've used Python extensively for ML/AI coursework at Northeastern—implementing algorithms in machine learning, training neural networks with PyTorch, and performing statistical analysis with Pandas and NumPy. Python's flexibility and ecosystem make it ideal for experimentation and data exploration before productionizing insights.

**SQL** powers analytics and data infrastructure. At Wishroute, I designed scalable data models and wrote complex queries powering real-time KPI and analytics dashboards that provided business intelligence for both internal teams and customers. I'm comfortable optimizing query performance, reasoning about data relationships, and building models that align technical schema with business logic.

I'm also proficient in **Java** (enhanced backend features in AWS serverless architecture at Wishroute), **Bash** (infrastructure scripting and CloudFormation automation), and **Lua** (EHR middleware on EC2 for FHIR R4 data transformation). My language flexibility reflects my philosophy: choose the right tool for the problem. I learn quickly and adapt my stack to match project needs—whether that's reaching for Python for ML velocity, TypeScript for type-safe distributed systems, or SQL for data-driven insights.

1. Do you have at least 0 to 2 years of experience in software development with a focus on AI and machine learning applications? If yes, please briefly describe your experience.

Yes, I have over 2 years of experience in AI/ML development. During my AI concentration at Northeastern, I implemented machine learning algorithms and neural networks using PyTorch. Also while at Northeastern, and in partnership with the Boston Cyclists Union, I built an end-to-end NLP pipeline for my 311 Infrastructure Issue Identifier project, where I was able to classify ~19,000 parking reports using fuzzy keyword matching. Additionally, I developed a production-ready RAG system with LangChain, OpenAI models, and ChromaDB for document querying. At Eden, I led and contributed to AI initiatives in healthcare data processing, but these projects were limited by the startup's early stage.

2. Please describe a more technical challenging project and associated software engineering activities. What made it challenging and what were some creative solutions you employed to overcome those challenges, what tradeoffs did you choose?

The 311 Infrastructure Issue Identifier was technically challenging due to its high intra-corpus similarity, stemming from the fact that every document was dealing with illegal parking and other transportation and infrastructure reports, standard embeddings were ineffective for differentiation. After consulting my peers and mentors, I pivoted to keyword-based fuzzy matching using Levenshtein distance, implementing proportional edit distance caps (edits ≤ 1/5 token length) and NLTK dictionary filtering to mitigate false positives and increase the utility of the resulting classifications. Some of the tradeoffs of this pivot included sacrificing a bit of the classification rate for extensibility and high utility. With the new fuzzy matching structure, new categories require only dictionary entries and provide highly accurate results. In the context of the project, these tradeoffs made sense. Trends and geospatial clusters still emerge with the reduced number of classifications, and the quality of the data increased, meaning confidence in taking decisions from the tool increased as well.

3. A GenAI feature for an internal product is stuck at 20% adoption. The Product Manager wants more features. Leadership wants mandates. What do you do?

The first step would be to gather more actionable data on the low adoption rate through user feedback. This can elucidate the root cause of the friction. Based on the feedback, we can idenfity the root cause, and in collaboration with the PM, we can prioritize features that address the friction rather than adding more features which may increase the friction. In terms of mandates of company policy, I personally feel that a co-operative approach will lead to better adoption metrics rather than top-down tool use mandates. These strategies can take the form of training sessions, phased rollouts, or trail periods where more extensive analytics are collected and analyzed. The goal should be sustainable growth through collaborative iterative improvements which focus on user-centric design.

4. We have a production bug in a new AI-first external product. The agents suggests a 200-line refactor. There are 2 hours until a critical client demo. Ship it?

No, do not ship it! Rushing the refactor could (almost certainly will) introduce new bugs or create an incomplete fix, ultimately damaging trust with the client. For a more sustainable approach to fixing the bug, a minimal hotfix to stabilize the system and rescheduling the demo if possible should be prioritized, with clear communication on how we will deliver the proper refactor after the demo to strengthen the client relationship through transparency and open communication.

5. An AI agent has just submitted a 500-line Pull Request that passes all existing unit tests. Describe your process for reviewing this code to ensure there are no subtle logic drifts or lazy patterns.

First I would start with a high-level overview of the changes, walking through each aspect of the changes in order to check for logical consistency as well as adherence to our coding standards. I would then review the unit tests to make sure the changes don't introduce any edge cases or new behavior that is not covered by the harness. Then I would inspect for potential security vulnerabilities or performance issues. Throughout this process, I would be on the lookout for lazy patterns like excessive nesting, magic numbers, or lack of or improper error handling. As a final sanity check, the feature requirements should be cross referenced to ensure no feature drift. If there are any identified issues, I can converse with the agent about these issues and potential resolutions and pull in other members if logical or feature based clarification is needed.

6. You’ve noticed the AI agent is repeatedly making the same mistake. Instead of fixing the code manually, how would you fix the agent's mental model for future iterations?

First, I would investigate the mistake pattern to try and drill down into the underlying reason causing the repeat offences. This can be achieved by investigating the global/system prompt, the tools the agent has access to, or any orchestration configurations that might be causing these mistakes. If none of the infrastructure around the model is found to be causing these mistakes, the issue may lie with the models training dataset or methodology. In this case, the issue would be more systemic and might require the mistake patern be raised and addressed with more dedicated resources or team members.

7. Describe one shipped AI feature you personally owned end-to-end in the last 24 months. What was your exact scope, stack, measurable outcome, and what broke after launch?

I owned the development of a personal Retrieval Augmented Generation system end-to-end. The scope included designing the document ingestion pipeline, implementing the vector database and search, and building the CLI for runtime config. 

Stack: Python with LangChain, OpenAI GPT models, and ChromaDB.
Measurable outcome: Successfully processed and queried multiple document types with high relevance. 
Post-launch: minor bugs in PDF parsing were observed, which I fixed by adding better error handling and format validation.

8. In a world where AI can generate code 10x faster than humans, how do you prevent systemic bloat, where the codebase grows so fast and becomes so complex that no human can understand it anymore?

To address this problem, the infrastructure, both technical and organizational, should be designed to facilitate sustainable product growth. Technical infrastructure can include code analysis software, and even additional agents/subagents specifically tasked with managing growth, complexity, and product velocity. Organizationally, architectural design can emphazise abstraction, modularity, and reusability can be emphasized to ensure that the product direction can achieve sustainability. Alongside this, organizing sprints to effectively manage separation of concerns and regular refactorization to reduce complexity can help to mitigate systemic bloat.

9. Give an example where a technically "working" AI output was not defensible. How did you detect it, document it, and prevent recurrence?

In my 311 Infrastructure Issue Identifier project, the initial unsupervised classification produced a "working" model, complete with high classifcation metrics including a 0.70 silhouette score, but it failed to provide "useful" classifiactions. When re-evaluating the strategy, it became clear that the unsupervised strategy was unable to  differentiate the infrastructure issues due to high contextual similarity. This was detected through repeated classification and tracking key documents to determine any patterns in the misclasifiations. The issue was documented in the project writeup and report, alongside documentation in the unsupervised classification infrastructure. The recurrence was prevented by switching the high-level classification strategy to rule-based fuzzy matching and data engineering.