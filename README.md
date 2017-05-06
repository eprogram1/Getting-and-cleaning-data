## Getting-and-cleaning-data
Extracted from coursera Week 4 assigment 
Create one R script called run_analysis.R that does the following:

    *Merges the training and the test sets to create one data set.
    *Extracts only the measurements on the mean and standard deviation for each measurement.
    *Uses descriptive activity names to name the activities in the data set
    *Appropriately labels the data set with descriptive variable names.
    *From the data set in step 4, creates a second, independent tidy data 
    set with the average of each variable for each activity and each subject.
    
 ## Explanation of the run_analysis.R script
   The steps followed in the scripts are the following
 1.	 load all the data files 
2.	features load
3.	labels load
4.	test data load & assign the names to the columns
5.	train data load  & assign the names to the columns
6. join all the values in data_test_train variable
7.	erase () from variable names
8.	select the columns that include mean or std in their label + Subject ID + Activity
9.	calculate the mean grouped by subject Id and activity
10. write to file 
