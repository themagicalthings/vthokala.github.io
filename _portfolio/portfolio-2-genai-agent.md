---
title: "Enterprise GenAI Research Assistant"
excerpt: "Built a RAG-based autonomous agent to answer internal technical queries using LangChain, OpenAI, and Pinecone.<br/><img src='/images/genai-agent-thumb.png'>"
collection: portfolio
---

## Project Overview

**Role**: Lead GenAI Engineer  
**Tech Stack**: Python, LangChain, OpenAI (GPT-4), Pinecone, Streamlit, Docker

Developed an internal tool to help solutions architects quickly find answers from thousands of PDF documents, Confluence pages, and Jira tickets.

## The Solution: RAG Agent

Instead of a simple semantic search, I implemented an agentic workflow using LangGraph.

### Architecture

1.  **Ingestion Pipeline**: unstructured.io to parse PDFs and Confluence, chunking strategy based on markdown headers.
2.  **Vector Store**: Upserted embeddings (OpenAI `text-embedding-3-small`) to Pinecone.
3.  **Retrieval**: Hybrid search (Dense + Sparse/BM25) with re-ranking (Cohere).
4.  **Agent Logic**:
    *   **Router**: Decides if the query needs retrieval, web search, or calculation.
    *   **Self-Reflection**: The agent verifies if the generated answer is grounded in the retrieved context.

## Results

*   Reduced time-to-answer for technical queries from ~30 mins to <1 min.
*   Adoption by 50+ internal engineers within the first month.
