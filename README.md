# Coursera Getting and Cleaning Data Course Project
My course project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
To achieve this student must work with [HAR Data Set](#Human-Activity-Recognition-Using-Smartphones-Data-Set)
As result of my work this repository contains next files:
- `Readme.md` - contains information about data set creation, and provides short overview of the data;
- `CodeBook.md` which describes the contents of the data set; 
- `run_analysis.R`, contains all operation (download, read, merge, select, rename, save to file, collect tidy data) with data set. 


## <a>Human Activity Recognition Using Smartphones Data Set</a>
[Human Activity Recognition database](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.</br></br>
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. </br></br>
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.
