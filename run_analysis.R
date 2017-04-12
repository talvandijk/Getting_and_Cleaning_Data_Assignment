###########################################################################################
###                                                                                     ###      
###   Peer-graded Assignment: Getting and Cleaning Data Course Project                  ###
###                                                                                     ###      
###   Objectives of this assignment are:                                                ###            
### - to prepare a TIDY dataset on basis of the provided raw datasets and related files ###
### - to prepare a codebook that describes the data and included variables              ###
### - to prepare a README file that describes the task step by step                     ###
### - to prepare another tidy dataset - on the basis of this dataset - that             ###
###   gives the averages of each variable per tested subject on each performed activity ###      
###                                                                                     ###
###########################################################################################

### Download and unzip the relevant files from the URL provided on the course site
### fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
### download.file(fileurl, destfile = "projectdata.zip", method="curl")
### projectdata <- unzip("projectdata.zip")

### It is assumed that the zip file has been downloaded and unzipped into a specific directory
### on your computer system; in the script the paths point to the datasets 
### in the UCI HAR Dataset directory

### This is my path. To run the code you'll obviously have to adjust it to your situation
setwd("/home/tal/Documents/Coursera/UCI HAR Dataset")

### Check which files are in the working directory
dir()

### READ datasets and related files
### Read in the features
features <- read.table("./features.txt")

### First we're going to read the TRAINING dataset and related files
activitycodes_train <- read.table("./train/y_train.txt")
colnames(activitycodes_train) <- "activityid"
train <- read.table("./train/X_train.txt", header = FALSE)
colnames(train) <- features[,2]
subject_train <- read.table("./train/subject_train.txt")
colnames(subject_train) <- "subjectid"

### Here we do the same for the TEST dataset and its related files
activitycodes_test <- read.table("./test/y_test.txt")
colnames(activitycodes_test) <- "activityid"
test <- read.table("./test/X_test.txt", header = FALSE)
colnames(test) <- features[,2]
subject_test <- read.table("./test/subject_test.txt")
colnames(subject_test) <- "subjectid"

### Binding the TRAINING datasets together
train_merge <- cbind(activitycodes_train, subject_train, train)

### Binding the TEST datasets together
test_merge <- cbind(activitycodes_test, subject_test, test)

### Binding TRAINING and TEST datasets
allmerge <- rbind(train_merge, test_merge)

### Reading the activity labels corresponding to the activity codes in the y-files
activity = read.table('./activity_labels.txt')
colnames(activity) <- c("activityid", "activitylabel")

### Adding variable for the activities (text)
library(dplyr)
allmerge <- merge(allmerge, activity, by = "activityid")

### We're only interested in the activity id (and their labels), subject id
### and average scores and standard deviations
relevant <- (grepl("mean", colnames(allmerge)) |
             grepl("std", colnames(allmerge)) |
             grepl("activityid", colnames(allmerge)) |
             grepl("activitylabel", colnames(allmerge)) |
             grepl("subjectid", colnames(allmerge))    
             )

allmerge <- allmerge[, relevant == TRUE]
str(allmerge)

### Deleting irrelevant punctuations from variable names
### and changing "mean" and "std" to something clearer
colnames(allmerge) <- gsub("[[:punct:]]", "", colnames(allmerge))
colnames(allmerge) <- gsub("mean", "Mean", colnames(allmerge))
colnames(allmerge) <- gsub("std", "StDev", colnames(allmerge))
colnames(allmerge) <- sub("^f", "Freq", colnames(allmerge))
colnames(allmerge) <- sub("^t", "Time", colnames(allmerge))
colnames(allmerge)

allmerge <- allmerge[, c(1,82, 2:81)]
colnames(allmerge)
str(allmerge)

### Saves the resulting dataframe as a csv file
write.csv(allmerge, "./allmerge_tidy.csv")

