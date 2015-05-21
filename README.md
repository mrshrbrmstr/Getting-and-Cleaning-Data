# Getting and CLeaning Data Course Project

## Project Description

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## What is in this repository

* CodeBook.md: information about raw and tidy data sets, variable descriptions and what was done to transform the data
* README.md: this file
* run_analysis.R: R script to transform raw data into the tidy one

## How to create the tidy data set

1. Download data and unzip (URL above)
2. Open R Console or RStudio and set your working directory to the "UCI HAR Dataset" folder where the unzipped files are located
3. open and source the run_analysis.R script (it requires the plyr package): source('run_analysis.R')

In the working directory you will find the file 'mean_by_activity_and_subject.txt' which is the tidy data set.
