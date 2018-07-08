# Getting-and-Cleaning-Data-Week-4-Assignment
This repository contains the R script and documentation for the Coursera Data Science Specialization -- Getting & Cleaning Data Week4 assignment.

### Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. A full description of the data used in this project can be found at 'The UCI Machine Learning Repository'(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Project Goals
The goal of the project is to create one R script called run_analysis.R that does the following:
1.Merges the training and the test sets to create one data set. Use command rbind to combine training and test set
2.Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"
3.Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor
4.Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package

### Other files in the repo
Files 'CodeBook.md' contains information on the variables, data set, transformations and work that was done to tidy up the data
'run_analysis.R' is the code for the R script used to complete the project goals
'tidydata.txt' is the output from the 'runAnalysis.R' R script
