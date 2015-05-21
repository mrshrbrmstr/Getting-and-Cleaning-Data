require(plyr)

UCI <- getwd()

## Read in the data and column names
## These are the variable names for the calculations made with all data collected
## There were 561 calculations, all described in the file features_info.txt

features <- read.table(paste(UCI, "/features.txt", sep = ""), 
                       colClasses = c("character"))

## Activity Labels are: 1-Walking, 2-Walking upstairs, 3-Walking downstairs, 4-Sitting, 5-Standing, 6-Laying
activity_labels <- read.table(paste(UCI, "/activity_labels.txt", sep = ""), 
                        col.names = c("ActivityID", "Activity"), stringsAsFactors = FALSE)
x_train <- read.table(paste(UCI, "/train/X_train.txt", sep = ""))
y_train <- read.table(paste(UCI, "/train/y_train.txt", sep = ""))
subject_train <- read.table(paste(UCI, "/train/subject_train.txt", sep = ""))
x_test <- read.table(paste(UCI, "/test/X_test.txt", sep = ""))
y_test <- read.table(paste(UCI, "/test/y_test.txt", sep = ""))
subject_test <- read.table(paste(UCI, "/test/subject_test.txt", sep = ""))

########################################################################################################
# ## Read all inertial signals train data in XYZ directions
# which I now comment out because it turns out for this assignment we don't need it.
# However, for future reference, we can un-comment it if needed.
# 
# body_acc_x_train <- read.table(paste(UCI, "/train/Inertial Signals/body_acc_x_train.txt", sep = ""))
# body_acc_y_train <- read.table(paste(UCI, "/train/Inertial Signals/body_acc_y_train.txt", sep = ""))
# body_acc_z_train <- read.table(paste(UCI, "/train/Inertial Signals/body_acc_z_train.txt", sep = ""))
# body_gyro_x_train <- read.table(paste(UCI, "/train/Inertial Signals/body_gyro_x_train.txt", sep = ""))
# body_gyro_y_train <- read.table(paste(UCI, "/train/Inertial Signals/body_gyro_y_train.txt", sep = ""))
# body_gyro_z_train <- read.table(paste(UCI, "/train/Inertial Signals/body_gyro_z_train.txt", sep = ""))
# total_acc_x_train <- read.table(paste(UCI, "/train/Inertial Signals/total_acc_x_train.txt", sep = ""))
# total_acc_y_train <- read.table(paste(UCI, "/train/Inertial Signals/total_acc_y_train.txt", sep = ""))
# total_acc_z_train <- read.table(paste(UCI, "/train/Inertial Signals/total_acc_z_train.txt", sep = ""))
# 
# ## Read all inertial signals test data in XYZ directions (commented out)
# 
# body_acc_x_test <- read.table(paste(UCI, "/test/Inertial Signals/body_acc_x_test.txt", sep = ""))
# body_acc_y_test <- read.table(paste(UCI, "/test/Inertial Signals/body_acc_y_test.txt", sep = ""))
# body_acc_z_test <- read.table(paste(UCI, "/test/Inertial Signals/body_acc_z_test.txt", sep = ""))
# body_gyro_x_test <- read.table(paste(UCI, "/test/Inertial Signals/body_gyro_x_test.txt", sep = ""))
# body_gyro_y_test <- read.table(paste(UCI, "/test/Inertial Signals/body_gyro_y_test.txt", sep = ""))
# body_gyro_z_test <- read.table(paste(UCI, "/test/Inertial Signals/body_gyro_z_test.txt", sep = ""))
# total_acc_x_test <- read.table(paste(UCI, "/test/Inertial Signals/total_acc_x_test.txt", sep = ""))
# total_acc_y_test <- read.table(paste(UCI, "/test/Inertial Signals/total_acc_y_test.txt", sep = ""))
# total_acc_z_test <- read.table(paste(UCI, "/test/Inertial Signals/total_acc_z_test.txt", sep = ""))
########################################################################################################

