Input data sets:
===============

Testing dataset:

* test/x_test.txt - 2947 observations of 561 feature vectors. 
* test/y_test.txt - 2947 observations of activity IDs for 6 activities.  
* test/subject_test.txt - 2947 observations of subject IDs for 9 subjects.    

Training dataset:

* train/X_train.txt - 7352 observations of 561 feature vectors. 
* train/y_train.txt") - 7352 observations of activity IDs for 6 activities.
* train/subject_train.txt - 7352 observations of subject IDs for 21 subjects.  

Reference files:

* features.txt - ID and corresponding name of each of 561 feature vectors 
* activity_labels.txt - ID and corresponding name of 6 activities

Remaining files in the download are not used.

Process:
=======
On execution, the run_analysis.R script will perform the following steps:

1. Load the plyr and data.table R packages.
2. Check that the dataset exists; downloads and unzips a copy into the working directory if necessary.
3. Loads and merges the testing and training datasets for feature vector, activity and subject (separately). 
4. Names the merged activity and subject datasets as so, and uses feature_names.txt to rename the feature vector measures with descriptive names. 
5. Feature names containing "BodyBody" are transformed to contain "Body" instead. 
6. Subsets the feature vectors to include only those measurements on the mean or standard deviation for each observation by including only those features with "mean()" or "std()" in the name.
7. Combines the activity, subject and subsetted feature vectors into a single dataset.
8. Converts activity column into a factor and maps across the labels from activity_labels.txt.
9. Uses the dplyr package to calculate the means of feature observations for each activity and subject.
10. Outputs the above, tidied data into a text file called tidy_data.txt where the first row is the header.

Output:
=======
The tidy data.txt file contains an initial header row, and 180 observations of 68 variables consisting of:

* activity - Describes the activity being measured (LAYING, SITTING, STANDING, WALKING, WALKING\_DOWNSTAIRS, WALKING\_UPSTAIRS)
* subject - The ID of the subject being measured
* The average measurement for observations on 66 mean and standard deviation type measurements for that subject and activity.
* Mean type measurements include "mean()" towards the end of the name.
* Standard deviation type measurements include "std()" towards the end of the name.


