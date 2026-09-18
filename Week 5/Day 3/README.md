# Day 3 – Advanced Data Analysis with Python

## Project Overview

This project focuses on advanced data analysis and simple predictive analytics using Python. The project uses an Employee Salary dataset to analyze relationships between employee experience, training, age, department, and salary.

A Linear Regression model was developed to predict employee salary based on years of experience. The project also compares actual salary values with model predictions.

## Tools & Technologies

* Python
* Google Colab
* Pandas
* NumPy
* Matplotlib
* Scikit-learn

## Dataset

The dataset contains employee information including:

* Employee ID
* Experience Years
* Age
* Department
* Training Hours
* Salary

## Analysis Performed

### 1. Data Exploration

* Checked dataset shape and information
* Generated descriptive statistics
* Checked missing values

### 2. GroupBy Analysis

Department-level salary analysis was performed using:

* Employee count
* Average salary
* Minimum salary
* Maximum salary

Multi-level aggregation was also performed to compare salary and training hours across departments.

### 3. Feature Engineering

New features were created, including:

* Salary Per Experience
* Experience Level

Employees were categorized into Junior, Mid-Level, and Senior groups based on their years of experience.

### 4. Correlation Analysis

Correlation analysis was performed on numerical variables to examine relationships between:

* Experience
* Age
* Training Hours
* Salary

### 5. Outlier Analysis

The Interquartile Range (IQR) method and boxplot were used to identify potential salary outliers.

### 6. Trend Analysis

A trend analysis was performed to examine how average salary changes with years of experience.

## Predictive Analytics

A Linear Regression model from Scikit-learn was used to predict employee salary based on experience.

### Machine Learning Process

1. Selected Experience Years as the input feature.
2. Selected Salary as the target variable.
3. Split the dataset into training and testing data.
4. Trained the Linear Regression model.
5. Generated salary predictions.
6. Compared actual and predicted salaries.
7. Evaluated model performance.

## Model Evaluation

The following metrics were used:

* Mean Absolute Error (MAE)
* Mean Squared Error (MSE)
* Root Mean Squared Error (RMSE)
* R² Score

## Actual vs Predicted

A comparison table was created containing:

* Experience Years
* Actual Salary
* Predicted Salary

A scatter plot was also created to visually compare actual and predicted salary values.

## Key Findings

* Salary generally increases with years of experience in the dataset.
* GroupBy analysis helped compare salary patterns across departments.
* Feature engineering created additional variables for analysis.
* Correlation analysis helped identify relationships between numerical variables.
* Potential salary outliers were identified using the IQR method.
* Linear Regression was used for salary prediction.
* Actual and predicted salaries were compared to evaluate the model.
* Multiple evaluation metrics were calculated to assess prediction performance.

## Project Outcome

This project provided practical experience with advanced Pandas operations, data analysis, feature engineering, correlation and outlier analysis, trend analysis, and basic machine learning using Scikit-learn.

The main outcome was a simple predictive analytics model capable of estimating employee salary from years of experience and comparing its predictions with actual salary values.

