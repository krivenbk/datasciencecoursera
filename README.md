datasciencecoursera
===================

The R script used to process the HCI HAR dataset uses a function to process each of the train and test datasets to prepare them to be merged. It then merges them and replaces activity numbers with acitivty names. The merged dataframe is subsetted, keeping only the variables that refer to mean od standard deviation using the grep command. The subsetted dataframe is then manipulated using the reshape package to first melt the dataframe and then cast it as a tidy dataset calculatin the mean of each variable for each subject and each activity. This results in a final dataframe with 180 obervations (30 x 6 activities) and 81 variables; a mean and std for each of these features:
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

