Codes Health Phone Interview Prep:

General Mission and Problem Area:
    - Agents working to gather medical records for legal entities working in large scale medical cases
    - Main customers are plantiff law firms
        - What is the general course of one of these legal cases and how does Codes Health streamline?

Current Stage of the Company: 'Hyper Scaling'
    - What kinds of problems are they trying to solve now?
        - Infrastructure scaling, how do you take a working product and make it work for 100x more users, reliably, consistently, without breaking the illusion for the customer?
        - Are there small infrastructure issues that now become platform breaking, or become fincancial liabilities at the new scale?


Infrastructure notes:
    - Has to deal with medical PHI, so security in transit and at rest, comprehensive logging of all platform activities
    - Nationwide access so distributed system across regions
    - Has to integrate with existing systems, so SSO is imperative


Filevine integration: existing platform for case file management
    - LOIS platform: Legal Operating Intelligence System
        - Connects contracts, matters, documents into single operating platform
    

Y Combinator Profile:
    - Founders: Cody Durr (CTO), Austin Mills
    
Glassdoor from Jun 2026:
    - Round 1: Recruiter/Hiring Manager
    - Round 2: CTO
    - Round 3: Engineer (System Design)
    - System Design Question:
        - Infinite Follow-up system displayed on a Calendar


Relating Eden to Codes Health:
    - Infrastructure
        - Core internal systems, high-degree of communication with external services/systems?
        - Current architecture? Monolith, microservices, etc.
            - How are key adjascent services like auth, RBAC, monitoring/compliance handled?
            - How does the system architecture leverage current development team landscape?
        - At Eden, high degree of developer ownership. Most projects started and finished with the same developer through to deployment/integration with existing services
            - Utilized off-shore dev teams to maximize bootstrapped resources
            - Wanted to maximize parallelization via microservice architecture, allowed independent work across projects, minimized overhead spent on branch management, etc.
    - Problem/Use Case
        - How can cutting-edge technologies be applied to 'analogue' use-cases in healthcare to maximize the human impact?
            - Eden: What are the administrative burdens that healthcare providers feel? How can we minimize these burdens to maximize the human-impact in these workflows? Very similar to Codes Health: Is it better to have legal teams chasing down records for months or to build a case with all the facts and all the mental energy dedicated there?

What appeals to me about Codes Health?
    - Healthcare related, real world engineering impact
    - Technically interesting stage of the organization
    - Targeted use-case for Agents


Questions for them:
    1. 

Technical aspects to review:
    - FastAPI backends at scale