# The x-train, subject-train and y-train data gets glued together by columns into a single data frame

train_data <- cbind(cbind(x_train, subject_train), y_train)

# The x-test, subject-test and y-test data gets glued together by columns into a single data frame

test_data <- cbind(cbind(x_test, subject_test), y_test)

# Columns 1-561 of each of the new data frames has data that coincide with variables in features.txt
# Column 562 of each of the new data frames now lists the subject who carried out the experiment
# Column 563 of each of the new data frames now lists the Activity ID: 1 - 6
# Now combine the training data and testing data by rows: 2947 obs + 7352 obs = 10,299 obs in total

combined_data <- rbind(train_data, test_data)

# Create column labels

data_labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityID"))[,2]
names(combined_data) <- data_labels

# Use the grepl() function to separate out only the columns involving calculations of mean and standard deviation

combined_data_mean_std_dev <- combined_data[,grepl("mean|std|Subject|ActivityID", names(combined_data), ignore.case = FALSE)]

# Create a column for the name of each activity currently numbered 1 through 6 under ActivityID column name
# and attach (join) to the data table as the last column
# Subsequently the ActivityID column gets moved to column #1

combined_data_mean_std_dev <- join(combined_data_mean_std_dev, activity_labels, by = "ActivityID", match = "first")

# Remove the numeric ActivityID column that only has numbers 1 through 6

combined_data_mean_std_dev <- combined_data_mean_std_dev[,-1]

# Fix Data Labels and replace with descriptive and correctly formatted names

names(combined_data_mean_std_dev) <- gsub('()', "", names(combined_data_mean_std_dev), fixed=TRUE)
names(combined_data_mean_std_dev) <- gsub('BodyBody', "Body", names(combined_data_mean_std_dev), fixed=TRUE)
names(combined_data_mean_std_dev) <- make.names(names(combined_data_mean_std_dev))                             # replaces all dashes with dots
names(combined_data_mean_std_dev) <- gsub('^t', "Time", names(combined_data_mean_std_dev))                     # replaces an initial 't' with Time
names(combined_data_mean_std_dev) <- gsub('^f', "Frequency", names(combined_data_mean_std_dev))                # replaces an initial 'f' with Frequency
names(combined_data_mean_std_dev) <- gsub('.mean', ".Mean", names(combined_data_mean_std_dev), fixed = TRUE)
names(combined_data_mean_std_dev) <- gsub('.std', ".StandardDeviation", names(combined_data_mean_std_dev), fixed = TRUE)
names(combined_data_mean_std_dev) <- gsub('AccJerk', "LinearJerk", names(combined_data_mean_std_dev), fixed = TRUE)
names(combined_data_mean_std_dev) <- gsub('GyroJerk', "AngularJerk", names(combined_data_mean_std_dev), fixed = TRUE)
names(combined_data_mean_std_dev) <- gsub('Acc', "Acceleration", names(combined_data_mean_std_dev), fixed = TRUE)
names(combined_data_mean_std_dev) <- gsub('Gyro', "AngularVelocity", names(combined_data_mean_std_dev), fixed = TRUE)
names(combined_data_mean_std_dev) <- gsub('Mag.', "Magnitude.", names(combined_data_mean_std_dev), fixed = TRUE)
names(combined_data_mean_std_dev) <- gsub('Freq.', "Frequency.", names(combined_data_mean_std_dev), fixed = TRUE)
names(combined_data_mean_std_dev) <- gsub('Freq$', "Frequency", names(combined_data_mean_std_dev))            #replaces 'Freq' at end of name with 'Frequency'

## Calculate mean of each variable by Activity and by Subject; store in its own data table
## 30 subjects @ 6 activities each subject results in 180 calculations for each variable

mean_by_activity_and_subject <- ddply(combined_data_mean_std_dev, c("Subject", "Activity"), numcolwise(mean))
write.table(mean_by_activity_and_subject, row.name=FALSE, file = "mean_by_activity_and_subject.txt")