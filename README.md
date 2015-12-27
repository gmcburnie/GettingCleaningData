Introduction
============
An R script - run_analysis.R - which will download activity tracking data, and output a tidied dataset showing mean values of observations by activity and subject for the test and training datasets.

Requirements
============
Requires the "plyr" and "data.table" R packages.

Requires the following [data files][1] from the [Human Activity Recognition Using Smartphones][2] study to be unzipped in the working directory. *The script will attempt to download and unzip the file if it is not present in that location.*

References and further information
==================================

* [Code book][3] - Describes input and output files, variables and processes used. 
* [UCI - Machine Learning Repository - Human Activity Recognition Using Smartphones Data Set][2] - Source of the dataset and further information about the study.
* [Dataset download mirror][1] - Mirror of original dataset in zip format.

[1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Dataset download mirror"
[2]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "UCI - Machine Learning Repository - Human Activity Recognition Using Smartphones Data Set"
[3]: CodeBook.md