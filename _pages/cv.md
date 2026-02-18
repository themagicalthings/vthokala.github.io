---
layout: archive
title: "Resume"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

<div style="text-align: center; margin-bottom: 2em;">
  <a href="{{ base_path }}/files/THOKALA_Data_Consultant.docx" class="btn btn--primary btn--large"><i class="fas fa-file-download"></i> Download Resume (DOCX)</a>
</div>

## Summary

**Senior Cloud Data Engineer** with 6+ years of experience designing scalable data platforms, optimizing PB-scale ETL pipelines, and implementing robust data governance frameworks. 

Currently transitioning into **GenAI Engineering**, with hands-on expertise in building RAG systems, vector search architectures, and agentic workflows using LangChain. Proven track record of reducing compute costs by **40%** and migrating **50TB+** legacy warehouses to modern Lakehouse architectures on AWS and Databricks.

## Core Expertise

*   **Cloud Data Platforms:** AWS Lakehouse, Databricks, Azure Data Factory, Snowflake
*   **Big Data Engineering:** Apache Spark, Delta Lake, Kafka Streaming, Airflow
*   **GenAI & LLMs:** RAG Pipelines, Vector Databases (Pinecone/Chroma), LangChain, Prompt Engineering
*   **Data Governance:** Unity Catalog, IAM, Data Quality (Great Expectations)
*   **DevOps & IaC:** Terraform, Docker, CI/CD (GitHub Actions), Kubernetes

---

## Technical Skills

| Category | Skills |
| :--- | :--- |
| **Cloud** | AWS (S3, Glue, Lambda, EMR, Redshift, Athena), Azure (ADLS Gen2, ADF), Databricks |
| **Big Data** | Apache Spark (PySpark/Scala), Delta Lake, Hadoop, Snowflake, Kafka |
| **GenAI** | Retrieval Augmented Generation (RAG), LangChain, LangGraph, OpenAI API, Vector DBs |
| **Languages** | Python, SQL, Scala, Bash |
| **DevOps/Tools** | Terraform, Docker, Jenkins, Git, Jira, DBT |

---

## Featured Portfolio Projects

### 🚀 SQL Server → AWS Lakehouse Modernization
**Tech Stack:** AWS S3, Glue, Athena, Redshift, Domo
*   Designed a multi-track migration strategy moving **SQL Server + SSIS** workloads to a serverless AWS Lakehouse.
*   Implemented **Delta Lake** for ACID transactions and time-travel on S3.
*   Reduced licensing costs by **60%** by eliminating legacy database servers.
*   <a href="/portfolio/portfolio-1-migration/" class="btn btn--info btn--small">View Case Study</a>

### 🌊 Legacy Hadoop → Databricks Delta Lake Migration
**Tech Stack:** Databricks, Spark, Azure Data Lake Storage (ADLS)
*   Led the migration of a **50TB+** on-premise Hadoop cluster to Databricks on Azure.
*   Optimized Spark jobs using partitions and Z-Ordering, improving query performance by **3x**.
*   Built a unified **Unity Catalog** governance layer for fine-grained access control.
*   <a href="/portfolio/" class="btn btn--info btn--small">View Project</a>

### 🤖 Enterprise GenAI Knowledge Base (RAG)
**Tech Stack:** LangChain, Pinecone, OpenAI, Streamlit, Python
*   Built a production-grade **RAG system** to index and search thousands of internal PDF documents.
*   Implemented hybrid search (Keyword + Semantic) with re-ranking to improve retrieval accuracy.
*   Deployed as a self-service internal tool, reducing information retrieval time from **30 mins to <1 min**.
*   <a href="/portfolio/portfolio-2-genai-agent/" class="btn btn--info btn--small">View RAG Architecture</a>

---

## Professional Experience

**Senior Data Engineer** \
*Current Employer* | *Tempe, AZ* \
*2020 - Present*

*   **Lakehouse Architecture:** Spearheaded the design and implementation of a centralized Data Lakehouse using **Databricks** and **Delta Lake**, serving 200+ analysts and data scientists.
*   **Cost Optimization:** Refactored inefficient legacy Spark jobs and implemented auto-scaling policies, resulting in a **40% reduction** in monthly cloud compute spend.
*   **Real-time Ingestion:** Built low-latency streaming pipelines using **Spark Structured Streaming** and **Kafka** to ingest IoT sensor data, enabling real-time anomaly detection.
*   **Data Quality:** Integrated **Great Expectations** into Airflow DAGs to automate data quality checks, stopping bad data before it reached production dashboards.

**Data Engineer** \
*Previous Employer* | *Location* \
*2018 - 2020*

*   **ETL Pipeline Development:** Developed and maintained 50+ ETL pipelines using **Python** and **SQL** to transform raw data into star-schema data marts for Tableau reporting.
*   **Migration:** Assisted in migrating on-prem Oracle databases to **Snowflake**, utilizing Snowpipe for continuous data loading.
*   **Automation:** Automating manual data reconciliation tasks using Python scripts, saving the team **15 hours/week** of manual effort.

---

## Certifications & Education

*   **Databricks Certified Data Engineer Professional**
*   **AWS Certified Solutions Architect – Associate**
*   **Master of Science in Computer Science** (Specialization in Data Science)
*   **Bachelor of Technology in Computer Science**

---

## Contact

<div style="text-align: center;">
  <a href="https://www.linkedin.com/in/magicalthings/" class="btn btn--info"><i class="fab fa-linkedin"></i> LinkedIn</a>
  <a href="https://github.com/vthokala" class="btn btn--success"><i class="fab fa-github"></i> GitHub</a>
  <a href="mailto:your.email@example.com" class="btn btn--inverse"><i class="fas fa-envelope"></i> Email</a>
</div>
