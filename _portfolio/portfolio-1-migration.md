---
title: "Legacy Hadoop to Databricks Migration"
excerpt: "Migrated 50TB+ data warehouse from on-prem Hadoop to Databricks/Delta Lake on AWS, reducing costs by 40% and improving query performance by 3x.<br/><img src='/images/databricks-migration-thumb.png'>"
collection: portfolio
---

## Project Overview

**Role**: Senior Data Engineer  
**Tech Stack**: Databricks, PySpark, Delta Lake, AWS S3, Airflow, Terraform

Leading a team of 4 engineers to modernize the data platform for a retail giant. The legacy Cloudera Hadoop cluster was expensive to maintain and struggled with peak holiday loads.

## Architecture

We designed a Lakehouse architecture using the "Medallion" pattern (Bronze/Silver/Gold) on Databricks.

1.  **Ingestion**: Logic Apps triggering Spark jobs to pull data from Oracle/SQL Server into S3 (Bronze).
2.  **Processing**: Streaming jobs (Autoloader) processing raw data into cleansed Delta tables (Silver).
3.  **Serving**: Aggregated business-level tables (Gold) optimized for PowerBI and ML workloads.

## Key Challenges & Solutions

*   **Data Skew**: Implemented salting strategies for large table joins.
*   **Small Files Problem**: Automated `OPTIMIZE` and `VACUUM` maintenance jobs.
*   **Cost Control**: Utilized Spot instances for non-critical workloads and implemented cluster policies.

## Outcomes

*   **40% reduction** in annual infrastructure costs.
*   **3x performance improvement** for critical daily reports.
*   Enabled real-time analytics for inventory management.
