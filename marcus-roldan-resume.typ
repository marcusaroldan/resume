
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Marcus Roldan"
#let locale-catalog-page-numbering-style = context { "Marcus Roldan - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Jan 2026"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 0, 0)
#let design-section-titles-font-family = "XCharter"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.2em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.55cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 9pt
#let design-text-leading = 0.6em
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = false
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "XCharter"
#let design-header-vertical-space-between-name-and-connections = 0.2cm
#let design-header-vertical-space-between-connections-and-first-section = 0.2cm
#let design-header-use-icons-for-connections = false
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.19cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0cm
#let design-page-top-margin = 0.15cm
#let design-page-bottom-margin = 0.15cm
#let design-page-left-margin = 0.15cm
#let design-page-right-margin = 0.15cm
#let design-page-show-last-updated-date = false
#let design-page-show-page-numbering = false
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Marcus Roldan

// Print connections:
#let connections-list = (
  [#box(original-link("mailto:marcusaroldan@gmail.com")[marcusaroldan\@gmail.com])],
  [#box(original-link("tel:+1-973-229-3445")[\(973\) 229-3445])],
  [#box(original-link("https://marcusaroldan.github.io/project-portfolio/)")[marcusaroldan.github.io\/project-portfolio\/\)])],
  [#box(original-link("https://linkedin.com/in/marcusaroldan")[linkedin.com\/in\/marcusaroldan])],
  [#box(original-link("https://github.com/marcusaroldan")[github.com\/marcusaroldan])],
)
#connections(connections-list)



== Professional Summary


#one-col-entry(
  content: [Software Engineer with two years of experience delivering production-ready backend, ML, and AI solutions in fast-paced startup environments. Led technical teams and built scalable products using Python, Java, TypeScript, AWS, and modern frameworks and architecture patterns. Skilled at translating organizational goals into effective technical solutions by designing and deploying secure healthcare microservices, architecting cloud infrastructure, and creating data-driven dashboards that improved decision-making for both internal and customer stakeholders. Recognized for quickly adapting to shifting priorities, mentoring engineers, and driving projects from concept to launch.]
)


== Experienced in


#one-col-entry(
  content: [#strong[Frameworks\/Libraries]: AWS CDK, AWS SDK, Express.js, OAuth 2.0, FHIR R4, Jest, Flask, React, LangChain, Scikit-Learn, PyTorch]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Cloud\/AWS]: Lambda, EC2 with Instance Connect, DynamoDB, S3, VPC with NAT Gateway, API Gateway, IAM, Cognito, Secrets Manager, ACM, CloudFormation, CloudWatch, SSM, SNS, Route 53]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Architectural Patterns]: Microservices, Backend-for-Frontend, Serverless, Service Oriented, Event Driven, Proxy and Adapter Patterns, Circuit Breaker Pattern, IaC, CI\/CD implementation]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages]: TypeScript, JavaScript, Bash, Python, Java, SQL, Lua]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[AI\/ML Tools]: Amazon Bedrock, SageMaker, Rekognition, Textract; OpenAI Models; HuggingFace; NLTK; Pandas; NumPy; Matplotlib]
)


== Work Experience


#two-col-entry(
  left-content: [
    #strong[Founding Engineer, Lead Technical Engineer, Forward Deployed Software Engineer], #link("https://edenonearth.ai/")[Eden, Inc.] 
  ],
  right-content: [
    Jan 2025 – Jan 2026
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Designed, implemented, and deployed a production-ready Backend-for-Frontend service using Node.js\/TypeScript on AWS Lambda, synthesizing multiple healthcare microservices \(insurance verification, EHR integration, patient\/doctor management\) to create single API contract for the off-shore development team.],[Engineered a VPC-isolated insurance verification microservice proxying pVerify APIs with Secrets Manager credential management, DynamoDB token caching, and comprehensive request validation, creating a secure, key product pillar.],[Maintained and extended AWS CDK infrastructure managing 18 CloudFormation stacks across 250+ resources \(Lambda, DynamoDB, API Gateway, VPC, Cognito\), implementing HIPAA-compliant security with CDK-Nag validation, achieved 85\% test coverage and reduced operational costs through auto-scaling optimization for enhanced backend service management and orchestration.],[Developed key product features for TypeScript serverless patient management system including OTP-based authentication, pVerify insurance verification integration, DynamoDB-based Redis session manager implementation, to provide financially efficient and scalable product feature implementations.],[Oversaw design and development of Lua-based EHR middleware service and direct integration with AthenaOne APIs, providing FHIR R4 compliant data structures for use by key product backend services, maximizing the development team's velocity by providing specifications and feedback to an intern who handled the implementation.],[Led team growth and development during a leadership transition by designing and implementing onboarding and mentorship programs, guiding technical vision, and managing strategy, which enabled rapid integration, fostered a collaborative culture, and ensured organizational stability..],[Delivered MVP for product launch by leading feature development, improving architecture with AWS serverless microservices, and building an investor demo, which accelerated product validation and increased stakeholder engagement.],[Transitioned the team to Agile Scrum by establishing SOPs, improving development speed, and coordinating cross-functional teams, resulting in enhanced delivery efficiency and team alignment.],[Provided technical leadership and strategic guidance by acting as liaison for partners, investors, and third-party services, and contributing to product direction in planning and leadership discussions, ensuring alignment of technical decisions with business goals and strengthening external relationships.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Full-time Software Engineer Intern], Wishroute, Inc. -- Portland, ME
  ],
  right-content: [
    Jan 2022 – Aug 2022
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed SQL-powered KPI and analytics dashboards by designing scalable data models and queries, enabling internal teams and customers to access real-time analytics for better decision-making.],[Enhanced the Java backend within AWS serverless architecture by upgrading product features, resulting in enhanced user experience for both internal tools and customer-facing products.],[Shaped product strategy by collaborating with cross-functional teams and rapidly adjusting to shifting startup priorities, ensuring the team delivered features aligned with evolving business needs.],)
  ],
)



== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Khoury College of Computer Sciences at Northeastern University], BS in Computer Science, concentration in Artificial Intelligence 
  ],
  right-content: [
    Sept 2020 – Dec 2024
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([Honors and Badges: #strong[GPA: 3.41 \/ 4.00] | Northeastern Global Work Citizen Badge | Dean’s List],[Activities: Spanish Honors Society \(Sigma Delta Pi\), Transportation Engineering Club, Refugee and Immigrant Cross-cultural Conversation Partner Program, Computer Science Mentorship Organization],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Projects


#two-col-entry(
  left-content: [
    #strong[Personal Retrieval Augmented Generation System] 
  ],
  right-content: [
    (Python, LangChain\)
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Engineered a Python-based RAG system using LangChain and OpenAI GPT models with ChromaDB\/HuggingFace vector similarity search, implementing a scalable document pipeline \(PDF\/HTML\/Markdown\) using NLTK\/unstructured.io for extraction, and a YAML-configurable CLI enabling dynamic LLM model selection, embedding parameter tuning, and customized retrieval settings for optimal performance],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[311 Infrastructure Issues Identifier #link("https://marcusaroldan.github.io/311-infrastructure-issue-identifier/")[\(Prototype\)]] 
  ],
  right-content: [
    (Python\)
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Constructed a text-classification system using fuzzy keyword matching on Illegal Parking reports from Boston's 311 API, implementing MapBox GL visualization frontend with geospatial filtering, in collaboration with Boston Cyclist Union.],)
  ],
)



