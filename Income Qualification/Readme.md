# Income Qualification Project

This project aims to identify the level of income qualification needed for families in Latin America. The goal is to develop a model that can accurately classify families based on their observable household attributes and predict their level of need. The dataset used is based on Costa Rican household characteristics and is intended to improve the performance of the existing Proxy Means Test (PMT) method.

## Problem Statement Scenario

In social programs that target the poorest segment of the population, ensuring aid reaches the right people is challenging. Traditional methods like Proxy Means Test (PMT) use household attributes to classify families and determine their level of need. However, accuracy remains an issue as the population grows and poverty declines. The Inter-American Development Bank (IDB) believes that new methods, beyond traditional econometrics, can enhance the performance of PMT using a dataset of Costa Rican household characteristics.

## Actions to be Performed

1. Identify the Output Variable: Determine the variable in the dataset that represents the level of income qualification.

2. Understand the Type of Data: Analyze the data to understand its structure, types of variables, and their meanings.

3. Check for Biases: Investigate the dataset for any biases that may affect the accuracy of the income qualification predictions.

4. Check Consistency of Poverty Levels: Verify if all members of a household have the same poverty level assigned.

5. Handle Households without a Family Head: Ensure that each house has a designated family head for consistent poverty level assignment.

6. Handle Null Values: Identify and count the number of null values in each column, and remove null value rows from the target variable.

7. Predict Accuracy using Random Forest Classifier: Build a random forest classifier model to predict the income qualification level and evaluate its accuracy.

8. Check Accuracy using Cross-Validation: Assess the accuracy of the random forest classifier model using cross-validation techniques.

## Project Files

The project includes the following files:

1. `data.csv`: CSV file containing the dataset of Costa Rican household characteristics.
2. `README.md`: Markdown file providing an overview of the project (you are currently reading it).

For detailed code and analysis, refer to the Jupyter Notebook or Python script files provided.

## Instructions

To run the project and reproduce the analysis:

1. Download the `data.csv` file.
2. Install the necessary libraries and dependencies.
3. Run the Jupyter Notebook or Python script files.
4. Follow the step-by-step instructions within the code to perform data preprocessing, model training, and evaluation.

Note: The project assumes a basic understanding of Python, data analysis, and machine learning concepts.

By developing an accurate income qualification model, we can improve social programs' effectiveness in Latin America. Enjoy working on the project!

