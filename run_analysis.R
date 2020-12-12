library(dplyr)

#-------UCI HAR Dataset path-----------------------------------------------------------------
path <- "C:/Users/User/Documents/Data Science/R projects/data/UCI HAR Dataset/"

# ------Path---------------------------------------------------------------------
# features
features_path <- paste(path, "features.txt", sep = "")
#activity
activity_labels_path <- paste(path, "activity_labels.txt", sep = "")

# test
x_test_path <- paste(path, "test/X_test.txt", sep = "")
y_test_path <- paste(path, "test/y_test.txt", sep = "")
subject_test_path <- paste(path, "test/subject_test.txt", sep = "")

# train
x_train_path <- paste(path, "train/X_train.txt", sep = "")
y_train_path <- paste(path, "train/y_train.txt", sep = "")
subject_train_path <- paste(path, "train/subject_train.txt", sep = "")


# -------Load Features and Activity--------------------------------------------------------------------------

# load data from features.txt
features <- read.table(file = features_path, 
                       col.names = c("", "functions"), 
                       colClasses = c(rep("NULL", 1), rep("character", 1)))
# load data from activity_labels.txt
activity_labels <- read.table(file = activity_labels_path, 
                              col.names = c("", "activity"),
                              colClasses = c(rep("NULL", 1), rep("character", 1)))


# -------Load Test Data----------------------------------------------------------
x_test <- read.table(file = x_test_path, col.names = features$functions)
y_test <- read.table(file = y_test_path, col.names = "actindex")
subject_test <- read.table(file = subject_test_path, col.names = "subject")


# -------Load Train Data----------------------------------------------------------
x_train <- read.table(file = x_train_path, col.names = features$functions)
y_train <- read.table(file = y_train_path, col.names = "actindex")
subject_train <- read.table(file = subject_train_path, col.names = "subject")


# -------Replace Indexes With Labels----------------------------------------------
y_test <- mutate(y_test, activity = activity_labels[actindex,], actindex = NULL)
y_train <- mutate(y_train, activity = activity_labels[actindex,], actindex = NULL)
rm(activity_labels) # remove activity_labels

# -------Bind, Select Columns. Test--------------------------------------------------------- 
test <- subject_test %>% 
        bind_cols(y_test, x_test) %>%
        select(subject, activity, contains("mean", ignore.case = TRUE), 
               contains("std", ignore.case = TRUE))
# free up memory
rm(y_test)
rm(x_test)
rm(subject_test)


# -------Bind, Select Columns. Train--------------------------------------------------------- 
train <- subject_train %>% 
        bind_cols(y_train, x_train) %>%
        select(subject, activity, contains("mean", ignore.case = TRUE), 
               contains("std", ignore.case = TRUE))
# free up memory
rm(y_train)
rm(x_train)
rm(subject_train)


# -------Bind Test With Train----------------------------------------------------------------
resultData <- bind_rows(test, train)
# free up memory
rm(test)
rm(train)


# -------Rename Columns----------------------------------------------------------------------
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
names(resultData) <- gsub("std", "STD", names(resultData))
resultData <- rename(resultData, Subject = subject, Activity = activity)


# -------Sort By Subject--------------------------------------------------------------------
resultData <- arrange(resultData, Subject)

# -------Group, Mean Values------------------------------------------------------------------
groupedData <- resultData %>% group_by(Subject, Activity) %>% summarize_all(funs(mean))


# -------Save Data To File-------------------------------------------------------------------
write.table(groupedData, "GroupedData.txt", row.names = FALSE)