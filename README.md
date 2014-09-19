GetnCleanData
=============

##Data Science Specialization - Coursera
###"Getting and Cleaning Data Course Project"


This repository was created as part of a Coursera couse project, Getting and Cleaning Data.

####The files contained in this repo are the following:

 - README.md - This file you are actually reading
 - run_analysis.R - R code aimed at getting a dataset and preparing from it a tidy new dataset
 - CodeBook.md - The codebook describes the variables, the data and transformations


##Script overview
##run_analysis.R

This code was created to achieve the following objectives

 - downloads a [dataset][1] which was obtained from [UCI Machine Learning Repository][2];
 - (1) Merge the training and the test sets to create one data set;
 - (2) Extract only the measurements on the mean and standard deviation for each measurement; 
 - (3) Use descriptive activity names to name the activities in the data set;
 - (4) Appropriately label the data set with descriptive activity names;
 - (5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code is subdivided in to functions designed to performs each of the goals described above. The numbered step (1-5) are the specific targets of this assignment. 



##Walkthrough

The script follows the goals step by step.

Step 1 -`get.dataset`  function:

 - Checks if data directory exists in the working directory and creates one if it doesn't;
 - Download and unzip original dataset if it has not been downloaded already.


Step 2 - `merge.datasets` function: (Goal number 1)

 - Function reads and merges training and test datasets and returns a list of the merged x, y and subject datasets;
 

Step 3 - `extract.mean.and.sd` function: (Goal number 2)

 - Extracts only the measurements on the mean and standard deviation for each measurement.


Step 4 - `name.activities` function: (Goal number 3)

 - Uses descriptive activity names for the activities in the dataset


Step 5 - `relabel.data` function: (Goal number 4)

 - Makes variable names more descriptive by using full words and removing undesired characters;
 - Combine mean-std values (x), activities (y) and subjects into one data frame.


Step 6 - `create.tidy.dataset` function: (Goal number 5)

 - Checks if required package is installed and installs it if necessary;
 - Creates a new independent tidy dataset with the average of each variable for each activity and each subject.

Step 7 - `clean.data` function: (Goal number 4)

 - Wrap up function calling all above functions to clean up and produce a tidy dataset.


##Run entire procedure
To run whole procedure, call `clean.data()` function. The output cleaned data is created in the working directory.

  [1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  [2]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
</markdown></p>
