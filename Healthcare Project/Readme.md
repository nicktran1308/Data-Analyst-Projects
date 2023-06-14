# Healthcare Course-End Project

This is a course-end project for analyzing cardiovascular health and predicting the risk of heart attacks. The project involves exploring a dataset containing various factors related to cardiovascular diseases and building a predictive model using logistic regression and random forest algorithms. The following sections provide an overview of the project and its tasks.

## Problem Statement

Cardiovascular diseases are the leading cause of death globally. The objective of this project is to identify the causes and develop a system to predict heart attacks effectively. The dataset provided contains information about factors that may impact cardiovascular health.

## Dataset Description

The dataset contains the following variables:

Variable | Description
-------- | -----------
Age      | Age in years
Sex      | 1 = male, 0 = female
cp       | Chest pain type
trestbps | Resting blood pressure (in mm Hg on admission to the hospital)
chol     | Serum cholesterol in mg/dl
fbs      | Fasting blood sugar > 120 mg/dl (1 = true, 0 = false)
restecg  | Resting electrocardiographic results
thalach  | Maximum heart rate achieved
exang    | Exercise induced angina (1 = yes, 0 = no)
oldpeak  | ST depression induced by exercise relative to rest
slope    | Slope of the peak exercise ST segment
ca       | Number of major vessels (0-3) colored by fluoroscopy
thal     | 3 = normal, 6 = fixed defect, 7 = reversible defect
Target   | 1 = heart attack, 0 = no heart attack

## Task Summary

1. Preliminary analysis:
   - Perform data inspection to identify the structure, missing values, and duplicates.
   - Remove duplicates (if any) and treat missing values using an appropriate strategy.

2. Data exploration and analysis:
   - Perform statistical summary and explore central tendencies and spread of the data.
   - Identify categorical variables and describe and explore them using appropriate tools.
   - Study the occurrence of cardiovascular diseases across age categories.
   - Study the composition of all patients with respect to the sex category.
   - Analyze anomalies in resting blood pressure (trestbps) for predicting heart attacks.
   - Describe the relationship between cholesterol levels and the target variable.
   - Investigate the relationship between peak exercising and the occurrence of heart attacks.
   - Determine if thalassemia is a major cause of cardiovascular diseases.
   - Identify how other factors determine the occurrence of cardiovascular diseases.
   - Use a pair plot to understand the relationship between all given variables.

3. Model building and feature selection:
   - Build a baseline model using logistic regression and random forest algorithms.
   - Perform correlation analysis and logistic regression for feature selection.

## Project Files

The project includes the following files:

1. `CEP 1_Dataset.xlsx`: Excel file containing the dataset.
2. `README.md`: Markdown file providing an overview of the project (you are currently reading it).

For detailed code and analysis, refer to the Jupyter Notebook or Python script files provided.

## Instructions

To run the project and reproduce the analysis:

1. Download the dataset file `CEP 1_Dataset.xlsx`.
2. Install the necessary libraries and dependencies.
3. Run the Jupyter Notebook or Python script files.
4. Follow the step-by-step instructions within the code to perform the preliminary analysis, data exploration, and model building.

Note: The project assumes a basic understanding of Python, data analysis, and machine learning concepts.

Enjoy exploring the world of cardiovascular health and predicting heart attacks!
