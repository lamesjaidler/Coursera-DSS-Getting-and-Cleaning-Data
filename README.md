# Coursera-DSS-Getting-and-Cleaning-Data
Project for the Coursera Data Science Specialisation module - Getting and Cleaning Data

The run_analysis.R script works by:

1) Downloading the relevant data in zip format to the working directory, then unzipping the folder. 
2) Reading the training and test datasets from the unzipped folder into R for the X, Y and subject data. Note that X data contains the 561 features, Y data contains the activity label and subject data contains the subject ID.
3) Merging the training and test datasets into singular sets (separate datasets for X, Y and subject data)
4) Converting activity labels (numbers 1 to 6) into descriptive names. The mapping is as follows:
    1 = walking
    2 = walking_upstairs
    3 = walking_downstairs
    4 = sitting
    5 = standing
    6 = laying
5) Applying descriptive column names to the X, Y and subject datasets. For Y and subject datasets, there is only one column in each set which correspond to the activity names and subject IDs respectively, so these are set manually - "activityName" for Y and "subjectID" for subject. The column names for the X dataset are applied using the features.txt file (included in the zip folder), which is a list of all the 561 features and their names.
6) Binding the X, Y and subject datasets into one dataset, named "one".
7) Using the grepl() function to select only columns that contain "mean()" or "std()" so as to included only those features that are means and standard deviations of the measurements. Note that the activityName and subjectID columns are also included in the reduced dataset, which is named "mean_std_one".
8) Using the "mean_std_one" dataset created in step 7 above to create a new dataset which averages all of the features by activityName and subjectID. The column names of these averaged features is also changed (adding a prefix of "Mean-" to each column name) so as not to confuse these columns with those in the "mean_std_one" dataset. This final dataset is named "mean_one".
9) Write the final dataset "mean_one" to a text file named "output.txt", using the write.table() function with the argument row.name=FALSE. This "output.txt" file is located in the GitHub repo.
