# Load test/training set. Data should be unzipped in working directory.
X_test <- read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"")
X_train <- read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", quote="\"")
y_test <- read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", quote="\"")
y_train <- read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_test <- read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train <- read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"")
features <- read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE)
activity_labels <- read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", quote="\"")

# Merges the training and the test sets to create one data set.
# Also merge features, subject_train/test, y_train/test
# This part covers appropriately labelling the data set with descriptive variable names. 
X<-rbind(X_train, X_test)
Y<-rbind(y_train, y_test)
sub<-rbind(subject_train, subject_test)
Data<-cbind(X,Y,sub)
colnames(Data) <- c(features[,2],"Activity","Subject")

# Extracts only the measurements on the mean and standard deviation
col<-c(grep("mean()", colnames(Data), fixed=TRUE), grep("std()", colnames(Data)),
       ncol(Data)-1, ncol(Data))
col<-sort(col)
Data<-Data[,col]

# Uses descriptive activity names to name the activities in the data set
Data[,"Activity"]<-activity_labels[Data[,"Activity"],2]

# Tidy data set with the average of each variable for each activity and each subject
tidyAct<-apply(Data[,1:(ncol(Data)-2)], 2, function(x){tapply(as.numeric(x), Data$Activity, mean)} )
tidySub<-apply(Data[,1:(ncol(Data)-2)], 2, function(x){tapply(as.numeric(x), Data$Subject, mean)} )
