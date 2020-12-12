library(dplyr)

# -------Download Data-----------------------------------------------------------------------

# data url
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "UCI HAR Dataset.zip"

# if file already exist
if (!file.exists(fileName)) {
        download.file(dataUrl, fileName, mode = "wb")
}

# unzip if directory doesn't already exist
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
        unzip(fileName)
}


# -------Read Data--------------------------------------------------------------------------

# read data from features.txt
features <- read.table(file.path(dataPath, "features.txt"), 
                       col.names = c("", "functions"),
                       as.is = TRUE)

# read data from activity_labels.txt
activity_labels <- read.table(file.path(dataPath, "activity_labels.txt"), 
                              col.names = c("", "Activity"),
                              colClasses = c(rep("NULL", 1), rep("character", 1)))

# read data from test directory files
x_test <- read.table(file.path(dataPath, "test", "X_test.txt"), col.names = features$functions)
y_test <- read.table(file.path(dataPath, "test", "y_test.txt"), col.names = "actindex")
subject_test <- read.table(file.path(dataPath, "test", "subject_test.txt"), col.names = "Subject")


# read data from train directory files
x_train <- read.table(file.path(dataPath, "train", "X_train.txt"), col.names = features$functions)
y_train <- read.table(file.path(dataPath, "train", "y_train.txt"), col.names = "actindex")
subject_train <- read.table(file.path(dataPath, "train", "subject_train.txt"), col.names = "Subject")


# -------Use descriptive activity names to name the activities in the data set----------------------------------------------
y_test <- mutate(y_test, Activity = activity_labels[actindex,], actindex = NULL)
y_train <- mutate(y_train, Activity = activity_labels[actindex,], actindex = NULL)
rm(activity_labels) # remove activity_labels

# -------Merges the training and the test sets to create one data set.--------------------------------------------------------- 

# bind test data
test <- subject_test %>% bind_cols(y_test, x_test)

# bind train data
train <- subject_train %>% bind_cols(y_train, x_train)

# bind train with test data
resultData <- bind_rows(test, train)

# free up memory
rm(y_test, x_test, subject_test, y_train, x_train, subject_train, train, test)


# -------Extracts only the measurements on the mean and standard deviation for each measurement----
resultData <- select(resultData, Subject, Activity, contains("mean", ignore.case = TRUE), 
                     contains("std", ignore.case = TRUE))


# -------Appropriately labels the data set with descriptive variable names------------------------
names(resultData) <- gsub("\\.", "", names(resultData))
names(resultData) <- gsub("^t", "Time", names(resultData))
names(resultData) <- gsub("tBody", "TimeBody", names(resultData))
names(resultData) <- gsub("Freq", "Frequency", names(resultData))
names(resultData) <- gsub("^f", "Frequency", names(resultData))
names(resultData) <- gsub("^angle", "Angle", names(resultData))
names(resultData) <- gsub("Acc", "Accelerometer", names(resultData))
names(resultData) <- gsub("Gyro", "Gyroscope", names(resultData))
names(resultData) <- gsub("BodyBody", "Body", names(resultData))
names(resultData) <- gsub("Mag", "Magnitude", names(resultData))
names(resultData) <- gsub("mean", "Mean", names(resultData))
names(resultData) <- gsub("gravity", "Gravity", names(resultData))
names(resultData) <- gsub("std", "StandardDeviation", names(resultData))


# -------Create a second, independent tidy set with the average of each variable for each activity and each subject--------------------------

# sort by Subject variable
resultData <- arrange(resultData, Subject)

# group by Subject,Activity and summarise each group using mean function
groupedData <- resultData %>% group_by(Subject, Activity) %>% summarize_all(funs(mean))

# save data to file
write.table(groupedData, "tidy_data.txt", row.names = FALSE)
