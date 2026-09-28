# Eden Health Backend - Project Summaries

**Author:** Marcus Roldan  
**Period:** 2024-2025  
**Organization:** CareWallet/Eden Health

---

## AWS CDK Infrastructure Implementation

Architected and deployed a comprehensive healthcare infrastructure platform using AWS CDK with TypeScript, managing 18 CloudFormation stacks across 250+ AWS resources including Lambda functions, DynamoDB tables, API Gateways, VPC networking, and Cognito authentication. Implemented infrastructure-as-code best practices with modular stack design, cross-stack dependencies, and environment-based configuration supporting dev, staging, and production deployments. Established a robust 4-tier testing strategy achieving 85% code coverage through unit tests, integration tests, end-to-end user journey validation, and performance benchmarking with automated CI/CD pipelines completing in under 15 minutes.

Designed and implemented security-first architecture with HIPAA compliance validation using CDK-Nag, enforcing encryption at rest and in transit, IAM least-privilege policies, VPC isolation for sensitive services, and comprehensive audit logging. Built sophisticated monitoring and alerting infrastructure with CloudWatch dashboards, SNS notifications for critical events, and custom metrics tracking API performance (P95 <500ms), Lambda cold starts (<3s), and DynamoDB query performance (P95 <100ms). Optimized infrastructure costs through auto-scaling policies, pay-per-request DynamoDB billing, and Lambda memory configuration analysis, reducing monthly operational costs by 30% while maintaining sub-2-second response times for patient registration workflows under 1000 concurrent users.

---

## Agent Backend (BFF) - Healthcare API Aggregation Layer

Developed a production-ready Backend-for-Frontend (BFF) service using Node.js 18.x and TypeScript, serving as a unified API gateway for external healthcare integrations with insurance verification, doctor search, patient management, appointment booking, and emergency alert capabilities. Architected RESTful API endpoints with Express.js deployed on AWS Lambda, implementing API key-based authentication, comprehensive error handling, and CORS configuration for cross-origin requests. Integrated multiple healthcare microservices including pVerify insurance verification proxy, IguanaX EHR middleware for AthenaHealth/Epic integration, and internal patient/doctor backend services, transforming disparate data formats into standardized JSON responses.

Implemented sophisticated service orchestration patterns with retry logic, circuit breakers, and fallback mechanisms to ensure 99.9% uptime for critical healthcare workflows. Built comprehensive test suite with 20 unit tests achieving 100% pass rate, covering authentication flows, request validation, service integration, and error scenarios. Designed flexible search and filtering capabilities for doctor discovery with fuzzy matching, specialty filtering, insurance provider matching, and pagination support handling 10,000+ provider records. Published package to GitHub Packages (@CareWallet/agent-backend@1.0.8) with semantic versioning, automated deployment pipelines, and comprehensive API documentation including Postman collections for external team integration.

---

## Patient Backend - Healthcare Data Management Service

Built a TypeScript-based serverless patient management system deployed on AWS Lambda, providing secure CRUD operations for patient records, OTP-based authentication, document uploads, and appointment scheduling with DynamoDB persistence and S3 file storage. Implemented dual authentication architecture supporting both session-based authentication for direct client access and service token authentication for internal microservice communication, with DynamoDB-backed sessions (15-minute expiration) and PBKDF2-SHA512 password encryption. Developed comprehensive patient onboarding workflow with phone-based OTP verification (60-second rate limiting), multi-step form validation, insurance information collection, and government ID/insurance card document uploads with automatic S3 lifecycle management.

Architected data models supporting complex healthcare workflows including patient demographics, insurance details (policy holder, member ID, group number, effective dates), document references, and appointment history with proper indexing for efficient queries. Implemented Global Secondary Indexes (GSI) for patient lookup by phone number, date of birth, and email with sub-100ms query performance. Built stateless API endpoints for external integrations supporting patient profile creation, updates via patientId or phoneNumber, and upsert logic preventing duplicate records. Achieved 85% test coverage across 54 tests covering entities, utilities, middlewares, services, routes, and managers with comprehensive mocking of AWS services for isolated unit testing.

---

## Doctor Backend - Clinical Staff Management Platform

Developed a TypeScript serverless backend for clinical staff operations, providing patient management, emergency alert notifications, authentication, and dashboard capabilities deployed on AWS Lambda with Express.js. Implemented sophisticated dual authentication system supporting session-based authentication with DynamoDB session store (carewallet-doctor cookie, 15-minute expiration) and service token authentication for internal microservice communication with JSON user context parsing. Built emergency alert system integrating AWS SNS for real-time notifications to on-duty clinical staff, with alert severity levels (critical, high, medium, low), alert types (emergency, urgent, routine), and comprehensive alert lifecycle tracking including acknowledgment, resolution, and response time metrics.

Architected alert data model with composite sort keys (status_createdAt) enabling efficient queries for active alerts, alert history, and performance analytics with DynamoDB pay-per-request billing and encryption at rest. Implemented patient search functionality with multiple criteria (patientId, lastName, firstName, phoneNumber, dateOfBirth) using OR logic and partial matching for flexible discovery. Built S3 integration for medical document storage with multipart upload support, temporary staging (24-hour TTL), and permanent storage with proper ACL configuration. Achieved 100% test coverage on authentication middleware and alerts route across 74 tests covering entities, utilities, middlewares, services, routes, and managers with comprehensive AWS SDK mocking.

---

## pVerify Proxy - Insurance Verification Microservice

