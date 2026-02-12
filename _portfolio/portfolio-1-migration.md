---
title: "Legacy Hadoop to Databricks Lakehouse Migration (AWS)"
excerpt: "Migrated a 50TB+ enterprise data warehouse from on-prem Cloudera Hadoop to Databricks Delta Lake on AWS, reducing infrastructure costs by 40% and improving query performance by 3x.<br/><img src='https://raw.githubusercontent.com/databricks-demos/dbdemos/main/images/lakehouse/medallion-architecture.png'>"
collection: portfolio
---

## Project Overview

This project focused on modernizing a legacy on-prem Cloudera Hadoop ecosystem into a scalable and cloud-native **Databricks Lakehouse architecture** on AWS.  
The existing Hadoop environment had high operational costs, long processing times, and struggled to meet peak holiday demand due to cluster limitations and unstable batch workflows.

**Role**: Senior Data Engineer  
**Tech Stack**: Databricks, PySpark, Delta Lake, AWS S3, AWS Glue, Airflow, Terraform, IAM, CloudWatch  

---

## Business Problem

The organization relied heavily on a legacy Hadoop-based warehouse for daily reporting, finance reconciliations, and inventory analytics. However:

- Cluster maintenance required heavy manual effort and constant patching.
- Query performance degraded significantly as data volumes grew.
- Batch pipelines frequently failed during high-load seasonal windows.
- The platform lacked governance and consistent data quality checks.

The goal was to build a modern platform that supports **real-time analytics**, reduces operational overhead, and improves performance and reliability.

---

## Solution Architecture

We designed and implemented a **Lakehouse architecture** using the Databricks **Medallion pattern** (Bronze / Silver / Gold).

![Databricks Lakehouse Medallion Architecture](https://raw.githubusercontent.com/databricks-demos/dbdemos/main/images/lakehouse/medallion-architecture.png)

### 1. Data Ingestion (Bronze Layer)

- Migrated raw data ingestion from Hadoop HDFS into **AWS S3**.
- Built ingestion pipelines to extract data from Oracle and SQL Server into S3.
- Automated ingestion triggers using **EventBridge + Lambda**, enabling schedule-based and event-driven execution.
- Implemented schema validation and metadata capture for auditability.

### 2. Data Processing (Silver Layer)

- Developed PySpark transformation pipelines on Databricks to cleanse and standardize datasets.
- Implemented incremental processing using watermarking and partition-aware loads.
- Enabled Auto Loader ingestion patterns for scalable file-based streaming workloads.
- Standardized datasets into Delta tables for improved reliability and ACID compliance.

### 3. Serving & Analytics (Gold Layer)

- Built aggregated and business-ready datasets optimized for reporting and downstream ML workloads.
- Applied Z-Ordering and partition strategies for BI query acceleration.
- Delivered curated Delta tables for analytics teams and BI tools such as Power BI.

---

## Automation & Infrastructure

All infrastructure was provisioned using Infrastructure as Code (IaC) with Terraform:

- Databricks workspace provisioning
- Cluster policies and job permissions
- S3 bucket structure, IAM roles, and least-privilege access
- Monitoring and alerting pipelines via CloudWatch

This ensured the environment remained reproducible, secure, and deployment-ready across environments.

---

## Key Challenges & Engineering Solutions

### Data Skew in Large Joins
Some datasets had extremely uneven key distributions causing Spark stage failures and performance bottlenecks.

**Solution**:
- Implemented salting strategies for skewed join keys
- Tuned Spark shuffle partitions and adaptive query execution
- Introduced broadcast joins for small dimension tables

---

### Small Files Problem (S3 + Delta Tables)
Streaming ingestion produced thousands of small files, degrading performance.

**Solution**:
- Automated Delta table optimization using `OPTIMIZE` and `VACUUM`
- Implemented compaction workflows through scheduled maintenance jobs
- Tuned Auto Loader settings to control file sizes

---

### Cost Management & Cluster Efficiency
The migration introduced risk of high Databricks compute costs.

**Solution**:
- Used Spot instances for non-critical workloads
- Implemented cluster policies to enforce limits and reduce misuse
- Scheduled auto-termination and job clusters for workload isolation

---

## Outcomes & Impact

- Achieved **40% reduction** in annual infrastructure and platform operational cost.
- Improved query performance by **3x**, reducing critical report runtime from hours to minutes.
- Enabled near real-time analytics for inventory tracking and demand forecasting.
- Improved platform stability with standardized Delta Lake tables and automated orchestration.
- Established a scalable foundation for future ML pipelines and enterprise governance.

---

## Key Takeaways

This migration delivered a highly scalable cloud-native Lakehouse architecture, replacing a legacy Hadoop ecosystem with a modern Databricks platform. The solution significantly improved performance, reliability, and operational efficiency while positioning the business for long-term growth in analytics and AI-driven decision-making.
