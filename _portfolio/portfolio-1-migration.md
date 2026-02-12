---
title: "Enterprise Data Platform Modernization (SQL Server → AWS Lakehouse + Redshift + Domo)"
excerpt: "Designed and executed a multi-track enterprise migration program modernizing SQL Server + SSIS workloads into an AWS-native Lakehouse (S3 + Athena + Glue + Delta/Iceberg) and Analytics stack (Redshift + Domo), enabling scalable reporting, historical retention, and cost-efficient cloud governance.<br/><img src='/images/databricks-migration-thumb.png'>"
collection: portfolio
---

## Project Overview

This engagement focused on modernizing a legacy enterprise analytics ecosystem that was heavily dependent on **SQL Server, SSIS, stored procedures, and on-prem reporting tools**.  
The organization required a scalable cloud-native platform capable of supporting both **serverless analytics** and **high-performance warehouse workloads** for BI.

Rather than performing a simple lift-and-shift, we implemented a **multi-track modernization strategy** on AWS, ensuring data governance, historical retention, cost control, and long-term extensibility for analytics and AI workloads.

**Role**: Senior Data Engineer / Migration Lead  
**Tech Stack**: AWS S3, AWS Glue, Glue Crawlers, Athena, Delta Lake, AWS Lambda, Step Functions, EventBridge, Redshift, RDS PostgreSQL, Domo, Terraform/CloudFormation, CloudWatch, IAM, Python, SQL  

---

## Migration Strategy (Two Parallel Tracks)

To avoid disruption and reduce business risk, the migration was executed in two structured tracks:

### Track 1: SQL Server / RDS → AWS Lakehouse (Serverless Analytics)

This track focused on building a **serverless Data Lakehouse platform** where business teams could query data using Athena while maintaining schema governance and historical retention.

**Goal**: Replace heavy dependency on on-prem SQL Server compute with scalable storage + serverless query.

---

### Track 2: SQL Server / Redshift → BI Analytics Platform (Domo Enablement)

This track focused on enabling enterprise BI reporting by building a curated warehouse layer in **Redshift** and supporting downstream dashboards and KPI reporting in **Domo**.

**Goal**: Provide high-performance curated datasets for BI while maintaining security, lineage, and certification workflows.

---

## Legacy Platform (Before Migration)

The legacy data ecosystem consisted of:

- SQL Server OLTP + ODS workloads
- SSIS packages for ingestion and transformation
- Stored procedures for batch orchestration and aggregations
- Power BI dashboards built on top of SQL Server views
- Informatica jobs for integration workflows
- On-prem scheduling and runbooks for dependency handling
- Separate historical warehouse structures (HDS) maintained through incremental loads

Major limitations included:

- High cost of SQL Server compute and licensing
- Slow batch processing during peak windows
- Difficult lineage tracking across SSIS and stored procedures
- Limited ability to scale storage and historical retention
- BI reporting impacted during heavy ETL load windows

---

## Target Architecture (AWS Modernized Platform)

We implemented a layered enterprise architecture aligned to industry-standard Data Lakehouse principles.

### Data Zones

The platform was designed with strict separation of layers:

- **Raw Layer** (Landing / Immutable)
- **ODS Layer** (Operational standardized datasets)
- **HDS Layer** (Historical retention and slowly changing datasets)
- **Curated / Gold Layer** (Business-ready marts for BI & analytics)

This ensured the platform supported both operational use cases and long-term historical reporting.

---

## Track 1: AWS Lakehouse Architecture (S3 + Glue + Athena)

### Storage Foundation (S3 Data Lake)

- Designed S3 structure with standardized prefixing:
  - `/raw/`
  - `/ods/`
  - `/hds/`
  - `/curated/`
- Implemented partitioning standards (date-based, domain-based)
- Enabled lifecycle policies for cost optimization (archive tiers)

---

### Metadata & Catalog (AWS Glue Crawlers)

To ensure discoverability and governance:

- Created Glue databases per domain (finance, risk, operations, customer)
- Configured Glue Crawlers for schema inference and automated table registration
- Enabled partition discovery for scalable query performance
- Standardized naming conventions to avoid table sprawl

---

### Query & Analytics Layer (Athena + Delta Table Enablement)

To support serverless analytics:

- Built Athena query patterns aligned with BI use cases
- Enabled Delta table querying patterns for scalable table operations
- Introduced data format standards (Parquet/Delta-compatible formats)
- Implemented schema validation to prevent breaking downstream dependencies

This allowed analysts to query multi-terabyte datasets without requiring dedicated warehouse compute.

---

### Transformation & Processing

Transformations were implemented using AWS-native pipelines:

