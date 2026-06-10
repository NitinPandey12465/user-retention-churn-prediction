# user-retention-churn-prediction
https://huggingface.co/spaces/NitinPandey2632/churn-risk-predictor
End-to-end churn prediction — SQL, Python, SHAP, Kaplan-Meier survival analysis, Power BI dashboard
# User Retention & Churn Prediction Engine
### Telco Customer Churn Analysis | End-to-End Data Analytics Project

---

## Business Problem
A telecom company is losing **26.5% of its customers annually** — costing significant monthly recurring revenue. This project identifies at-risk customers before they churn, explains *why* they churn, and recommends specific product interventions to retain them.

---

## Headline Finding
> Month-to-month + Fiber optic + Tenure < 12 months customers churn at **70.2%** — nearly 3× the company average. This single cohort of 916 customers puts **$53,178/month** in revenue at risk.

---

## Tech Stack
| Tool | Purpose |
|---|---|
| Python (Pandas, NumPy) | Data loading, cleaning, feature engineering |
| PostgreSQL + pgAdmin | Normalized schema design, SQL analytics |
| Scikit-learn | Logistic Regression, Random Forest, cross-validation |
| XGBoost | Gradient boosting model, threshold tuning |
| SHAP | Model explainability, feature importance |
| Lifelines | Kaplan-Meier survival analysis, log-rank test |
| Power BI + DAX | 4-page executive dashboard |

---

## Project Architecture


https://huggingface.co/spaces/NitinPandey2632/churn-risk-predictor


---

## Key Results

| Metric | Value |
|---|---|
| Model | Logistic Regression |
| AUC-ROC | 0.84 |
| F1 Score | 0.628 |
| Recall (churners caught) | 75.7% |
| Cross-validation F1 | 0.628 ± 0.021 |
| Overall churn rate | 26.5% |
| High-risk cohort churn | 70.2% |
| Monthly revenue at risk | $53,178 |

---

## SQL Schema
4 normalized tables designed in PostgreSQL:
- `dim_customers` — demographic attributes
- `dim_services` — service subscriptions
- `dim_contracts` — contract and billing info
- `fact_billing` — tenure, charges, churn label

Key SQL findings confirmed in pgAdmin:
- Month-to-month churn rate: **42.71%** vs Two-year: **2.83%**
- High-risk cohort monthly revenue at risk: **$50,899**

---

## EDA Findings
1. Churned customers have average tenure of **18 months** vs 37 months retained
2. Month-to-month contract = **42.71% churn** vs 2.83% for two-year
3. Fiber optic customers churn at **42%** despite paying the most — value-perception gap
4. 0-6 month cohort has **52.9% churn rate** — highest-risk window

---

## Survival Analysis
Kaplan-Meier curves fitted per contract type. Log-rank test confirms contract type has statistically significant effect on survival (p < 0.001). Month-to-month customers reach 50% survival probability by month 10.

---

## SHAP Feature Importance
Top 5 churn drivers identified by SHAP:
1. `monthlycharges` — SHAP: 0.82
2. `tenure` — SHAP: 0.71
3. `has_support_services` — SHAP: 0.30
4. `paperlessbilling` — SHAP: 0.20
5. `service_count` — SHAP: 0.19

---

## Business Recommendations

### 1. Contract Upgrade Campaign
- **Target:** 3,875 month-to-month customers
- **Action:** 20% discount to switch to annual at 3-month tenure mark
- **Expected impact:** Reduce churn from 42% → ~15%
- **Revenue protected:** ~$45,000/month

### 2. Fiber Optic Onboarding Fix
- **Target:** New fiber optic customers (tenure < 12 months)
- **Action:** Dedicated onboarding call at Day 7 + 30-day check-in
- **Expected impact:** Reduce early fiber churn by ~20%
- **Revenue protected:** ~$10,000/month

### 3. Support Services Trial
- **Target:** Customers with no TechSupport or OnlineSecurity
- **Action:** Free 60-day OnlineSecurity trial in first 6 months
- **Expected impact:** Reduce churn by ~8%
- **Revenue protected:** ~$5,000/month

**Combined: Protecting ~$60,000/month | Model catches 75.7% of churners before they leave**

---

## Dashboard Preview
*4-page Power BI dashboard — Executive Overview, Cohort & Survival, Model Insights, Recommendations*

---

## How to Run
```bash
# Install dependencies
pip install pandas numpy matplotlib seaborn scikit-learn xgboost shap lifelines sqlalchemy psycopg2-binary

# Run the analysis
python retention_churn.py
```

---

## Dataset
IBM Telco Customer Churn Dataset — [Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)
- 7,043 customers, 21 features
- Public dataset, anonymized

---

*Project by Nitin Pandey | B.Tech Production & Industrial Engineering, DTU | Published NLP researcher (ICAIT 2025, IEEE Xplore)*
