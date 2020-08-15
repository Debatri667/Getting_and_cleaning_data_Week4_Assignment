# Getting_and_cleaning_data_Week4_Assignment
Johns Hopkins Data Science Specialization Getting and Cleaning Data Coursera Week 4 Class Project

R code for Cleaning and Working with Data

### Source Data

The data used in this course project represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

More information can be found at the data source website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for this project can be downloaded here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R run_analysis.R code in this repository primarily performs these 5 functions:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
### New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.
