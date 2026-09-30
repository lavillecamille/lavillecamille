---
title: null
type: landing
date: "2022-10-24"

sections:

- block: about.avatar
  id: about
  content:
    text: null
    username: admin

- block: markdown
  id: questions
  content:
    title: Questions I work on
    text: |
      **What drives internal conflict, and what do our conflict data actually measure?**
      PhD thesis; *Revue française d'économie* (2019); *Journal of Peace Research* (2025). [Wide angle →](/wide-angle/)

      **How do access to land and its governance shape both conflict and resilience in drylands?**
      Cross-border transhumance between Niger and Nigeria; Sudanese refugee women in eastern Chad; the JASS programme in Mali and Niger. [Chad and the Sahel →](/sahel/)

      **How do conflict, displacement and environmental degradation compound each other in protracted crises?**
      Eastern DRC, Yemen, Syria, Papua New Guinea. [Central Africa →](/central-africa/) · [Middle East →](/middle-east/) · [Pacific →](/pacific/)

      **Who carries climate risk, and who gets climate finance?**
      Chad's climate-finance readiness; risk sharing in World Bank projects; Japan's bilateral climate finance. [Wide angle →](/wide-angle/)
  design:
    columns: "2"

- block: markdown
  id: regions
  content:
    title: Close-ups and wide angle
    text: |
      <img src="/images/workmap.png" alt="Map of the countries I work on, by region and type of work" style="width:100%; margin-top:1rem;">

      <p style="font-size:0.85rem; color:#666; margin-top:0.5rem;">Base map: Natural Earth, via the rnaturalearth R package.</p>

      **Close-ups:** [Chad and the Sahel](/sahel/) · [Central Africa](/central-africa/) · [Middle East](/middle-east/) · [Papua New Guinea and the Pacific](/pacific/)

      **Wide angle:** [Shocks, arms and finance](/wide-angle/)
  design:
    columns: "1"

- block: collection
  id: publication
  content:
    title: Recent publications
    text: |-
      {{% callout note %}}
      [All publications](/publication/), or by region: [Chad and the Sahel](/sahel/) · [Central Africa](/central-africa/) · [Middle East](/middle-east/) · [Pacific](/pacific/) · [Wide angle](/wide-angle/).
      {{% /callout %}}
    count: 6
    filters:
      folders:
      - publication
      exclude_featured: false
  design:
    columns: "2"
    view: citation

- block: markdown
  id: research
  content:
    title: Research agenda
    text: |
      My current research asks how land and natural resources shape both conflict and peace in drylands and fragile settings.

      - **Land degradation, peace and security.** Why relatively safe areas hosting displaced people come under heavy environmental pressure and become political bargaining spaces, and what inclusive community governance of land can achieve there.
      - **Who carries climate risk?** Domestic contractors, climate shocks and project performance in World Bank procurement (with Paul Vernus, CERDI).
      - **Gender and climate finance.** What climate-finance tags reveal, and hide, about gender integration: lessons from Japan (with E. Tan and T. Kamninga, ODI Global).
      - **From the PhD.** Grassland scarcity and herder–farmer conflict across the Niger–Nigeria border; the politicisation of religion and the timing of political conflict.
  design:
    columns: "2"

- block: portfolio
  id: projects
  content:
    title: Work in progress and replication files
    filters:
      folders:
      - project
    default_button_index: 0
    buttons:
    - name: All
      tag: '*'
    - name: Work in progress
      tag: Project
    - name: Working papers
      tag: Working paper
    - name: Replication files
      tag: Replication
  design:
    columns: "1"
    flip_alt_rows: false
    view: citation

