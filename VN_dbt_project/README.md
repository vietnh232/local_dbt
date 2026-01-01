# dbt ELT Project — Olist Brazilian E-Commerce (PostgreSQL)

This repository is a personal dbt project that demonstrates how I build an end-to-end **ELT** workflow:
- Load raw CSV data into Postgres (`raw_data` schema)
- Build **staging** models to clean/standardize data (`processing` schema)
- Build **marts** (facts/dimensions) for analytics (`consuming` schema)
- Add **data tests** to validate quality and consistency

Dataset: Olist Brazilian e-commerce public dataset (loaded from CSVs).
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/data


---

## What this project demonstrates

**dbt / SQL modeling**
- Staging → mart layer design
- Fact & dimension modeling
- Reusable transformations

**Data quality**
- Primary key tests (`unique`, `not_null`)
- Accepted values tests (e.g., order status)
- Relationship tests between facts and dimensions
- A custom reconciliation test comparing order cost vs payment totals

**Practical ELT**
- Local Postgres setup
- Python script to load CSV → database
- dbt build workflow (`dbt run` + `dbt test`)

---

## Architecture

### High-level flow
```mermaid
flowchart LR
  A[CSV Files<br/>data/brazilian-ecommerce/] -->|scripts/data_loading.py| B[(PostgreSQL)]
  B --> C[raw_data schema<br/>raw source tables]
  C --> D[processing schema<br/>staging views]
  D --> E[consuming schema<br/>facts & dims tables]
  E --> F[BI / Analysis / Dashboards]
  D --> G[dbt tests]
  E --> G[dbt tests]