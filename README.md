# Getting-and-cleaning-data
Extracted from coursera Week 4 assigment 
Create one R script called run_analysis.R that does the following:

    *Merges the training and the test sets to create one data set.
    *Extracts only the measurements on the mean and standard deviation for each measurement.
    *Uses descriptive activity names to name the activities in the data set
    *Appropriately labels the data set with descriptive variable names.
    *From the data set in step 4, creates a second, independent tidy data 
    set with the average of each variable for each activity and each subject.
    
   #Explanation of the run_analysis.R script
   The steps followed in the scripts are the following
   1.	 load all the data files 
2.	library(dplyr)
3.	 features load
4.	 labels load
5.	 test data load 
6.	 assign the names to the columns
7.	 train data load 
8.	 assign the names to the columns
9.	  join all the values in data_test_train variable
10.	 select the columns that include mean or std in their label
11.	 calculate the mean value of the columns
12.	 erase the added values by aggregate
13.	 change the number of the activity type by the text assigned to each of them
14.	 optional to visualize the data
