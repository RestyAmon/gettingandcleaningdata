#Set Directory where file the file is stored
setwd("~/CODE ACTIVITIES/UCI HAR Dataset")

#Reading Train Tables
X_train<-read.table("train/X_train.txt")
View(X_train)
y_train<-read.table("train/y_train.txt")
View(y_train)
subject_train<-read.table("train/subject_train.txt")
View(subject_train)

#Reading Test Tables
X_test<-read.table("test/X_test.txt")
View(X_test)
y_test<-read.table("test/y_test.txt")
View(y_test)
subject_test<-read.table("test/subject_test.txt")
View(subject_test)

#Reading Features and Activity lables
activity_labels<-read.table("activity_labels.txt",col.names = c("ActivityId","Activity"))
View(activity_labels)
features<-read.table("features.txt")
View(features)


#merging Train and Test
x_all<-rbind(X_train,X_test)
y_all<-rbind(y_train,y_test)
sub_all<-rbind(subject_train,subject_test)
View(x_all)
View(y_all)
View(sub_all)


#name the columns
colnames(x_all)<-features[,2]
colnames(y_all)<-"ActivityId"
colnames(sub_all)<-"Subject"


#Final merge for the dataset (train_test)
train_test<-cbind(sub_all,y_all,x_all)
View(train_test)

#Extracting only the measurements on the mean and standard deviation
colnames<-names(train_test)
newcolnames<-grepl("mean",colnames)|grepl("std",colnames)|grepl("ActivityId",colnames)|grepl("Subject",colnames)

train_test<-train_test[,which(newcolnames)]

#Renaming data: making parameter labels more descriptive
newnames<-names(train_test)
newnames<-gsub("^t","Time_",newnames)
newnames<-gsub("^f","Frequency_",newnames)
newnames<-gsub("Acc","Accelerometer",newnames)
newnames<-gsub("Gyro","Gyroscope",newnames)
newnames<-gsub("Mag","Magnitude",newnames)
newnames<-gsub("mean","_Mean_",newnames)
newnames<-gsub("std","_StandardDeviation_",newnames)
newnames<-gsub("-","_",newnames)
names(train_test)<-newnames

#Renaming data: assigning activity labels on the data
train_test<-merge(activity_labels,train_test,by.x="ActivityId",by.y="ActivityId",all=TRUE)
train_test$ActivityId=NULL


# turn activities & subjects into factors 
train_test$Activity  <- as.factor(train_test$Activity)
train_test$Subject<-as.factor(train_test$Subject)

# create a summary independent tidy dataset from final dataset 
# with the average of each variable for each activity and each subject. 
library(dplyr)
tidydata <- train_test %>% group_by(Activity, Subject) %>% summarize_all(list(name=mean))
View(tidydata)


#Saving as .txt file
write.table(tidydata, file = "tidydata.txt",row.name=FALSE)


