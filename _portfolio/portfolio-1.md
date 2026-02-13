---
title: "RAG System -> AI Knowledge Base from Recordings"
excerpt: "Built a prod-grade RAG system that converts meeting recordings into a searchable, citation-backed knowledge base with summaries, action items, and conversational Q&A."
header:
  teaser: rag-system.png
collection: portfolio
---

## 📌 Project Overview

Org's lose critical decisions inside long meeting recordings and scattered notes.  
This project solves that by transforming **audio/video meetings + PDFs** into an **AI-powered knowledge base** where users can ask natural language questions and get **accurate, grounded answers with timestamps and citations**.

Instead of traditional ETL pipelines, this system uses modern AI components like **Whisper transcription, embeddings, vector databases, LangChain retrieval chains, and LangGraph orchestration** to create an intelligent "meeting brain."

---

## 🎯 Problem Statement

Meetings generate valuable information like:

- Decisions
- Action items
- Risks
- Technical design discussions
- Requirements changes

But the information is buried in:

- 1–2 hour recordings  
- PDF notes  
- Email threads  
- scattered documents  

Searching manually is slow and unreliable.

---

## ✅ Solution

Built a **Meeting Intelligence System** that automatically:

- Converts meeting recordings into text using transcription
- Splits content into intelligent chunks
- Generates vector embeddings for semantic search
- Stores chunks inside a vector database (Chroma/Qdrant)
- Enables conversational Q&A using Retrieval-Augmented Generation (RAG)
- Produces meeting summaries, action items, and topic breakdowns
- Returns answers with **timestamp citations** for verification

---

## 🧠 What Makes This System "Prod-Grade"

This is not a simple chatbot.

It includes:

- Multi-step orchestration workflow
- Metadata-aware retrieval
- Hybrid search support (keyword + semantic)
- Citation tracking (timestamp + chunk reference)
- Evaluation metrics (precision@k, recall@k)
- Observability (logging + cost monitoring)
- Modular architecture for scaling

---

## 🏗️ At Bird's-eye view

### Flow (End-to-End)

**Meeting Video/Audio (MP4 / YouTube)**
→ **Whisper Transcription**
→ **Text Cleaning**
→ **Chunking (overlap + semantic splitting)**
→ **Embedding Generation**
→ **Vector Database Storage**
→ **Retriever + Re-Ranker**
→ **LLM Answer Generation**
→ **Response with Citations + Timestamp**

---

## 🔥 Core Features

### 🎙️ 1. Meeting Transcription
- Uses **OpenAI Whisper** to extract accurate speech-to-text
- Supports MP4 audio extraction + YouTube ingestion
- Produces transcript with timestamps

---

### ✂️ 2. Intelligent Chunking Strategy
Chunking is critical in RAG systems.

Implemented chunking using:
- Recursive chunk splitting
- Sentence boundary chunking
- Fixed-size overlap chunks (1000 tokens + 200 overlap)

**Why overlap matters:**  
Prevents loss of context when key decisions span multiple sentences.

---

### 🧾 3. Metadata-Driven Storage
Each chunk is stored with metadata such as:

- meeting_id
- timestamp_start
- timestamp_end
- speaker (optional future extension)
- topic labels
- file_name / URL

This metadata enables filtering and accurate citation generation.

---

### 🧠 4. Embeddings + Vector Search
The sys generates embeddings using:

- `sentence-transformers`
- or OpenAI embedding APIs (optional upgrade)

Chunks are stored inside:

- **ChromaDB** (local development)
- **Qdrant** (production-ready deployment)

---

### 🔍 5. Semantic Retrieval + Hybrid Search
Retrieval supports:

- Semantic similarity search (vector)
- Hybrid search (BM25 + embeddings)
- Re-ranking with cross-encoder model

---

### 🤖 6. RAG Answer Generation with Citations
The sys uses Retrieval-Augmented Generation:

- Retrieves top-k relevant chunks
- Sends context + question to LLM
- Returns a grounded answer

Responses include citations like:

- meeting_2026_02_01.mp4 (t=15:20 - 16:05)
- meeting_2026_02_01.mp4 (t=38:10 - 39:30)

This makes the system **trustworthy**.

---

### 📝 7. Meeting Summarization + Action Items Extraction
Beyond Q&A, the system generates:

- Executive summary
- Decisions log
- Action items list
- Key risks & blockers
- Topic extraction (authentication, infra, performance, etc.)

This transforms raw meetings into structured intelligence.

---

## 🔄 LangGraph Orchestration (Agent Workflow)

This project uses **LangGraph** to model a production workflow as a state machine.

### Workflow Nodes

1. `Ingest Meeting`
2. `Transcribe Audio`
3. `Clean Transcript`
4. `Chunk Text`
5. `Generate Embeddings`
6. `Store in VectorDB`
7. `Validate Chunk Quality`
8. `Summarize`
9. `Expose Query API`

### Why LangGraph?
Because real-world AI pipelines require:

- conditional routing
- retry logic
- failure recovery
- step-level observability

LangGraph makes this deterministic and production friendly.

---

## 📡 API Layer (FastAPI)

Exposed the system as reusable API endpoints:

### Upload Meeting
`POST /upload`

### Query Knowledge Base
`POST /query`

### Summarize Meeting
`POST /summarize`

---

## 📊 Evaluation & Quality Metrics

To ensure the system performs better than a basic chatbot, I added evaluation methods such as:

- **precision@k**
- **recall@k**
- response groundedness checks
- query latency tracking
- embedding cost tracking (if using paid APIs)

This enables continuous improvement and model tuning.

---

## ⚙️ Tech Stack

### AI / NLP
- OpenAI Whisper (speech-to-text)
- LangChain (retrieval chains)
- LangGraph (workflow orchestration)
- Sentence Transformers / OpenAI Embeddings
- Cross-Encoder Re-Ranking Models

### Storage
- ChromaDB (local vector store)
- Qdrant (production vector store)
- SQLite / PostgreSQL for metadata

### Backend / API
- FastAPI
- Pydantic models
- Async processing (future extension)

### Monitoring & Logging
- Structured logging
- latency + cost tracking
- error recovery patterns

---

## 🚀 Why This Matters 

This project demonstrates modern engineering skills beyond traditional ETL:

- Designing AI-first data systems
- Implementing vector search and RAG pipelines
- Building production-grade workflows using orchestration
- Adding evaluation frameworks to measure AI quality
- Developing APIs for real-world adoption
- Understanding trade-offs: chunking, embeddings, retrieval, context window, cost

---

## 🔮 Future Enhancements

Planned improvements for enterprise scaling:

- speaker diarization (identify who said what)
- multi-meeting timeline memory
- document-level topic clustering
- event-driven ingestion (S3 triggers / Kafka)
- role-based access control for sensitive meetings
- OpenTelemetry tracing for full observability
- cost-based routing (cheap model vs premium model)

---

## 📌 Final Summary

This project is a complete implementation of a modern AI system:

✅ Transcription + chunking + embeddings  
✅ Vector database storage  
✅ Retrieval Augmented Generation (RAG)  
✅ Citation-backed answers with timestamps  
✅ LangGraph orchestration for production workflows  
✅ API-ready deployment using FastAPI  
✅ Evaluation and monitoring for real-world reliability  

It showcases my ability to build **AI-driven knowledge systems** from scratch using modern tooling and production engineering practices.

