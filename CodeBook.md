Source Data
===========
Feature Selection
----------------- 

The raw data contains 561 features (variables), of which 33 unique readings (signal variables) were taken between a combination of test and train experiments. These were combined so that there were 10,299 observations in all.
The rest of the variables contain estimates of statistical and physical characteristics of the data.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAcceleration-XYZ and TimeAngularVelocity-XYZ. These time domain signals (prefix 'Time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAcceleration-XYZ and TimeGravityAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyLinearJerk-XYZ and TimeBodyAngularJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (variables ending in "Magnitude"). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing the 13 frequency domain variables (prefix "Frequency"). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


Tidy Data
=========

Feature Selection
-----------------

79 of the 561 features were extracted for use in the tidy data. This in addition to the Subject and Activity makes the data frame 81 columns wide. The features consist of two main groups: time domain variables (of which there are 40), and frequency domain variables (of which there are 39).

Within each of those groups, the time domain variables (prefix "Time") contain mean and standard deviation values.
The frequency domain variables (prefix "Frequency") consist of mean, standard deviation, and mean frequency values.

All of the feature values from both time and frequency domains have been normalized between 1 and -1.

Variable Names were altered to more descriptive names and follow this format prior to calculations of Mean and Standard Deviation on each:

TimeBodyAcceleration.XYZ                Time            Body        Acceleration        X or Y or Z
TimeGravityAcceleration.XYZ             Time            Gravity     Acceleration        X or Y or Z
TimeBodyLinearJerk.XYZ                  Time            Body        Linear Jerk         X or Y or Z
TimeBodyAngularVelocity.XYZ             Time            Body        Angular Velocity    X or Y or Z
TimeBodyAngularJerk.XYZ                 Time            Body        Angular Jerk        X or Y or Z
TimeBodyAccelerationMagnitude           Time            Body        Acceleration        Magnitude
TimeGravityAccelerationMagnitude        Time            Gravity     Acceleration        Magnitude
TimeBodyLinearJerkMagnitude             Time            Body        Linear Jerk         Magnitude
TimeBodyAngularVelocityMagnitude        Time            Body        Angular Velocity    Magnitude
TimeBodyAngularJerkMagnitude            Time            Body        Angular Jerk        Magnitude
FrequencyBodyAcceleration.XYZ           Frequency       Body        Acceleration        X or Y or Z
FrequencyBodyLinearJerk.XYZ             Frequency       Body        Linear Jerk         X or Y or Z
FrequencyBodyAngularVelocity.XYZ        Frequency       Body        Angular Velocity    X or Y or Z
FrequencyBodyAccelerationMagnitude      Frequency       Body        Acceleration        Magnitude
FrequencyBodyLinearJerkMagnitude        Frequency       Body        Linear Jerk         Magnitude
FrequencyBodyAngularVelocityMagnitude   Frequency       Body        Angular Velocity    Magnitude
FrequencyBodyAngularJerkMagnitude       Frequency       Body        Angular Jerk        Magnitude

All variables in the tidy data set beginning with prefix "Time" include either ".Mean" or ".StandardDeviation" suffix.
All variables in the tidy data set beginning with prefix "Frequency" include ".Mean", ".StandardDeviation", or ".MeanFrequency" suffix

Variable "Subject" is an integer between 1 and 30. It represents the subject of the experiment.
Variable "Activity" is one of the six activities from which signal data was recorded during the experiment. These are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

Observations
------------

The second, independent tidy data contains 180 observations of the average of each feature (variable) for each activity and each subject. 30 subjects multiplied by 6 activities yields 180 observations in total. The 10,299 observations were split into one of these 180 categories (matching both Subject and Activity), and the average within each split is what appears under each Variable header.


	 Column Index                                 Variable Name Class of Variable
	 ------------ 								  ------------- -----------------

	  1                                                 Subject           integer
	  2                                                Activity         character
	  3                             TimeBodyAcceleration.Mean.X           numeric
	  4                             TimeBodyAcceleration.Mean.Y           numeric
	  5                             TimeBodyAcceleration.Mean.Z           numeric
	  6                TimeBodyAcceleration.StandardDeviation.X           numeric
	  7                TimeBodyAcceleration.StandardDeviation.Y           numeric
	  8                TimeBodyAcceleration.StandardDeviation.Z           numeric
	  9                          TimeGravityAcceleration.Mean.X           numeric
	 10                          TimeGravityAcceleration.Mean.Y           numeric
	 11                          TimeGravityAcceleration.Mean.Z           numeric
	 12             TimeGravityAcceleration.StandardDeviation.X           numeric
	 13             TimeGravityAcceleration.StandardDeviation.Y           numeric
	 14             TimeGravityAcceleration.StandardDeviation.Z           numeric
	 15                               TimeBodyLinearJerk.Mean.X           numeric
	 16                               TimeBodyLinearJerk.Mean.Y           numeric
	 17                               TimeBodyLinearJerk.Mean.Z           numeric
	 18                  TimeBodyLinearJerk.StandardDeviation.X           numeric
	 19                  TimeBodyLinearJerk.StandardDeviation.Y           numeric
	 20                  TimeBodyLinearJerk.StandardDeviation.Z           numeric
	 21                          TimeBodyAngularVelocity.Mean.X           numeric
	 22                          TimeBodyAngularVelocity.Mean.Y           numeric
	 23                          TimeBodyAngularVelocity.Mean.Z           numeric
	 24             TimeBodyAngularVelocity.StandardDeviation.X           numeric
	 25             TimeBodyAngularVelocity.StandardDeviation.Y           numeric
	 26             TimeBodyAngularVelocity.StandardDeviation.Z           numeric
	 27                              TimeBodyAngularJerk.Mean.X           numeric
	 28                              TimeBodyAngularJerk.Mean.Y           numeric
	 29                              TimeBodyAngularJerk.Mean.Z           numeric
	 30                 TimeBodyAngularJerk.StandardDeviation.X           numeric
	 31                 TimeBodyAngularJerk.StandardDeviation.Y           numeric
	 32                 TimeBodyAngularJerk.StandardDeviation.Z           numeric
	 33                      TimeBodyAccelerationMagnitude.Mean           numeric
	 34         TimeBodyAccelerationMagnitude.StandardDeviation           numeric
	 35                   TimeGravityAccelerationMagnitude.Mean           numeric
	 36      TimeGravityAccelerationMagnitude.StandardDeviation           numeric
	 37                        TimeBodyLinearJerkMagnitude.Mean           numeric
	 38           TimeBodyLinearJerkMagnitude.StandardDeviation           numeric
	 39                   TimeBodyAngularVelocityMagnitude.Mean           numeric
	 40      TimeBodyAngularVelocityMagnitude.StandardDeviation           numeric
	 41                       TimeBodyAngularJerkMagnitude.Mean           numeric
	 42          TimeBodyAngularJerkMagnitude.StandardDeviation           numeric
	 43                        FrequencyBodyAcceleration.Mean.X           numeric
	 44                        FrequencyBodyAcceleration.Mean.Y           numeric
	 45                        FrequencyBodyAcceleration.Mean.Z           numeric
	 46           FrequencyBodyAcceleration.StandardDeviation.X           numeric
	 47           FrequencyBodyAcceleration.StandardDeviation.Y           numeric
	 48           FrequencyBodyAcceleration.StandardDeviation.Z           numeric
	 49               FrequencyBodyAcceleration.MeanFrequency.X           numeric
	 50               FrequencyBodyAcceleration.MeanFrequency.Y           numeric
	 51               FrequencyBodyAcceleration.MeanFrequency.Z           numeric
	 52                          FrequencyBodyLinearJerk.Mean.X           numeric
	 53                          FrequencyBodyLinearJerk.Mean.Y           numeric
	 54                          FrequencyBodyLinearJerk.Mean.Z           numeric
	 55             FrequencyBodyLinearJerk.StandardDeviation.X           numeric
	 56             FrequencyBodyLinearJerk.StandardDeviation.Y           numeric
	 57             FrequencyBodyLinearJerk.StandardDeviation.Z           numeric
	 58                 FrequencyBodyLinearJerk.MeanFrequency.X           numeric
	 59                 FrequencyBodyLinearJerk.MeanFrequency.Y           numeric
	 60                 FrequencyBodyLinearJerk.MeanFrequency.Z           numeric
	 61                     FrequencyBodyAngularVelocity.Mean.X           numeric
	 62                     FrequencyBodyAngularVelocity.Mean.Y           numeric
	 63                     FrequencyBodyAngularVelocity.Mean.Z           numeric
	 64        FrequencyBodyAngularVelocity.StandardDeviation.X           numeric
	 65        FrequencyBodyAngularVelocity.StandardDeviation.Y           numeric
	 66        FrequencyBodyAngularVelocity.StandardDeviation.Z           numeric
	 67            FrequencyBodyAngularVelocity.MeanFrequency.X           numeric
	 68            FrequencyBodyAngularVelocity.MeanFrequency.Y           numeric
	 69            FrequencyBodyAngularVelocity.MeanFrequency.Z           numeric
	 70                 FrequencyBodyAccelerationMagnitude.Mean           numeric
	 71    FrequencyBodyAccelerationMagnitude.StandardDeviation           numeric
	 72        FrequencyBodyAccelerationMagnitude.MeanFrequency           numeric
	 73                   FrequencyBodyLinearJerkMagnitude.Mean           numeric
	 74      FrequencyBodyLinearJerkMagnitude.StandardDeviation           numeric
	 75          FrequencyBodyLinearJerkMagnitude.MeanFrequency           numeric
	 76              FrequencyBodyAngularVelocityMagnitude.Mean           numeric
	 77 FrequencyBodyAngularVelocityMagnitude.StandardDeviation           numeric
	 78     FrequencyBodyAngularVelocityMagnitude.MeanFrequency           numeric
	 79                  FrequencyBodyAngularJerkMagnitude.Mean           numeric
	 80     FrequencyBodyAngularJerkMagnitude.StandardDeviation           numeric
	 81         FrequencyBodyAngularJerkMagnitude.MeanFrequency           numeric