- Python-based ETL jobs running on AWS Glue / Spark runtime
- Data quality checks and schema enforcement before promoting to ODS/HDS
- Incremental loads with watermarking logic for efficient processing
- Partition optimization to avoid scan-heavy queries

---

### Orchestration & Dependency Management

Instead of monolithic SSIS chains, we built a cloud-native orchestration layer:

- AWS Step Functions for workflow orchestration
- EventBridge schedules for batch triggering
- Lambda functions for lightweight dependency checks
- Automated retries and failure routing
- CloudWatch alarms for monitoring and alerting

This improved pipeline stability and reduced operational support load.

---

## Track 2: Redshift + Domo Analytics Enablement

### Redshift Warehouse Layer

For curated analytics workloads requiring high performance:

- Designed dimensional models and reporting marts
- Implemented incremental load pipelines into Redshift
- Optimized distribution keys and sort keys for BI performance
- Established standardized views for reporting consistency

This provided a centralized warehouse layer optimized for enterprise reporting.

---

### Domo Integration & BI Modernization

Domo was used as the primary BI and reporting tool, requiring:

- Dataset publishing pipelines into Domo
- Controlled certification workflows for production KPI datasets
- Ownership, access controls, and governance alignment
- Automated refresh scheduling and dependency tracking

Key BI deliverables included:

- Curated KPI datasets for finance and operations
- Certified datasets with consistent naming and definitions
- Performance improvements for high-usage dashboards

---

## Infrastructure as Code (IaC) – Production Grade Setup

All infrastructure was provisioned and managed using Infrastructure as Code to ensure repeatability, governance, and environment consistency.

Provisioned components included:

- S3 buckets and standardized folder structures
- Glue databases, crawlers, and job configurations
- IAM roles with least privilege policies
- Athena workgroups and query output governance
- Step Functions state machines
- Lambda functions for orchestration triggers
- CloudWatch monitoring, logs, and alert rules
- Redshift cluster provisioning and networking rules
- Security policies for encryption (SSE-S3/KMS) and audit controls

This approach ensured environments could be replicated across Dev/Test/Prod without manual setup.

---

## Data Governance, Security & Compliance

To support enterprise compliance requirements:

- Enforced encryption at rest (KMS) for sensitive datasets
- Applied IAM-based access controls per domain/team
- Implemented table-level access restrictions
- Standardized audit logging and pipeline traceability
- Introduced lineage tracking through metadata registration patterns

---

## Key Engineering Challenges & Solutions

### Challenge 1: Breaking Stored Procedure Dependencies
Legacy workflows heavily depended on SQL Server stored procedures, making direct migration risky.

**Solution**
- Decomposed stored procedures into modular transformation layers
- Migrated business logic into reusable SQL/PySpark modules
- Implemented validation checkpoints between ODS and curated marts

---

### Challenge 2: Historical Data Retention (HDS Model)
The business required multi-year historical tracking for regulatory and trend analytics.

**Solution**
- Built an HDS framework with incremental snapshots
- Implemented slowly changing logic for key entities
- Maintained audit columns and change tracking metadata

---

### Challenge 3: Schema Drift and Source System Instability
Incoming feeds frequently changed column types and naming patterns.

**Solution**
- Implemented schema enforcement before promotion to ODS
- Used Glue Crawler versioning strategies
- Added automated schema mismatch alerts

---

### Challenge 4: Cost Control and Query Optimization
Athena queries and unmanaged table growth could lead to uncontrolled costs.

**Solution**
- Enforced partitioning and Parquet-based storage standards
- Implemented Athena workgroup controls for query governance
- Applied lifecycle rules to archive low-access historical partitions
- Optimized curated datasets for BI consumption to reduce scan volumes

---

## Results & Business Impact

- Successfully modernized a legacy SQL Server + SSIS ecosystem into a scalable AWS-native data platform.
- Enabled serverless analytics using Athena, reducing dependency on expensive always-on compute.
- Improved reporting performance by delivering optimized curated marts in Redshift.
- Established standardized Raw → ODS → HDS → Curated pipeline design for long-term scalability.
- Increased platform reliability through workflow orchestration, automated retries, and monitoring.
- Improved governance by implementing cataloging, naming standards, and certification-ready datasets for BI.

---

## Key Takeaways

This migration was executed as a **modernization program**, not a lift-and-shift.  
The final architecture delivered a production-grade AWS Data Lakehouse + Warehouse ecosystem, enabling both cost-efficient serverless analytics and high-performance BI reporting through Redshift and Domo.

The platform is now designed to scale for future initiatives such as:

- real-time streaming ingestion
- ML feature store development
- enterprise data governance expansion
- automated data quality scorecards
- AI-ready curated datasets
