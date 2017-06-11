# Getting-and-Cleaning-Data-Course-Project
Assignment course 3 in course Data Science

The R script run_analysis.R does the following:
1. reads in the UCI HAR dataset from which is split into a training & test set.
   Each set contains 4 text files:
   - a file with measurement data (561 measurements per line)
   - a file with the corresponding subject id's (one per line)
   - a descriptive text file containing the names of the measurements columns
   - a descriptive text file containing the description of the activities
     measured.
2. The training and test set are combined into one dataframe X
3. The columnnames of dataframe X are made descriptive
4. Columns not containing a mean or std value are removed from X 
5. The subject id & activity are added as columns to dataframe X
6. The values in the activity column are made descriptive
7. A new dataframe Xmeans is created containing the mean of each variable measured per
   subject id and activity
8. A textfile "Xmeans.txt" is created based on the dataframe Xmeans
