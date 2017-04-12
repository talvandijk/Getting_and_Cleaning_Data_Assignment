Codebook
================

Introduction
------------

This document contains the codebook for the tidy dataset that I prepared in the framework of the week 4 project of the course "Getting and Cleaning Data".

Experiments
-----------

The experiments have been carried out with a group of 30 volunteers each identified by their "subject\_id". Each person performed six activities (see "Variables" section) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). From each window, a vector of features was obtained by calculating variables from the TIME and FREQUENCY domain.

Variables
---------

This codebook contains only a list of the second and final tidy dataset. This dataset summarizes the measurements per subject for each activity they performed and contains the following variables:

    ##  [1] "subjectid"                          
    ##  [2] "activitylabel"                      
    ##  [3] "avg_TimeBodyAccMeanX"               
    ##  [4] "avg_TimeBodyAccMeanY"               
    ##  [5] "avg_TimeBodyAccMeanZ"               
    ##  [6] "avg_TimeBodyAccStDevX"              
    ##  [7] "avg_TimeBodyAccStDevY"              
    ##  [8] "avg_TimeBodyAccStDevZ"              
    ##  [9] "avg_TimeGravityAccMeanX"            
    ## [10] "avg_TimeGravityAccMeanY"            
    ## [11] "avg_TimeGravityAccMeanZ"            
    ## [12] "avg_TimeGravityAccStDevX"           
    ## [13] "avg_TimeGravityAccStDevY"           
    ## [14] "avg_TimeGravityAccStDevZ"           
    ## [15] "avg_TimeBodyAccJerkMeanX"           
    ## [16] "avg_TimeBodyAccJerkMeanY"           
    ## [17] "avg_TimeBodyAccJerkMeanZ"           
    ## [18] "avg_TimeBodyAccJerkStDevX"          
    ## [19] "avg_TimeBodyAccJerkStDevY"          
    ## [20] "avg_TimeBodyAccJerkStDevZ"          
    ## [21] "avg_TimeBodyGyroMeanX"              
    ## [22] "avg_TimeBodyGyroMeanY"              
    ## [23] "avg_TimeBodyGyroMeanZ"              
    ## [24] "avg_TimeBodyGyroStDevX"             
    ## [25] "avg_TimeBodyGyroStDevY"             
    ## [26] "avg_TimeBodyGyroStDevZ"             
    ## [27] "avg_TimeBodyGyroJerkMeanX"          
    ## [28] "avg_TimeBodyGyroJerkMeanY"          
    ## [29] "avg_TimeBodyGyroJerkMeanZ"          
    ## [30] "avg_TimeBodyGyroJerkStDevX"         
    ## [31] "avg_TimeBodyGyroJerkStDevY"         
    ## [32] "avg_TimeBodyGyroJerkStDevZ"         
    ## [33] "avg_TimeBodyAccMagMean"             
    ## [34] "avg_TimeBodyAccMagStDev"            
    ## [35] "avg_TimeGravityAccMagMean"          
    ## [36] "avg_TimeGravityAccMagStDev"         
    ## [37] "avg_TimeBodyAccJerkMagMean"         
    ## [38] "avg_TimeBodyAccJerkMagStDev"        
    ## [39] "avg_TimeBodyGyroMagMean"            
    ## [40] "avg_TimeBodyGyroMagStDev"           
    ## [41] "avg_TimeBodyGyroJerkMagMean"        
    ## [42] "avg_TimeBodyGyroJerkMagStDev"       
    ## [43] "avg_FreqBodyAccMeanX"               
    ## [44] "avg_FreqBodyAccMeanY"               
    ## [45] "avg_FreqBodyAccMeanZ"               
    ## [46] "avg_FreqBodyAccStDevX"              
    ## [47] "avg_FreqBodyAccStDevY"              
    ## [48] "avg_FreqBodyAccStDevZ"              
    ## [49] "avg_FreqBodyAccMeanFreqX"           
    ## [50] "avg_FreqBodyAccMeanFreqY"           
    ## [51] "avg_FreqBodyAccMeanFreqZ"           
    ## [52] "avg_FreqBodyAccJerkMeanX"           
    ## [53] "avg_FreqBodyAccJerkMeanY"           
    ## [54] "avg_FreqBodyAccJerkMeanZ"           
    ## [55] "avg_FreqBodyAccJerkStDevX"          
    ## [56] "avg_FreqBodyAccJerkStDevY"          
    ## [57] "avg_FreqBodyAccJerkStDevZ"          
    ## [58] "avg_FreqBodyAccJerkMeanFreqX"       
    ## [59] "avg_FreqBodyAccJerkMeanFreqY"       
    ## [60] "avg_FreqBodyAccJerkMeanFreqZ"       
    ## [61] "avg_FreqBodyGyroMeanX"              
    ## [62] "avg_FreqBodyGyroMeanY"              
    ## [63] "avg_FreqBodyGyroMeanZ"              
    ## [64] "avg_FreqBodyGyroStDevX"             
    ## [65] "avg_FreqBodyGyroStDevY"             
    ## [66] "avg_FreqBodyGyroStDevZ"             
    ## [67] "avg_FreqBodyGyroMeanFreqX"          
    ## [68] "avg_FreqBodyGyroMeanFreqY"          
    ## [69] "avg_FreqBodyGyroMeanFreqZ"          
    ## [70] "avg_FreqBodyAccMagMean"             
    ## [71] "avg_FreqBodyAccMagStDev"            
    ## [72] "avg_FreqBodyAccMagMeanFreq"         
    ## [73] "avg_FreqBodyBodyAccJerkMagMean"     
    ## [74] "avg_FreqBodyBodyAccJerkMagStDev"    
    ## [75] "avg_FreqBodyBodyAccJerkMagMeanFreq" 
    ## [76] "avg_FreqBodyBodyGyroMagMean"        
    ## [77] "avg_FreqBodyBodyGyroMagStDev"       
    ## [78] "avg_FreqBodyBodyGyroMagMeanFreq"    
    ## [79] "avg_FreqBodyBodyGyroJerkMagMean"    
    ## [80] "avg_FreqBodyBodyGyroJerkMagStDev"   
    ## [81] "avg_FreqBodyBodyGyroJerkMagMeanFreq"

Measurements were made while subjects were performing the following six activities:

    ##   activityid      activitylabel
    ## 1          1            WALKING
    ## 2          2   WALKING_UPSTAIRS
    ## 3          3 WALKING_DOWNSTAIRS
    ## 4          4            SITTING
    ## 5          5           STANDING
    ## 6          6             LAYING

### Source

Results of the experiments were presented by: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
