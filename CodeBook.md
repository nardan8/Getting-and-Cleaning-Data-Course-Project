# CodeBook. *Getting and Cleaning Data Course Project*

### Data
The `tidy_data.txt` is the space-separated file which was created as a result of R script file`run_analysis.R` execution.
The first row of this file contains Variables, and other rows contains values.

### Variables
- `Subject`. This variable stores volunteer number, range from 1 to 30.
- `Activity`.This variable contains each person performed six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
##### Measurement Variables
Value type: floating-point numbers.
Value range: [-1; 1].
- `TimeBodyAccelerometerMeanX`
- `TimeBodyAccelerometerMeanY`
- `TimeBodyAccelerometerMeanZ`
- `TimeGravityAccelerometerMeanX`
- `TimeGravityAccelerometerMeanY`
- `TimeGravityAccelerometerMeanZ`
- `TimeBodyAccelerometerJerkMeanX` 
- `TimeBodyAccelerometerJerkMeanY` 
- `TimeBodyAccelerometerJerkMeanZ` 
- `TimeBodyGyroscopeMeanX`
- `TimeBodyGyroscopeMeanY`
- `TimeBodyGyroscopeMeanZ`
- `TimeBodyGyroscopeJerkMeanX`
- `TimeBodyGyroscopeJerkMeanY`
- `TimeBodyGyroscopeJerkMeanZ`
- `TimeBodyAccelerometerMagnitudeMean`
- `TimeGravityAccelerometerMagnitudeMean`
- `TimeBodyAccelerometerJerkMagnitudeMean`
- `TimeBodyGyroscopeMagnitudeMean` </br>
- `TimeBodyGyroscopeJerkMagnitudeMean`
- `FrequencyBodyAccelerometerMeanX`
- `FrequencyBodyAccelerometerMeanY`
- `FrequencyBodyAccelerometerMeanZ`
- `FrequencyBodyAccelerometerMeanFrequencyX`
- `FrequencyBodyAccelerometerMeanFrequencyY`
- `FrequencyBodyAccelerometerMeanFrequencyZ`
- `FrequencyBodyAccelerometerJerkMeanX`
- `FrequencyBodyAccelerometerJerkMeanY`
- `FrequencyBodyAccelerometerJerkMeanZ`
- `FrequencyBodyAccelerometerJerkMeanFrequencyX`
- `FrequencyBodyAccelerometerJerkMeanFrequencyY`
- `FrequencyBodyAccelerometerJerkMeanFrequencyZ`
- `FrequencyBodyGyroscopeMeanX`
- `FrequencyBodyGyroscopeMeanY`
- `FrequencyBodyGyroscopeMeanZ`
- `FrequencyBodyGyroscopeMeanFrequencyX`
- `FrequencyBodyGyroscopeMeanFrequencyY`
- `FrequencyBodyGyroscopeMeanFrequencyZ`
- `FrequencyBodyAccelerometerMagnitudeMean`
- `FrequencyBodyAccelerometerMagnitudeMeanFrequency`
- `FrequencyBodyAccelerometerJerkMagnitudeMean` 
- `FrequencyBodyAccelerometerJerkMagnitudeMeanFrequency` 
- `FrequencyBodyGyroscopeMagnitudeMean`
- `FrequencyBodyGyroscopeMagnitudeMeanFrequency`
- `FrequencyBodyGyroscopeJerkMagnitudeMean`
- `FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency`
- `AngleTimeBodyAccelerometerMeanGravity`
- `AngleTimeBodyAccelerometerJerkMeanGravityMean`
- `AngleTimeBodyGyroscopeMeanGravityMean`
- `AngleTimeBodyGyroscopeJerkMeanGravityMean`
- `AngleXGravityMean`
- `AngleYGravityMean`
- `AngleZGravityMean`
- `TimeBodyAccelerometerStandardDeviationX`
- `TimeBodyAccelerometerStandardDeviationY`
- `TimeBodyAccelerometerStandardDeviationZ`
- `TimeGravityAccelerometerStandardDeviationX`
- `TimeGravityAccelerometerStandardDeviationY`
- `TimeGravityAccelerometerStandardDeviationZ`
- `TimeBodyAccelerometerJerkStandardDeviationX`
- `TimeBodyAccelerometerJerkStandardDeviationY`
- `TimeBodyAccelerometerJerkStandardDeviationZ`
- `TimeBodyGyroscopeStandardDeviationX`
- `TimeBodyGyroscopeStandardDeviationY`
- `TimeBodyGyroscopeStandardDeviationZ`
- `TimeBodyGyroscopeJerkStandardDeviationX`
- `TimeBodyGyroscopeJerkStandardDeviationY`
- `TimeBodyGyroscopeJerkStandardDeviationZ`
- `TimeBodyAccelerometerMagnitudeStandardDeviation`
- `TimeGravityAccelerometerMagnitudeStandardDeviation`
- `TimeBodyAccelerometerJerkMagnitudeStandardDeviation`
- `TimeBodyGyroscopeMagnitudeStandardDeviation`
- `TimeBodyGyroscopeJerkMagnitudeStandardDeviation`
- `FrequencyBodyAccelerometerStandardDeviationX` 
- `FrequencyBodyAccelerometerStandardDeviationY`
- `FrequencyBodyAccelerometerStandardDeviationZ`
- `FrequencyBodyAccelerometerJerkStandardDeviationX`
- `FrequencyBodyAccelerometerJerkStandardDeviationY`
- `FrequencyBodyAccelerometerJerkStandardDeviationZ`
- `FrequencyBodyGyroscopeStandardDeviationX`
- `FrequencyBodyGyroscopeStandardDeviationY`
- `FrequencyBodyGyroscopeStandardDeviationZ`
- `FrequencyBodyAccelerometerMagnitudeStandardDeviation`
- `FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation`
- `FrequencyBodyGyroscopeMagnitudeStandardDeviation`
- `FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation`
### Operations
The following operation applied to the source data:
1. Activity numeric values replaced by descriptive activity label values.
2. Performed merging to combine train and test data set into one data set.
3. Performed selection to extract only the measurements on the mean and standard deviation (variables which contain "mean" or "std" strings).
4. Performed next changes to data set column names to make them more descriptive:
    - Any "." character removed.
    - Column names which start from "t" replaced by "Time".
    - "tBody" replaced by "TimeBody".
    - "Freq" replaced by "Frequency".
    - Column names which start from "f" replaced by "Frequency".
    - "angle" replaced by "Angle".
    - "Acc" replaced by "Accelerometer".
    - "Gyro" replaced by "Gyroscope".
    - "BodyBody" replaced by "Body".
    - "Mag" replaced by "Magnitude".
    - "mean" replaced by "Mean".
    - "gravity" replaced by "Gravity".
    - "std" replaced by "StandardDeviation".
5. Creatied the second, independent tidy set with the average of each variable for each activity and each subject. 
