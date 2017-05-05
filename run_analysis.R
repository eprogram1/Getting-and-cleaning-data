## load all the data files 
library(dplyr)
#features load
features<-read.table("features.txt")

#labels load
activity_labels<- read.table("activity_labels.txt")

#test data load
X_test<-read.table("X_test.txt")
#assign the names to the columns
colnames(X_test)<-features$V1
Y_test<-read.table("Y_test.txt")
colnames(Y_test)[1] <- "Activity"

subjec_ID_test<-read.table("subject_id_test.txt")
colnames(subjec_ID_test)[1] <- "Subject_ID"

#train data load
X_train<-read.table("X_train.txt")
colnames(X_train)<-features$V1
Y_train<-read.table("Y_train.txt")
colnames(Y_train)[1] <- "Activity"


subjec_ID_train<-read.table("subject_id_train.txt")
colnames(subjec_ID_train)[1] <- "Subject_ID"



# Join all the values in data_test_train variable

data_test<-cbind(subjec_ID_test, Y_test )
data_test<- cbind(data_test, X_test )
data_train<-cbind(subjec_ID_train, Y_train )
data_train<- cbind(data_train, X_train )

data_test_train<- rbind(data_test, data_train)

#select the columns that include mean or std in their label

columns<-c(grep("ID", names(data_test_train)), grep("Activity", names(data_test_train)), grep("Mean", names(data_test_train)),  grep("STD", names(data_test_train)))


data_test_train_Mean_STD_columns<- data_test_train[ , columns]

# calculate the mean value of the columns

data_tidy <-aggregate(data_test_train_Mean_STD_columns, list(data_test_train_Mean_STD_columns$Activity,data_test_train_Mean_STD_columns$Subject_ID ), mean)


#erase the added values by aggregate
data_tidy$Group.1<- NULL
data_tidy$Group.2<- NULL

# Change the number of the activity type by the text assigned to each of them


for (i in seq_len(nrow(data_tidy)))
{ 
        aux1<- activity_labels[data_tidy$Activity[i],2]
        data_tidy$Activity[[i]]<- as.character(aux1)
}
#optional to visualize the data
 #View(data_tidy)
