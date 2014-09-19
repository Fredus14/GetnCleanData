#########################################################################################################################
#                               Getting and Cleaning Data Course Project                                                #
#                                                                                                                       #
#    The following script was designed to prepare a tidy dataset combining data from different files available in       #
#    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip                             #
#                                                                                                                       #
#########################################################################################################################

# Create a data directory if it doesn't exist and download and unzip dataset if it has not been done before
get.dataset = function() {
        
        #Check if data directory exists in the working directory and creates one if it doesn't 
        if (!file.exists("data")) {
                message("Creating data directory...")
                dir.create("data")
        }
        
        # Download and unzip original dataset if it has not been downloaded already
        if (!file.exists("data/UCI HAR Dataset")) {
                fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                zipfile="data/UCI_HAR_data.zip"
                message("Downloading data...")
                download.file(fileURL, destfile=zipfile, method="curl")
                unzip(zipfile, exdir="data")
        }
}

#  Objective 1. Merge the training and the test sets to create a single dataset.
merge.datasets = function() {
        #Function reads and merges training and test datasets and returns a list
        #of the merged x, y and subject datasets
        
        # Read data into memory
        message("reading X_train.txt...")
                training.x <- read.table("data/UCI HAR Dataset/train/X_train.txt")
        message("reading y_train.txt...")
                training.y <- read.table("data/UCI HAR Dataset/train/y_train.txt")
        message("reading subject_train.txt...")
                training.subject <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
        message("reading X_test.txt...")
                test.x <- read.table("data/UCI HAR Dataset/test/X_test.txt")
        message("reading y_test.txt...")
                test.y <- read.table("data/UCI HAR Dataset/test/y_test.txt")
        message("reading subject_test.txt...")
                test.subject <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
        
        # Merge training and test datasets
        message("Merging training and test datasets...")
        merged.x <- rbind(training.x, test.x)
        merged.y <- rbind(training.y, test.y)
        merged.subject <- rbind(training.subject, test.subject)
        
        # Return a list of x, y and subject merged datasets
        list(x=merged.x, y=merged.y, subject=merged.subject)
}

#Objective 2.Extract only the measurements on the mean and standard deviation for each measurement.
#(values are in x merged dataset). 
extract.mean.and.sd = function(df) {
        
        message("Extracting mean and standard deviation for each measurement...")
        # Read the feature list file into memory
        features <- read.table("data/UCI HAR Dataset/features.txt")
        
        # Find the mean and sd columns
        mean.cols <- sapply(features[,2], function(x) grepl("mean", x, fixed=T))
        sd.cols <- sapply(features[,2], function(x) grepl("std", x, fixed=T))
        
        # Subset extracted mean and standard deviation data
        subset.df <- df[, (mean.cols | sd.cols)]
        colnames(subset.df) <- features[(mean.cols | sd.cols), 2]
        subset.df
}

#Objective 3. Use descriptive activity names to name the activities in the data set
name.activities = function(df) {
        message("Applying descriptive activity names to the activities in the data set...")
        colnames(df) <- "activity"
        df$activity[df$activity == 1] = "WALKING"
        df$activity[df$activity == 2] = "WALKING_UPSTAIRS"
        df$activity[df$activity == 3] = "WALKING_DOWNSTAIRS"
        df$activity[df$activity == 4] = "SITTING"
        df$activity[df$activity == 5] = "STANDING"
        df$activity[df$activity == 6] = "LAYING"
        df
}

#Objective 4.Appropriately labels the data set with descriptive variable names. 
relabel.data <- function(x, y, subjects) {
        
        message("Labelling data set with descriptive variable names...")
        # Make variable names more descriptive by using full words and removing undesired characters
        names(x) <- gsub('Acc','Acceleration', names(x))
        names(x) <- gsub('Mag','Magnitude', names(x))
        names(x) <- gsub('Freq','Frequency', names(x))
        names(x) <- gsub('Gyro','AngularVelocity', names(x))
        names(x) <- gsub('mean','Mean', names(x))
        names(x) <- gsub('std','StandardDeviation', names(x))
        names(x) <- gsub("[-()]", "", names(x))
        
        # Combine mean-std values (x), activities (y) and subjects into one dataframe
        cbind(x, y, subjects)     
}

#Objective 5. From the data set in step 4, create a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
create.tidy.dataset = function(df) {

        message("Creating tidy dataset...")
         
        # Check if required package is installed and installs it if not
        if(!is.element("plyr", installed.packages()[,1])){
                print("Installing required packages...")
                install.packages("plyr")
        }        
        library(plyr)
        
        tidy <- ddply(df, .(subject, activity), function(x) colMeans(x[,1:60]))
        tidy
}

#Wrap up function calling all above functions to clean up and produce a tidy dataset
clean.data = function() {
        # Download data
        get.dataset()
        # merge training and test datasets. merge.datasets function returns a list
        # of three dataframes: x, y, and subject
        merged <- merge.datasets()
        # Extract only the measurements of the mean and standard deviation for each
        # measurement
        cx <- extract.mean.and.sd(merged$x)
        # Name activities
        cy <- name.activities(merged$y)
        # Use descriptive column name for subjects
        colnames(merged$subject) <- c("subject")
        # Combine data frames into a single one and use descriptive variable names
        combined <- relabel.data(cx, cy, merged$subject)
        # Create tidy dataset
        tidy <- create.tidy.dataset(combined)
        # Write tidy dataset as txt as requested in project instructions
        write.table(tidy, "UCI_HAR_tidy.txt", row.names=FALSE)
        message("***********************************************************************")
        message("The tidy dataset file (UCI_HAR_tidy.txt) has been saved in the working directory!")
}

#To perform the assigned project script call the function below
clean.data()