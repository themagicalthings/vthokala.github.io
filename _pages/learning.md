---
permalink: /learning/
title: "Now Learning"
author_profile: true
---

My current focus is on mastering the Generative AI engineering stack while deepening my expertise in cloud data platforms.

## 🗺️ AI Specialization with AgentOps.
![Phase 6: Monitoring and Caching]({{ '/images/phase6_monitoring_and_caching.png' | relative_url }})

## Project Outcomes
- Build a production-grade agentic RAG pipeline that retrieves, grades, and re-queries until it returns a grounded answer.
- Wire arXiv, Jina, OpenSearch, and Neon PostgreSQL with daily Airflow DAGs that survive failures and retry automatically.
- Type-safe FastAPI backend with streaming, caching, and config-driven runs across OpenAI and AWS Bedrock providers.
- Combine BM25 keyword and semantic vector search with RRF fusion so retrieval quality stays high at any scale.
- Cut repeat query cost to near-zero by layering an exact-match Redis cache before every LLM call.
- Trace every request end-to-end with Langfuse and Logfire — latency, token cost, and retrieval quality visible before production deploy.

## Project Description

### Business Objective
Build an Agentic RAG system that automatically ingests arXiv research papers daily, indexes them for hybrid search, and answers natural language questions with cited, grounded responses. Apache Airflow orchestrates the full ingestion pipeline — fetching PDFs, parsing them with Docling, chunking, embedding via Jina AI, and storing in OpenSearch. A LangGraph agent handles Q&A with guardrails, document grading, and adaptive query rewriting. The system exposes a Gradio web UI, a Telegram bot, and a FastAPI REST API — all backed by Neon PostgreSQL, Upstash Redis, and optional AWS Bedrock.

### Tech Stack
- Python, FastAPI, LangGraph, Apache Airflow
- OpenSearch (hybrid BM25 + vector search)
- Neon PostgreSQL, Upstash Redis
- Jina AI Embeddings, OpenAI GPT-4o-mini
- AWS Bedrock, Bedrock Guardrails
- Docling (PDF parsing)
- Langfuse, Logfire (observability)
- Gradio, Telegram Bot, MCP Server
- Docker Compose, AWS EKS, GitHub Actions CI/CD

## 📚 Recent Notes & Resources
*   *Coming soon...*
