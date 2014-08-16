# Function to load the data files and merge them so that activity names, features and subjects
# included
loaddata <- function(type) {
  Subject_Label <- read.table(paste("UCI HAR Dataset/", type, "/subject_", type, ".txt", sep=""))
  Activity_Label <- read.table(paste("UCI HAR Dataset/", type, "/y_", type, ".txt", sep=""))
  Features <- read.table (paste("UCI HAR Dataset/", "features.txt", sep=""))
  Data <- read.table(paste("UCI HAR Dataset/", type, "/X_", type, ".txt", sep=""))
  names(Data) <- Features[,2]
  colnames(Subject_Label) <- "Subject"
  colnames(Activity_Label) <- "Activity"
  dataset <- cbind(cbind(Subject_Label, Activity_Label), Data)
  return(dataset)
}
# Apply the loaddata function to the training and test datasets
test <- loaddata("test")
train <- loaddata("train")

# Merge the test and train data frames
Merged_Data <- rbind(train,test)

# Get the activity labels from the original data set
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt")

# Apply the activity labels to the merged data set
Merged_Data$Activity <- sapply(Merged_Data$Activity, function(x) activityNames[x,2])

# Get the feature names from the original data set
featureNames <- read.table("UCI HAR Dataset/features.txt")

# Assign column names to the feature names dataframe
colnames(featureNames) <- c("Fid", "Feature_Name")

# Keep the feature names that include "mean" or "std" in their name
subFeatures <- grep("mean|std", featureNames[,2], value=TRUE)

# Subset the merged dataframe withe the fearures just selected above
keepData <- subset(Merged_Data, select = c("Subject", "Activity", subFeatures))

library(reshape)
# Use the melt function to rearrange the subsetted dataframe in preparation for creating the
# tidy data set
Melted_Data <- melt(keepData, id=c("Subject", "Activity"))

# Create the tidy data set using the cast command
tidy <- cast(Melted_Data, Subject + Activity ~ variable, mean)