- block: experience
  id: experience
  content:
    title: Positions
    date_format: "2006"
    items:
    - title: Research Fellow
      company: Civil War Paths, University of York (UKRI Future Leaders Fellowship)
      company_url: https://www.civilwarpaths.org/
      company_logo: ""
      location: ""
      date_start: "2025-01-01"
      date_end: "2026-12-31"
      description: ""
    - title: Associate Researcher
      company: CERDI, Université Clermont Auvergne
      company_url: https://cerdi.uca.fr/
      company_logo: ""
      location: Clermont-Ferrand, France
      date_start: "2023-01-01"
      date_end: ""
      description: ""
    - title: Research Fellow, Climate and Security Risks
      company: ODI Global, Global Risks and Resilience
      company_url: https://odi.org/en/about/our-work/global-risks-and-resilience/
      company_logo: ""
      location: Paris, France
      date_start: "2023-09-18"
      date_end: "2026-09-30"
      description: Applied research and policy advice on climate, conflict and governance in Chad, Mali, Niger, eastern DRC, Syria, Yemen and Papua New Guinea.
    - title: Short-Term Consultant
      company: World Bank, Sahel Adaptive Social Protection Program
      company_url: https://www.worldbank.org/
      company_logo: ""
      location: Paris, France
      date_start: "2023-05-01"
      date_end: "2023-09-01"
      description: Systematic review of the effects of social safety nets in fragile, conflict and violence-affected contexts.
    - title: Researcher
      company: IHEDN, Chair of Defence Economics
      company_url: https://ecodef-ihedn.fr/
      company_logo: ""
      location: Paris, France
      date_start: "2022-03-01"
      date_end: "2023-09-01"
      description: Research in defence economics and conflict analysis; teaching for defence professionals.
    - title: Consultant
      company: AFD, Macroeconomic Analysis and Country Risk Division
      company_url: https://www.afd.fr/
      company_logo: ""
      location: Paris, France
      date_start: "2017-06-12"
      date_end: "2017-07-19"
      description: Analytical framework for socio-political risk in country-risk analysis.
    - title: Research Assistant
      company: FERDI, Peace, Security and Development
      company_url: https://ferdi.fr/
      company_logo: ""
      location: Clermont-Ferrand, France
      date_start: "2015-12-11"
      date_end: "2017-09-30"
      description: Research on peace, security and development in the Sahel.
  design:
    columns: "2"

- block: accomplishments
  id: education
  content:
    title: Education
    date_format: "2006"
    items:
    - title: PhD in Economics
      organization: Université Clermont Auvergne, CERDI
      organization_url: https://cerdi.uca.fr/
      url: https://theses.hal.science/tel-04008083
      certificate_url: ""
      date_start: "2017-10-01"
      date_end: "2021-12-15"
      description: "Thesis: *The structural causes of internal conflict in low- and middle-income countries*. Supervised by G. Rota-Graziosi (economics), M. Foucault (political science) and T. Cantens (anthropology); examiners M. Couttenier and V. Pons. Associated with IRSEM; funded by a doctoral grant from the French Ministry of the Armed Forces (DGRIS)."
    - title: Master's in Economic Analysis and International Development (Magistère)
      organization: Université Clermont Auvergne (previously Université d'Auvergne Clermont Ferrand 1) 
      organization_url: https://www.uca.fr/
      url: ""
      certificate_url: ""
      date_start: "2013-09-01"
      date_end: "2015-09-01"
      description: ""
    - title: Licence in Economics 
      organization: Université Clermont Auvergne (previously Université d'Auvergne Clermont Ferrand 1), France
      organization_url: https://www.uca.fr/
      url: ""    
      certificate_url: ""
      date_end: "2013-07-02"
      date_start: "2012-09-01"
  design:
    columns: "2"

- block: markdown
  id: service
  content:
    title: Teaching, service and uptake
    text: |
      **Teaching.** Guest lecturer, University of Fribourg, MA in Political Economy (2024–2026); Université Paris 1 Panthéon-Sorbonne, master's for managers and engineers of the DGA (2023).

      **Referee.** *Communications Earth & Environment*, *Defence and Peace Economics*, *Revue d'économie politique*, *Revue française d'économie*, *Globalization and Health*, *Revue internationale des études du développement*.

      **Selected presentations.** LANDac Conference, Utrecht (2026); Civil War Paths Annual Conference (2026); ICPALD–SPARC–Jameel Observatory Conference, Nairobi (2025); Public Choice Society (2022, 2023); European Public Choice Society (2023); Meta-Analysis in Economic Research Colloquium, Kyoto (2022); HICN Workshop (2021).

      **Used and cited by.** SIPRI (2026) on refugee integration in Chad; the World Bank's operational lessons on adaptive social protection in Chad (2025); ILO (2025) and CREWS (2024) on climate resilience in fragile settings.
  design:
    columns: "2"

- block: contact
  id: contact
  content:
    title: Contact
    text: |-
      laville.ecodef[at]gmail.com

      Open to research collaborations, and to selected advisory work on conflict and climate-security analysis, evidence reviews, scenario and risk analysis, and programme and financing assessments in fragile settings, in French and English. See [selected assignments](/assignments/).
    address:
      city: Paris
      country: France
  design:
    columns: "2"
---
