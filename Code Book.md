# Codebook

#### Getting and Cleaning Data: Data Analysis Specialisation

##### Original Data
The original data set was obtained from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


###### The original study
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

###### Technical Information
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


##### Names of columns
* tBodyAcc_mean()_X
* tBodyAcc_mean()_Y              
* tBodyAcc_mean()_Z
* tGravityAcc_mean()_X           
* tGravityAcc_mean()_Y
* tGravityAcc_mean()_Z           
* tBodyAccJerk_mean()_X
* tBodyAccJerk_mean()_Y          
* tBodyAccJerk_mean()_Z
* tBodyGyro_mean()_X             
* tBodyGyro_mean()_Y
* tBodyGyro_mean()_Z             
* tBodyGyroJerk_mean()_X
* tBodyGyroJerk_mean()_Y         
* tBodyGyroJerk_mean()_Z
* tBodyAccMag_mean()             
* tGravityAccMag_mean()
* tBodyAccJerkMag_mean()         
* tBodyGyroMag_mean()
* tBodyGyroJerkMag_mean()        
* fBodyAcc_mean()_X
* fBodyAcc_mean()_Y              
* fBodyAcc_mean()_Z
* fBodyAcc_meanFreq()_X          
* fBodyAcc_meanFreq()_Y
* fBodyAcc_meanFreq()_Z          
* fBodyAccJerk_mean()_X
* fBodyAccJerk_mean()_Y          
* fBodyAccJerk_mean()_Z
* fBodyAccJerk_meanFreq()_X      
* fBodyAccJerk_meanFreq()_Y
* fBodyAccJerk_meanFreq()_Z      
* fBodyGyro_mean()_X
* fBodyGyro_mean()_Y             
* fBodyGyro_mean()_Z
* fBodyGyro_meanFreq()_X         
* fBodyGyro_meanFreq()_Y
* fBodyGyro_meanFreq()_Z         
* fBodyAccMag_mean()
* fBodyAccMag_meanFreq()         
* fBodyBodyAccJerkMag_mean()
* fBodyBodyAccJerkMag_meanFreq() 
* fBodyBodyGyroMag_mean()
* fBodyBodyGyroMag_meanFreq()    
* fBodyBodyGyroJerkMag_mean()
* fBodyBodyGyroJerkMag_meanFreq()
* tBodyAcc_std()_X
* tBodyAcc_std()_Y               
* tBodyAcc_std()_Z
* tGravityAcc_std()_X            
* tGravityAcc_std()_Y
* tGravityAcc_std()_Z            
* tBodyAccJerk_std()_X
* tBodyAccJerk_std()_Y           
* tBodyAccJerk_std()_Z
* tBodyGyro_std()_X              
* tBodyGyro_std()_Y
* tBodyGyro_std()_Z              
* tBodyGyroJerk_std()_X
* tBodyGyroJerk_std()_Y          
* tBodyGyroJerk_std()_Z
* tBodyAccMag_std()              
* tGravityAccMag_std()
* tBodyAccJerkMag_std()          
* tBodyGyroMag_std()
* tBodyGyroJerkMag_std()         
* fBodyAcc_std()_X
* fBodyAcc_std()_Y               
* fBodyAcc_std()_Z
* fBodyAccJerk_std()_X           
* fBodyAccJerk_std()_Y
* fBodyAccJerk_std()_Z           
* fBodyGyro_std()_X
* fBodyGyro_std()_Y              
* fBodyGyro_std()_Z
* fBodyAccMag_std()              
* fBodyBodyAccJerkMag_std()
* fBodyBodyGyroMag_std()         
* fBodyBodyGyroJerkMag_std()
* subject                        
* Activity   


##### Units of data
'subject' refers to the IDs to the 30 volunteers who had taken part in this subject.

'Activity' is a factor which has the following levels

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING


The remaining variables are unitless values normalised and bounded to [-1,1]
