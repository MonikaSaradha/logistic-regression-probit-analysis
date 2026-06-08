# Logistic Regression & Probit Analysis

Application of statistical modeling techniques to healthcare and consumption data for prediction and behavioral analysis.

---

## Overview

This project applies classification and econometric models on two real-world datasets to derive insights and support decision-making.

It includes predictive modeling for heart disease and behavioral analysis of consumption patterns.

---

## Part 1: Heart Disease Prediction

### Techniques Used
- Logistic Regression  
- Decision Tree  
- ROC Curve & Confusion Matrix  

### Objective
To predict the occurrence of heart disease using patient health attributes.

### Key Insights
- Logistic regression shows strong predictive performance (AUC ~0.93) :contentReference[oaicite:0]{index=0}  
- Decision tree provides interpretable classification rules  
- Logistic regression outperforms decision tree in classification accuracy  

---

## Part 2: Consumption Analysis (NSSO Dataset)

### Technique Used
- Probit Regression  

### Objective
To analyze factors influencing non-vegetarian consumption patterns.

### Key Insights
- Meat consumption variables positively influence non-vegetarian behavior  
- Religion has a significant negative influence on consumption patterns :contentReference[oaicite:1]{index=1}  
- Model explains behavioral trends using probabilistic interpretation  

---

## Dataset

- **Heart Disease Dataset**  
  Contains patient-level health data used for classification modeling  

- **Punjab NSSO Dataset**  
  Contains food consumption data used for behavioral and econometric analysis  

---

## Tech Stack

- Python (scikit-learn, statsmodels, pandas, matplotlib)  
- Statistical Modeling & Machine Learning  

---

## Project Structure

- `analysis.ipynb` – implementation  
- `README.md` – project overview  
- `project_report.pdf` – detailed analysis  
