Engineering experience

    Describe a skill or knowledge you acquired recently that has been impactful for you. Why did you make this investment? What has the outcome been?
        - 
    What new skill would you like to learn? Why do you think this is important or timely or interesting? Why do you think you will be good at it?
        - 
    What kinds of software projects have you worked on before? Which operating systems, development environments, languages, databases?
        - Eden:
        - Wishroute:
        - 311:
        - Custom E-reader:
        
    Would you describe yourself as a high quality coder? Why?
        - Yes, stems from a position that any code that compiles will be understood by the machine, but socially-concious code is what will be understood by future developers
    Describe your experience building large systems with many services - web front ends, REST APIs, data stores, event processing and other kinds of integration between components. What are the key things to think about in regard to architecture, maintainability, and reliability in these large systems?
        - Eden Backend Services, microservice architecture - why? because of different needs of stakeholders, encapsulating strict functionality allows for decoupled development, maintenence etc.
            - Stakeholders/External Access: backend needed to support/communicate with Insurance Providers, Healthcare Providers, and Patients to access subsets of features (subsets were also subject to change)
            - By designing the features as loosely coupled microservices, as the subsets evolved, interactions with external partners changed, features are developed, can manage scope/delegation/parallel development sustainably
        - Utilized off-shore development team to accelerate development
            - Timezones, rotating developers, timelines, etc. meant that microservices with standardized interactions/API contracts can breathe/fluctuate internally while maintaining interoperability
    Outline your thoughts on quality in software development. What practices are most effective to drive improvements in quality?
        - Quality of software (and hence software development) relies on symbiosis between user and system for achievement of some outcome
        - By balancing system's engineering needs, with the needs/habits/sensativities of users, high quality software can be achieved
            - Engineering needs and user needs change based on the environment, goals, existing software paradigms (both how software is designed/developed and how a user expects to interact with software)
        - From the perspective of the software engineer, centralizing end user experience with respect to key internal systems/architecture will allow high quality software to emerge
    Outline your thoughts on documentation in large software projects. What practices should teams follow? What are great examples of open source docs?
        - Balance of gluttony of information with concision
        - Documentation should have a clearly defined audience (can be a specific team, or someone with a specific use for reading the docs)
            - For someone interacting with a component, focus should be on how inputs/extenral information influences behavior (creating a clear contract/expectation of behaviour with respect to other software)
            - For someone that is modifying/fixing/refactoring a component, the documentation should provide detailed information on how the internal systems were developed (design considerations, restrictions, pressures, circumstances, limitations of technology, business needs at time of implementation, testing considerations, expected interactions, etc.)
        - At times, the different audiences are at odds with one another wrt documentation
            - Too much information can lead to less understanding of a component, overload of info, confusion of interactions/behaviors, wasted effort understanding internal systems when it is not necessary
        - Documentation should not be written to check a box that it exists
    Outline your thoughts on user experience, usability and design in software. How do you lead teams to deliver outstanding user experience?
        - UX should flow. Flow is based on the users needs, familiarity with the software/use case, users background, preconceptions on the software
        - As much as possible, minimize the gap between developers and users wrt the UX influences to deliver outstanding user experience 
    Outline your thoughts on performance in software engineering. How do you ensure that your product is fast?
        - Balance between efficiency, maintainability, and leveraging of current technology
        - Matters how the software is being used, if an action is taken only 100 times per day, improving performance by 0.1s will yeild 10s of effieciency, but if it is a process that executes 100k times, then 0.1s performance improvement is more valuable and might require extra maintencince for that gain
    Outline your thoughts on security in software engineering. How do you lead your engineers to improve their security posture and awareness?
        - Security should be an ensemble approach where faults are expected but not welcome (i.e. always assume that a security measure might/will be breached)
        - Create enough cover that one measures failure does not cascade
        - Clearly outlining attack surfaces, gaming out what breaches in security would mean for specific components, how cyber sec best practices can apply to current development, etc.
    Outline your thoughts on devops and devsecops. Which practices are effective, and which are overrated?
        - Limited experience with devops and devsecops, but from my experience, utilizing IaC to create automatic, repeatable deployments takes a bit of up front investment, but is worth the effort, especially as infrastructure increases in scale and complexity
        - Utilizing federated authentication services is also good because of the single use key that is generated, meaning a breach does not compromise future deployments
        - As with SwDev, balancing granularity with coupled deployments and ensuring that feate deployments can target specific infrastrucutre sets will improve continuous development cycles
