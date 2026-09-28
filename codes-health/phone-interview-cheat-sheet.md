Elevator Pitch/Bio:
    - Devops and Software engineer
    - Want to grow into solutions architect role
    - Hands on experience architecting healthcare cloud native SaaS
        - Compliance: HIPAA, SOC Type II
        - EHR integrations
    - Pragmatic, curious, growth-oriented engineer across domains
        - Software, Transportation, Urban Development, Physical Engineering all have cross-domain systems engineering applicibility
    - 

How Codes Health fits into legal case timeline:
    1. Client Intake: (~5 min)
        - Validate new record requests
        - Location of client care sites
        - Determine fastest way to records
    2. Record Retrieval: (14 days)
        - Agentic system retrieves records until complete
            - Is this where 'infinite loop' problems come up?
                Solution styles:
        - Uses a mixture of AI and humans to determine best strategies, completeness, etc.
    3. Case-rediness: 
        - Complete interactive dashboard with the whole medical picture

Filevine Partnership:
    - Integration with LOIS: Legal Operating Intelligence System
        - Connects contracts, matters, legal documents into single operating platform

Relating Eden to Codes:
    - Engineering:
        - High developer ownership: projects taken end-to-end by team members
    - Infra:
        - Consists of core internal systems, with high-degree of communication with external systems across many stakeholders
        - Decided to utilize microservice vs a monolith to leverage parallel development across engineers and off-shore teams, minimizing organizational overhead, as well as increasing product flexibility as launch requirements changed
    - Problem/Product Use Case:
        - How can cutting edge technologies be applied to 'analog' workflows to maximize human advantage?
            - Eden: Reduce admin burden from healthcare providers; Codes: reduce record retrieval burden from plantiff legal teams

Appeals of this opportunity:
    - Healtcare industry
    - Real-world engineering impact
    - Cutting-edge technologies
    - Organizational growth stage presents academically intruiging technical challenges that align with my career trajectory


Questions:
    - What kinds of infrastructure or development challenges are Codes Health tackling at the moment?
    - How does the Filevine partnership influence the roadmap of Codes Health?
    - Further than 'small engineering team', what is the engineering culture like at Codes Health?
    - What does success look like for this position throughout the next 2 years?
    - How does the current system architecture leverage the current engineering modus operandi?

---
## Technical Notes:

### General Overview of FastAPI at Enterprise Grade

#### Internal Service Aspects/Considerations/Design
- Domain Driven Design: enforce separation of concern across backend domains
- **Async**
- Main router handles auth, rate limiting, DB sessions
    - This means bad/malformed/rate limited requests never make it to domains
- Data Validation Layer: pydantic schemas enforce payload validations
- Business Logic: handles core product decisions, but never touches HTTP/gRPC requests or SQL queries, relies on service layers
- Data Storage: utilizes repository pattern to expose interfaces, decoupling from actual database implementations
- Thread pools are avoided to avoid blocking the event loop

#### Infrastructure Level Aspects/Considerations/Design
- FastAPI is AGSI (Async Server Gateway Interface)
- FastAPI uses single-threaded event loop for each process
    - When the event loop reaches a long-lived step (like i/o tasks), pauses whole event loop and processes another whole event loop.
- Service Stack
    - Process Manager: Gunicorn - handles system process forks
    - Process Worker: Uvicorn - handles raw async loop
    - Rule of thumb: 1 worker process per core to avoid context switching overhead
- Database connection
    - Must use pooling because of extreme levels of processes
    - Will quickly exhaust DB connections, straining DBs, so use a proxy
        - Proxy keeps a pool of hot connections to the DB, managing them across all processes
        - Reduces overhead of opening new connections with the DB from the process level

#### Development Considerations
- Python is weakly typed, so no compilation step to catch type errors, expectation of more runtime errors than a language like Go or Rust
- Type Errors:
    - Static Analysis: Mypy or Pyright to catch type errors or others that normally would be caught by compiler
- Runtime Errors:
    - Need more healthchecks because of increased runtime errors
    - Requires explicit Kubernetes configurations to run more probes, handles runtime errors and restart infra

- Data contracts between services:
    - gRPC and protobuf can increase strict data controls: grpclib
    - FastAPI generates OpenAPI artifacts, reducing documentation overhead
