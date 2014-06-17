# ReadMe
 
#### Getting and Cleaning Data: Data Analysis Specialisation


### Introduction
The script run_analysis.R does the following:
0. Download and unzip the data from the given link. This takes care of the director requirement.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Detailed steps
***
##### Preliminary Step: Getting the data
The data for the activity was obtained from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

It was downloaded using download.file and then unzipped using unzip.

To make handling commands easier, the folder was renamed from "UCI HAR Dataset" to "uci" using file.rename.

***
##### Merges the training and the test sets to create one data set.
* Original data:

The data was given in 2 sets ,a training set and a test set. These sets were further divided into x_test,subject_test and y_test (similarly for the training set)

* Processing:

Using read.table, 3 tables of dimensions 2947x561,2947x1 and 2947x1 were obtained.
These were then combined using cbind to get one 2947x563 table named 'test'. Similarly, a 7352x563 table names 'train' was obtained.	These 2 tables were then combined using cbind to get one 10299x563 table named 'data'.

***

##### Uses descriptive activity names to name the activities in the data set
To obtain the required variables from the data, the list of features was obtained from features.txt using read.table.Renaming was done on the data frame for simpler handling.

For the purpose of this activity, I have considered only mean() and std().meanFreq() was not used. 

Using grep and concatenate, the list (named cols) of the columns containing either 'mean()' or 'std()' was obtained. Since we also need the subject id and the activity id, and these were the last 2 columns of the data set, 562 and 563 were added to the list.

The vector cols now contained all the column numbers required for extraction.The data was now subsetted using the cols vector.

***
##### Appropriately labels the data set with descriptive variable names. 

The 81st column of the dataset contained numbers from 1-6 which corresponded to the 6 activities given in activity\_labels.txt . So, the column was coerced into factor form by as.factor.

The list of activities from activity\_labels.txt was read into a variable called activity using read.table.The levels of the 81st column was then set to the above list using levels()

***
##### Creates a second, independent tidy data set with the average of each variable for each activity and each subject

The question said 'for each activity and each subject' so the ID variables were 'subject' and 'Activity'. The data frame was melt using melt() keeping the 2 above variables as ID variables and the remaining variables as measurement variables.

It was then cast into the required form using dcast() with mean as the function since the average was required.

The final table was written to a text file using write.table()

***	


#### Why is the data tidy?
* Each of the 79 variables (tBodyAcc_mean()_X,tBodyAcc_mean()_Y,etc) is in one column.
* Each different observation ie for each combination of Subject(1-6) and Activity(1-30) is in a different row.
* There is a row at the top with the variable names.
* All the data is saved in one file