Domain Specific Experience

    Outline your thoughts on open source software development. What is important to get right in open source projects? What open source projects have you worked on? Have you been an open source maintainer, on which projects, and what was your role?
        - I think open source development should be the primary modus operandi in a perfect world. As our entire lives become increasing intertwined with technology and software, the transparency and user focused philosophy of open source development pushes towards sustainable, transparent software which aims toward real improvements of the users lives
        - In open source projects, structuring the 'meta infastructure' is extremely improtant in order to leverage the community that open source software can build. By establishing clear lines of discussion in terms of product direction; SOPs for contributions, bug reporting and fixes; installation and extension documentation; the 'development load' can be distributed amongst a community of contributors, where some degree of self sorting allows people to find their niche and maximize their contributions. Of course, this opens a whole new dimension of maintenence, but when organized and communicated thoughtfully with just enough structure to maintain order and velocity, an open-source project can operate at a high level of efficiency while delivering a quality user-focused project that is affordable to all
        - I have not directly contributed to any open source projects, but in the future once I feel I have the experience, time, and alignment with a project I care about, I would very much like to have that experience.
    How comprehensive would you say your knowledge of a Linux distribution is, from the kernel up? How familiar are you with low-level system architecture, runtimes and Linux distro packaging? How have you gained this knowledge?
        - My knowledge of a Linux distribution is at a moderate level. I have used Ubuntu exclusively for almost 16 months. In that time I have familiarized myself with the basics of interacting with the system, making personalizations, and leveraging its incredible features.
        - From my understanding, a Linux distribution consists of the operating system and then a desktop environment. The operating system interacts with the kernel and low-level systems to carry out processes and facilitate user interaction and behavior in the desktop environment. In that sense, different distros have different ways for user interaction with the computer, and offer different levels of guardrails and exposition of internal systems to users. In this way, the modular nature of distros allows for a whole gradient of user experiences, all built on common low-level software to some extent or another.
        - I have gained my limited knowledge of Linux distributions through various efforts to personalize my computational experience over the last 16 months, as well as troubleshooting various issues that have arisen in my system throughout that time. For example, I was experiencing an issue with my Bluetooth connection, necesitating my investigation of the various daemons and services that govern Bluetooth and manage the service for the user. After tracing the issues all the way to my bluetooth card, I was able to determine that my motherboard was not giving any power to the card, and hence the service was not working at all.
    Detail your experience and contributions to any Linux distributions. You might include details of any work in Ubuntu, Debian, Fedora, NixOS, Arch Linux, etc. Feel free to include links to any notable contributions.
        - I have never contributed to any Linux distributions.
    Outline your experience with software packaging. This might include work with Debian packaging, RPMs, Snaps, Nix packages, Dockerfiles or otherwise.
        - I have limited experience with software packaging, but at Eden we utilized a private NPM registry for our package management and deployement. Additionally, for a few of our microservices we utilized Dockerfiles on various AWS infra
    According to your experience so far, how would you engineer a release pipeline for a major software project? What tools might you use for automation, and what are the critical steps in the process that should be executed in the run up to a release?
        - I would build a simple automated pipeline that starts with changes merged into the main branch, runs linting and automated tests, creates a build artifact, and deploys to a staging environment for validation. 
        - For automation I would use a CI/CD service like GitHub Actions, GitLab CI, or a basic Jenkins setup, combined with Docker for consistent builds. 
        - Critical steps before a release include code review, automated test validation, creating a reproducible build, deploying to staging, running smoke tests, and checking release notes or deployment documentation before promoting to production.

Education

We consider academic results in high school and university for all roles, regardless of seniority. In every discipline, from engineering to marketing to operations and sales, we intensely value colleagues who are able to puzzle through difficult problems and find the optimal path forward.

    How did you rank in your final year of high school in mathematics? Were you a top student? On what basis would you say that?
        - In my final year of high school for both mathematics and my home language, I ranked in the top 10 percent of my class. I was in both the highest level of math and English, and in the final rankings of the grade (based on GPA), I was well within the top 20 of a class of 300.
    How did you rank in your final year of high school, in your home language? Were you a top student? On what basis would you say that?
        - See above
    Please state your high school graduation results or university entrance results, and explain the grading system used. For example, in the US, you might give your SAT or ACT scores. In Germany, you might give your scores out of a grading system of 1-5, with 1 being the best.
        - SAT: 1460 Superscore, 720 Math, 740 English
    Can you make a case that you are in the top 5% in your academic year, or top 1%, or even higher? If so please outline that case. Make reference where possible to standardised testing results at regional or national level, or university entrance results. Please explain any specific grading system used.
        - GPA rankings in highschool <20 out of ~300 students
    What sort of high school student were you? Outside of class, what were your interests and hobbies? What would your high school peers remember you for?
        - I was very involved in the Soccer team, being one of the leadership captains. Outside of games I was responsible for making sure equiment, personale, etc. were in order to keep everything running smoothly. On the pitch, I had a key leadership role to organize our defensive structure and dynamically adapt based on game state and individual match ups
        - I also won the Sportsmanship award my senior year, based on my consistent actions throughout my athletic career, and one key instance where I acted as a mediator after a tough loss when our supporters started to verbally abuse the referee and other team. A coach from a rival school witnessed this scene and made sure to let my coach know and to commend me for it.
        - I was also the Recording Secretary for the General Student council. In this position I contributed to planning and implementation to various school events and fundraisers. 
    Which university and degree did you choose? What other universities did you consider, and why did you select that one?
        - I went to Northeastern Univeristy, after choosing between there, Univerity of Pittsburgh, and Boston University. The city/environment of each was a fit, but the deciding factor at Northeastern was the experiential learning program, which consisted of an extensive co-op/internship program as well as an extensive network of study abroad opportunities. I was thankfully able to leverage these opportunities, which allowed my time there to be more well rounded, worldly.
    Overall, what was your degree result and how did that reflect on your ability? Please help us understand the grading system for your results.
        - University GPA: 3.41
        - This is a relatively fair reflection of my abilities and performance throughout my time at Northeastern. While it might not be a perfect score, it reflects the intensity of the computer science program, where I was challenged academically at various points. There were a few intense and challenging courses, such as Theory of Computation which was the hardest academically, while the Software Development course was rigourous in its replication of the industry (both the good and the bad).
    During all of your education years, from high school to university,  can you describe any achievements that were truly exceptional?
        - 
    What leadership roles did you take on during your education? Did you conceive of, and drive to completion, any initiatives outside of your required classwork?
        - 

Context

    Outline your thoughts on the mission of Canonical. What is it about the company's purpose and goals which is most appealing to you?
    What do you see as risky or mistaken in our offering, positioning or strategy?
    How should Canonical set about winning, commercially?
    How should Canonical amplify its impact in open source?
    Why do you most want to work for Canonical?
    What gives you the most satisfaction at work?
    What would you most want to change about Canonical?
    What gets you most excited about this role?
