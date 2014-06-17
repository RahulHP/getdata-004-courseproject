## Load the required libraries.
## We need the reshape2 library to use the 'melt' and 'dcast' functions.
library(reshape2)


## Getting the file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ","uci.zip")
unzip("uci.zip",exdir=".")
file.rename("UCI HAR Dataset","uci")


## Merges the training and the test sets to create one data set.

## We first join the 3 given test sets into one main test set using read.table and cbind
x_test <- read.table("uci/test/X_test.txt",comment.char="",colClasses="numeric",header=FALSE)	## Dimensions: 2947x561
subject_test <- read.table("uci/test/subject_test.txt",comment.char="",colClasses="numeric",header=FALSE)	## Dimensions: 2947x1
y_test <- read.table("uci/test/y_test.txt",comment.char="",colClasses="numeric",header=FALSE)	## Dimensions: 2947x1
test <- cbind(x_test,subject_test,y_test)	## Dimentions: 2947x563

## After this, we  join the 3 given training sets into one main training set using read.table and cbind
x_train <- read.table("uci/train/X_train.txt",comment.char="",colClasses="numeric",header=FALSE)	## Dimensions: 7352x561
subject_train <- read.table("uci/train/subject_train.txt",comment.char="",colClasses="numeric",header=FALSE)	## Dimensions: 7352x1
y_train <- read.table("uci/train/y_train.txt",comment.char="",colClasses="numeric",header=FALSE)	## Dimensions: 7352x1
train <- cbind(x_train,subject_train,y_train)	## Dimensions: 7352x563

## We rbind the test set and the training set to create one data set
data <- rbind(test,train)	## Dimensions: 10299x563


## Extracts only the measurements on the mean and standard deviation for each measurement. 

## We read the list of features from the given text file.
features <- read.table("uci/features.txt")	## Dimensions: 561x2

## Renaming the feature vector into a simpler format.
features[,2] <- gsub("-","_",features[,2])

## We now need to find columns of the feature vector which contain either 'std()' or 'mean()' in them.We also need the last 2 columns of the data set because these columns contain the subject ID and the activity ID.These are the last 2 columns, ie 562 and 563

## Using grep, we can find the length of the required subset.
## 'mean()' occurs in 46 columns 	(via grep("mean()",features$V2))
## 'std()' 	occurs in 33 columns 	(via grep("std()",features$V2))
## 2 columns for subject ID and activity ID
## Therefore, the extracted data set should contain 81(46+33+2) columns and 10299 rows


## This column vector contains all the required columns
cols <- c(grep("mean()",features$V2),grep("std()",features$V2),562,563)	## Numerical vector of 81 terms

## We use the above cols vector to subset the data as required.
data <- data[,cols]		## Dimensions: 10299x81

## Uses descriptive activity names to name the activities in the data set

## We convert the activity column from a numeric class to a factor class.
data[,81]=as.factor(data[,81])
## We read in the activity names from the given text file.
activity <- read.table("uci/activity_labels.txt")	## Dimensions: 6x2
## We match the levels of the activity column to the respective activity 
levels(data[,81])= activity$V2


## Appropriately labels the data set with descriptive variable names. 

## We subset the required variables from the feature vector using the cols vector from before.
features <- features[cols,]		## Dimensions: 81x2

## We now label the columns using the subsetted features vector
colnames(data)=features$V2
colnames(data)[80] <- "subject"
colnames(data)[81] <- "Activity"

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## We now need to create another tidy data set. We will have to melt the data set for this.
## Since the question says "for each activity and each subject", the ID variables are 'subject' and 'Activity' and the remaining variables are the measured variables.
melt <- melt(data,id.vars=c("subject","Activity"))	## Dimensions: 813621x4

## We now cast the molten data frame into the required form
meltdata <- dcast(melt,subject+Activity ~ variable,mean)	## Dimensions: 180x81

## Using write.table to write the final dataset into a txt file.
write.table(meltdata,"uci/dataset.txt",row.names=FALSE)