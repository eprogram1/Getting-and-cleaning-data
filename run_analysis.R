## load all the data files 
library(dplyr)
path <- "UCI HAR Dataset"

#features load
features<-read.table(file.path(path, "features.txt"))

#labels load
activity_labels<- read.table(file.path(path, "activity_labels.txt"))

#test data load & assign the names to the columns
X_test<-read.table(file.path(path, "test", "X_test.txt"))
colnames(X_test)<-features$V2

Y_test<-read.table(file.path(path, "test", "y_test.txt"))
colnames(Y_test)[1] <- "Activity"

subjec_ID_test<-read.table(file.path(path, "test", "subject_test.txt"))
colnames(subjec_ID_test)[1] <- "Subject_ID"

#train data load  & assign the names to the columns
X_train<-read.table(file.path(path, "train", "X_train.txt"))
colnames(X_train)<-features$V2

Y_train<-read.table(file.path(path, "train", "y_train.txt"))
colnames(Y_train)[1] <- "Activity"

subjec_ID_train<-read.table(file.path(path, "train", "subject_train.txt"))
colnames(subjec_ID_train)[1] <- "Subject_ID"



# Join all the values in data_test_train variable

data_test<-cbind(subjec_ID_test, Y_test )
data_test<- cbind(data_test, X_test )
data_train<-cbind(subjec_ID_train, Y_train )
data_train<- cbind(data_train, X_train )

data_test_train<- rbind(data_test, data_train)

data_test_train$Activity <- factor(data_test_train$Activity, levels = activity_labels[, 1], labels = activity_labels[, 2])

#erase () from variable names

names(data_test_train)<-gsub("[\\(|\\)]", "", names(data_test_train))
names(data_test_train)<-gsub(",", "_", names(data_test_train))

#select the columns that include mean or std in their label + Subject ID + Activity

columns<-c(grep("Subject_ID", names(data_test_train)), grep("Activity", names(data_test_train)), grep("Mean|mean", names(data_test_train)),  grep("STD|std", names(data_test_train)))

data_test_train_Mean_STD_columns<- data_test_train[ , columns]


#calculate the mean grouped by subject Id and activity

data_tidy <- data_test_train_Mean_STD_columns %>% group_by(Subject_ID, Activity) %>%  summarise_each(funs(mean))

# write to file 
write.table(data_tidy, "data_tidy.txt", row.names = FALSE, quote = FALSE)