### Summarizing per test subject on each performed activity
allmerge_agg <- 
  allmerge %>%
  group_by(subjectid, activitylabel) %>%
  summarize(avg_TimeBodyAccMeanX = mean(TimeBodyAccMeanX, na.rm = TRUE),
            avg_TimeBodyAccMeanY = mean(TimeBodyAccMeanY, na.rm = TRUE),
            avg_TimeBodyAccMeanZ = mean(TimeBodyAccMeanZ, na.rm = TRUE),
            avg_TimeBodyAccStDevX = mean(TimeBodyAccStDevX, na.rm = TRUE),
            avg_TimeBodyAccStDevY = mean(TimeBodyAccStDevY, na.rm = TRUE),
            avg_TimeBodyAccStDevZ = mean(TimeBodyAccStDevZ, na.rm = TRUE),
            avg_TimeGravityAccMeanX = mean(TimeGravityAccMeanX, na.rm = TRUE),
            avg_TimeGravityAccMeanY = mean(TimeGravityAccMeanY, na.rm = TRUE),
            avg_TimeGravityAccMeanZ = mean(TimeGravityAccMeanZ, na.rm = TRUE),
            avg_TimeGravityAccStDevX = mean(TimeGravityAccStDevX, na.rm = TRUE),
            avg_TimeGravityAccStDevY = mean(TimeGravityAccStDevY, na.rm = TRUE),
            avg_TimeGravityAccStDevZ = mean(TimeGravityAccStDevZ, na.rm = TRUE),
            avg_TimeBodyAccJerkMeanX = mean(TimeBodyAccJerkMeanX, na.rm = TRUE),
            avg_TimeBodyAccJerkMeanY = mean(TimeBodyAccJerkMeanY, na.rm = TRUE),
            avg_TimeBodyAccJerkMeanZ = mean(TimeBodyAccJerkMeanZ, na.rm = TRUE),
            avg_TimeBodyAccJerkStDevX = mean(TimeBodyAccJerkStDevX, na.rm = TRUE),
            avg_TimeBodyAccJerkStDevY = mean(TimeBodyAccJerkStDevY, na.rm = TRUE),
            avg_TimeBodyAccJerkStDevZ = mean(TimeBodyAccJerkStDevZ, na.rm = TRUE),
            avg_TimeBodyGyroMeanX = mean(TimeBodyGyroMeanX, na.rm = TRUE),
            avg_TimeBodyGyroMeanY = mean(TimeBodyGyroMeanY, na.rm = TRUE),
            avg_TimeBodyGyroMeanZ = mean(TimeBodyGyroMeanZ, na.rm = TRUE),
            avg_TimeBodyGyroStDevX = mean(TimeBodyGyroStDevX, na.rm = TRUE),
            avg_TimeBodyGyroStDevY = mean(TimeBodyGyroStDevY, na.rm = TRUE),
            avg_TimeBodyGyroStDevZ = mean(TimeBodyGyroStDevZ, na.rm = TRUE),
            avg_TimeBodyGyroJerkMeanX = mean(TimeBodyGyroJerkMeanX, na.rm = TRUE),
            avg_TimeBodyGyroJerkMeanY = mean(TimeBodyGyroJerkMeanY, na.rm = TRUE),
            avg_TimeBodyGyroJerkMeanZ = mean(TimeBodyGyroJerkMeanZ, na.rm = TRUE),
            avg_TimeBodyGyroJerkStDevX = mean(TimeBodyGyroJerkStDevX, na.rm = TRUE),
            avg_TimeBodyGyroJerkStDevY = mean(TimeBodyGyroJerkStDevY, na.rm = TRUE),
            avg_TimeBodyGyroJerkStDevZ = mean(TimeBodyGyroJerkStDevZ, na.rm = TRUE),
            avg_TimeBodyAccMagMean = mean(TimeBodyAccMagMean, na.rm = TRUE),
            avg_TimeBodyAccMagStDev = mean(TimeBodyAccMagStDev, na.rm = TRUE),
            avg_TimeGravityAccMagMean = mean(TimeGravityAccMagMean, na.rm = TRUE),
            avg_TimeGravityAccMagStDev = mean(TimeGravityAccMagStDev, na.rm = TRUE),
            avg_TimeBodyAccJerkMagMean = mean(TimeBodyAccJerkMagMean, na.rm = TRUE),
            avg_TimeBodyAccJerkMagStDev = mean(TimeBodyAccJerkMagStDev, na.rm = TRUE),
            avg_TimeBodyGyroMagMean = mean(TimeBodyGyroMagMean, na.rm = TRUE),
            avg_TimeBodyGyroMagStDev = mean(TimeBodyGyroMagStDev, na.rm = TRUE),
            avg_TimeBodyGyroJerkMagMean = mean(TimeBodyGyroJerkMagMean, na.rm = TRUE),
            avg_TimeBodyGyroJerkMagStDev = mean(TimeBodyGyroJerkMagStDev, na.rm = TRUE),
            avg_FreqBodyAccMeanX = mean(FreqBodyAccMeanX, na.rm = TRUE),
            avg_FreqBodyAccMeanY = mean(FreqBodyAccMeanY, na.rm = TRUE),
            avg_FreqBodyAccMeanZ = mean(FreqBodyAccMeanZ, na.rm = TRUE),
            avg_FreqBodyAccStDevX = mean(FreqBodyAccStDevX, na.rm = TRUE),
            avg_FreqBodyAccStDevY = mean(FreqBodyAccStDevY, na.rm = TRUE),
            avg_FreqBodyAccStDevZ = mean(FreqBodyAccStDevZ, na.rm = TRUE),
            avg_FreqBodyAccMeanFreqX = mean(FreqBodyAccMeanFreqX, na.rm = TRUE),
            avg_FreqBodyAccMeanFreqY = mean(FreqBodyAccMeanFreqY, na.rm = TRUE),
            avg_FreqBodyAccMeanFreqZ = mean(FreqBodyAccMeanFreqZ, na.rm = TRUE),
            avg_FreqBodyAccJerkMeanX = mean(FreqBodyAccJerkMeanX, na.rm = TRUE),
            avg_FreqBodyAccJerkMeanY = mean(FreqBodyAccJerkMeanY, na.rm = TRUE),
            avg_FreqBodyAccJerkMeanZ = mean(FreqBodyAccJerkMeanZ, na.rm = TRUE),
            avg_FreqBodyAccJerkStDevX = mean(FreqBodyAccJerkStDevX, na.rm = TRUE),
            avg_FreqBodyAccJerkStDevY = mean(FreqBodyAccJerkStDevY, na.rm = TRUE),
            avg_FreqBodyAccJerkStDevZ = mean(FreqBodyAccJerkStDevZ, na.rm = TRUE),
            avg_FreqBodyAccJerkMeanFreqX = mean(FreqBodyAccJerkMeanFreqX, na.rm = TRUE),
            avg_FreqBodyAccJerkMeanFreqY = mean(FreqBodyAccJerkMeanFreqY, na.rm = TRUE),
            avg_FreqBodyAccJerkMeanFreqZ = mean(FreqBodyAccJerkMeanFreqZ, na.rm = TRUE),
            avg_FreqBodyGyroMeanX = mean(FreqBodyGyroMeanX, na.rm = TRUE),
            avg_FreqBodyGyroMeanY = mean(FreqBodyGyroMeanY, na.rm = TRUE),
            avg_FreqBodyGyroMeanZ = mean(FreqBodyGyroMeanZ, na.rm = TRUE),
            avg_FreqBodyGyroStDevX = mean(FreqBodyGyroStDevX, na.rm = TRUE),
            avg_FreqBodyGyroStDevY = mean(FreqBodyGyroStDevY, na.rm = TRUE),
            avg_FreqBodyGyroStDevZ = mean(FreqBodyGyroStDevZ, na.rm = TRUE),
            avg_FreqBodyGyroMeanFreqX = mean(FreqBodyGyroMeanFreqX, na.rm = TRUE),
            avg_FreqBodyGyroMeanFreqY = mean(FreqBodyGyroMeanFreqY, na.rm = TRUE),
            avg_FreqBodyGyroMeanFreqZ = mean(FreqBodyGyroMeanFreqZ, na.rm = TRUE),
            avg_FreqBodyAccMagMean = mean(FreqBodyAccMagMean, na.rm = TRUE),
            avg_FreqBodyAccMagStDev = mean(FreqBodyAccMagStDev, na.rm = TRUE),
            avg_FreqBodyAccMagMeanFreq = mean(FreqBodyAccMagMeanFreq, na.rm = TRUE),
            avg_FreqBodyBodyAccJerkMagMean = mean(FreqBodyBodyAccJerkMagMean, na.rm = TRUE),
            avg_FreqBodyBodyAccJerkMagStDev = mean(FreqBodyBodyAccJerkMagStDev, na.rm = TRUE),
            avg_FreqBodyBodyAccJerkMagMeanFreq = mean(FreqBodyBodyAccJerkMagMeanFreq, na.rm = TRUE),
            avg_FreqBodyBodyGyroMagMean = mean(FreqBodyBodyGyroMagMean, na.rm = TRUE),
            avg_FreqBodyBodyGyroMagStDev = mean(FreqBodyBodyGyroMagStDev, na.rm = TRUE),
            avg_FreqBodyBodyGyroMagMeanFreq = mean(FreqBodyBodyGyroMagMeanFreq, na.rm = TRUE),
            avg_FreqBodyBodyGyroJerkMagMean = mean(FreqBodyBodyGyroJerkMagMean, na.rm = TRUE),
            avg_FreqBodyBodyGyroJerkMagStDev = mean(FreqBodyBodyGyroJerkMagStDev, na.rm = TRUE),
            avg_FreqBodyBodyGyroJerkMagMeanFreq = mean(FreqBodyBodyGyroJerkMagMeanFreq, na.rm = TRUE)
  )

write.csv(allmerge_agg, "./allmerge_aggregated.csv")


            
  