Engineered a Node.js microservice deployed in AWS VPC providing secure proxy layer for pVerify insurance verification and validation APIs, handling authentication, request transformation, and response normalization for healthcare insurance eligibility checks. Implemented comprehensive insurance verification workflow supporting 500+ payer codes (Aetna, Blue Cross, Cigna, etc.) with automatic payer code lookup by name, provider NPI validation, member ID verification, and date of service eligibility checking. Built request validation layer ensuring required fields (payerCode/payerName, providerLastName, providerNPI, memberID, patientDOB, practiceTypeCode, dateOfService) are present with detailed error messages for missing or invalid data.

Architected VPC deployment with private subnet isolation, security group restrictions, and Secrets Manager integration for secure credential management (clientApiID, clientSecret) with automatic token refresh and caching in DynamoDB. Implemented debug mode for integration testing allowing request logging without external API calls, reducing development costs and enabling comprehensive testing scenarios. Built error handling with proper HTTP status codes (400 for validation errors, 500 for internal errors) and structured error responses including detailed error messages and field-level validation feedback. Designed for high availability with Lambda auto-scaling, VPC endpoint connectivity to DynamoDB and Secrets Manager, and comprehensive CloudWatch logging for audit trails and troubleshooting.

---

## IguanaX EHR Middleware - Healthcare Data Transformation Service

Architected a Lua-based healthcare data transformation middleware deployed on EC2, serving as an integration layer between Eden Health AWS backend and Electronic Health Record (EHR) systems (AthenaHealth, Epic), transforming vendor-specific API payloads into FHIR R4 compliant data structures. Implemented comprehensive transformation pipeline with vendor adapter dispatch, code mapping (gender codes M→male/F→female, language codes EN→en/ES→es), date normalization (MM/DD/YYYY to ISO 8601), name parsing (prefix, given names, family name, suffix), and address parsing (multiple addresses with line, city, state, postal code). Built FHIR R4 Bundle builder wrapping Patient, Appointment, and Practitioner resources with proper metadata, identifiers, and references conforming to FHIR specification.

Developed modular architecture with clear separation of concerns: ATH/ (AthenaHealth adapter), TRN/ (transformation orchestration), MAP/ (code mapping), VAL/ (validation), FHIR/ (bundle builder), AWS/ (Lambda integration), RETRY/ (exponential backoff), CFG/ (configuration), LOG/ (structured logging), and ERR/ (error formatting). Implemented comprehensive validation layer with field-level assertion, schema validation against resource definitions, and complete payload validation with detailed error messages. Built AWS Lambda integration with HTTP posting, callback invocation, response parsing, and retry logic with exponential backoff for resilient external service communication. Achieved extensive test coverage with 30+ test files covering adapter transformations, orchestration routing, validation logic, code mapping, AWS integration, API endpoints, FHIR compliance, and error handling scenarios.

---

## Athena Adapter - AthenaHealth API Integration Client

Developed a comprehensive Lua-based API client for AthenaHealth EHR system integration, providing 23 specialized methods for patient management, provider search, appointment scheduling, and insurance operations with OAuth 2.0 authentication and encrypted credential storage. Implemented complete patient lifecycle management including patient search (standard and FHIR-compliant), patient creation with duplicate detection (enhancedBestMatch), demographic retrieval with insurance and portal status, appointment history queries, and safe patient creation workflows preventing duplicate records. Built sophisticated provider discovery capabilities with specialty-based search, provider availability checking across date ranges, appointment type filtering, and department-specific provider listings supporting multi-location healthcare practices.

Architected end-to-end appointment scheduling workflows orchestrating appointment type discovery, available provider identification, time slot retrieval, appointment booking, and confirmation verification with comprehensive error handling and rollback capabilities. Implemented complete insurance management suite including top insurance package retrieval, insurance package search, patient insurance listing, insurance addition with policy holder details, insurance updates for member ID/expiration/copay changes, and insurance deletion with cancellation notes. Designed modular architecture with encrypted credential management using component-specific XML storage, OAuth token caching with expiration tracking, custom field configuration support, and comprehensive help documentation for all 23 methods. Built production-ready workflows demonstrating complete patient lookup (demographics + insurance + appointments), insurance management (add/update/delete), and appointment scheduling (type selection → provider discovery → slot booking → verification) with live/test mode toggling for safe development and testing.

---

## Resume Bullet Points


- Designed, implemented, and deployed a production-ready Backend-for-Frontend service using Node.js/TypeScript on AWS Lambda, synthesizing multiple healthcare microservices (insurance verification, EHR integration, patient/doctor management) to create single API contract for our off-shore development team
    - Enabled single api contract for off-shore team to create single point of entry for integration with backend systems

- Engineered a VPC-isolated insurance verification microservice proxying pVerify APIs with Secrets Manager credential management, DynamoDB token caching, and comprehensive request validation, creating a secure, key product pillar
    - Created secure proxy service for insurance verification, a key pillar of the product

- Maintained and extended AWS CDK infrastructure managing 18 CloudFormation stacks across 250+ resources (Lambda, DynamoDB, API Gateway, VPC, Cognito), implementing HIPAA-compliant security with CDK-Nag validation, achieving 85% test coverage and reducing operational costs through auto-scaling optimization for enhanced backend service management and orchestration

- Developed key product features for TypeScript serverless patient management system including OTP-based authentication, pVerify insurance verification integration, DynamoDB-based Redis session manager implementation
    - Patient management service was a key part of the product

- Oversaw design and development of Lua-based EHR middleware service and direct integration with AthenaOne APIs, providing FHIR R4 compliant data structures for use by key product backend services
    - Middleware development allowed backend system to interface with any EHR that we created an adapter for

Other responsibilities:
 - Coordinate with off-shore development team
 - Onboarding of new technical members
 - Met with investors to provide technical insight into the organization
 - Organized master development plan for product launch.
---