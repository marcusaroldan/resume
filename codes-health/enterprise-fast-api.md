
#### General Overview of FastAPI at Enterprise Grade

#### Internal Service Aspects/Considerations/Design
- Domain Driven Design: enforce separation of concern across backend domains
- Async!!!!
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
    - 
