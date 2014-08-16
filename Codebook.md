---
title: "CodeBook"
output: html_document
---
# Introduction
A set of experiments were carried out to obtain the HAR dataset. A group of 30 volunteers
with ages ranging from 19 to 48 years were selected for this task. Each person
was instructed to follow a protocol of activities while wearing a waist-mounted Samsung
Galaxy S II smartphone. The six selected ADL were standing, sitting, laying
down, walking, walking downstairs and upstairs. Each subject performed the protocol
twice: on the first trial the smartphone was fixed on the left side of the belt and on the
second it was placed by the user himself as preferred. There is also a separation of 5
seconds between each task where individuals are told to rest, this facilitated repeatability
(every activity is at least tried twice) and ground trough generation through the
visual interface. The tasks were performed in laboratory conditions but volunteers were
asked to perform freely the sequence of activities for a more naturalistic dataset. 

A total of 561 features were extracted to describe each activity window. In order to
ease the performance assessment, the dataset has been also randomly partitioned into two independent sets, where 70% of the data were selected for training and the remaining
30% for testing. The Human Activity Recognition dataset has been made available
for public use and it is presented as raw inertial sensors signals and also as feature vectors
for each pattern.

# Data Structure
The UCI HAR Dataset contains two subfolders: "train" and "test" as well as four individual files. The train and test folders contain the raw interial data (which is not used) and three files: subject_XXXX.txt, X_XXXX.txt, and y_XXXX.txt (where XXXX is either test or train). The X_XXXX.txt files contain the data for each feature. The subject_XXXX.txt files contain a list of subject numbers, and the y_XXXX.txt files contain a list of activity numbers. The activity_labels.txt file contains the labels for each activity number. The features.txt file contains the list of column names (features) for the data. The features_info.txt provides an explanation of the different features.

# Processing
The first step in processing the data is a function that reads in the subject numbers, activity labels, feature names, and results. The feature names are then assigned as column names for the results dataframe and two new columns are added: "Subject" and "Activity" which are filled with the subject numbers and activity numbers respectively.

This function is used to process both the training dataset and the test dataset to create two dataframes with 563 variables (columns). These two dataframes are then merged to create one dataframe ("Merged_Data") of 10299 observations of 563 variables.

The next step is to apply activity lables to the data frame rather than activity numbers. This is done by reading in the activity names and using the sapply command to replace the activity numbers with activity names.

To keep only the features that are means or standard deviations the features file is read again and the grep command is used to select only features with "mean or std" in their name. This list is used to subset the merged data to keep only the means and standard deviations. 

To create the tidy dataset, the melt command from the reshape pacakge is used to "re-shape" the data frame into a dataframe with 813621 observations of four variables (subject, activity, variable, value). The cast command is then used to create the tidy dataset that has 180 observations for 81 variables (one for each combination of subject and activity).






