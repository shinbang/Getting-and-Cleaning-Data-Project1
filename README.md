# 2014-08-22
# Written by Jayeon Kim


README


-run_analysis.R-

Code is constructed with 5 parts.

1) Load data from working directory. 
   Including X_test, X_train, y_test, y_train, 
   subject_test, subject_train, features, activity_labels.

2) Merge data to form a single Data. Also including features(label).

3) Find column number that only includes column with name "mean()", "std()", Activity, "Subject".
   Sort column number for convenience.
   Use these column number for extracting needed data.

4) For Activity column, label each element using activity_labels data

5) Make a function that calculates the mean of given column for each Activity/Subject.
   and use this function on 'apply function' so as to apply this function for each column


-CodeBook.md-

Consturcted with Data information and description of Work Performed.


-tidyAct.txt- 

Data set with the mean of each variable for each activity


-tidySub.txt-  

Data set with the mean of each variable for each subject