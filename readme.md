Read Me
================

Getting and Cleaning Data Assignment
------------------------------------

In this repository my work on the assignment of Johns Hopkins University's MOOC "Getting and Cleaning Data" is presented.

The data used in the assignment represent relevant measurements of experiments carried out with a group of 30 volunteers, each of whom performed six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying). The measurements were recorded using an accelerometer and a gyroscope which were embedded in a smartphone that the test subjects were wearing on their waist.

In the repository you will find the following files:

-   run\_analysis.R : the R script which reads all relevant datasets and variable labels and manipulates, merges and summarizes data
-   codebook.md : a Markdown document containing all variable names in the final tidy dataset
-   readme.md : this Markdown document
-   allmerge\_tidy.csv : the first tidy dataset only containing variables for identification of test subject and activity and means and standard deviations of the measurements
-   allmerge\_aggregated.csv : the second tidy dataset, which provides for each of the 30 test subjects for each activity they performed averages of all measurement variables in the first tidy dataset

#### Source

The outcomes of the experiments described above were presented at the International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain, December 2012, by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz, under the title "Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine".
