# CodeBook for run_analysis.R

Per README.md ensure that the data has been downloaded and extracted correctly. Then install the packages referenced within the R script if they are not already installed. 

This information will guide you through AT_MEANS.txt output (created by run_analysis.R)

## Source Data - Background

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Process (explanation of run_analysis.R)

Both pairs of Training and Test datasets were loaded into R so that they might be labeled appropriately and combined. Due to the separate data files containing the Subjects and Activities for the data, the three had to be combined together. Afterwards the Training and Test datasets were unioned together. 

### AT_MEANS.txt

Finally a dataset was output with the following columns:

- subject: this is the ID value assigned to the subject
- Act_Label: attributes the various measures to one of 6 activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying)
- <em> Various Measure Columns:</em> These metrics are a subset of the total variables from the original data as we were just concerned with "Avg" (Average or mean measures) and "Std" (Standard Deviation measures). 

For a detailed explanation of each of the measures, please refer to the source data provider.


