
Codebook for Assignment of DSS3 Week 4

The data are cleaned from the UCI data sets.

Dataset file : data.txt

Steps :
1. We used the files : X_train, y_train, subject_train, X_test, y_test, subject_test
2. And merge them to a single file. 
3. We then only kept the 6 means and std of the positions (given below) from the x data
4. we rename the activity feature, by giving its real name, according to the file activity_labels
5. We split the data along activity and subject,
6. For given subject and activity, we perform mean evaluation for each of the 6 variables of means and std,
7. The 6 means are completed with the names of the subject and activity. This gives one row
8. With a loop, we add each of the row, representing all the combination of subject/activity
9. We save the file under the name data.txt

Variable description :
meanX : mean of mean values of tBodyAcc -X
meanY : mean of mean values of tBodyAcc -Y
meanZ : mean of mean values of tBodyAcc -Z
stdX : mean of standard deviation of tBodyAcc -X
stdY : mean of standard deviation of tBodyAcc -Y
stdZ : mean of standard deviation of tBodyAcc -Z
activity : activity from : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
subject : subject ID, goes from 1 to 30

