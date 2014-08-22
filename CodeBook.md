# 2014-08-22
# Written by Jayeon Kim


CodeBook 


-Data- 

# Downloaded Data
X_test : Test set. 'data.frame': 2947 obs. of  561 variables
X_train : Training set. 'data.frame': 7352 obs. of  561 variables
y_test : Test labels. 'data.frame': 2947 obs. of  1 variable
y_train : Training labels. 'data.frame': 7352 obs. of  1 variable
subject_test : Identifies the subject(range 1 to 30) of test set. 'data.frame':	2947 obs. of  1 variable
subject_train : Identifies the subject(range 1 to 30) of training set. 'data.frame': 7352 obs. of  1 variable
features : Labels of the data set. 'data.frame': 561 obs. of  2 variables
activity_labels : The class labels with their activity name. 'data.frame': 6 obs. of  2 variables

# Merged Data
X : X_train, X_test merged. 'data.frame': 10299 obs. of  561 variables
Y : y_train, y_test merged. 'data.frame': 10299 obs. of  1 variable
sub : subject_train, subject_test merged. 'data.frame':	10299 obs. of  1 variable

# Variable
col : contains col numbers which is related to mean(), std(), Activity and Subject. num[1:68]

# Final Data
Data :  Data set that contains every training and test set, 
	also containing Subject and Activity(with String labels)
	'data.frame':	10299 obs. of  68 variables
tidyAct : Data set with the mean of each variable for each activity
	  num [1:6, 1:66]
tidySub : Data set with the mean of each variable for each subject
	  num [1:30, 1:66]
	

-Work Performed-

Data :  1) Column bind with (X,Y,sub)
	2) Give column names with c(features, "Activity", "Subject")
	3) Make variable col(described above) which is sorted, and extract only that column from Data
	4) For Activity column, label each element using activity_labels data

tidyAct : 1) Make a function that calculates the mean of given column for each activity.
	  2) and use this function on 'apply function' so as to apply this function for each column

tidySub : Same procedure as tidyAct