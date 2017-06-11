# Load library reshape2
library(reshape2)
# Go to directory where files are
setwd("./data")
# read in the descriptive files
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("Id","Activity")
features        <- read.table("features.txt")

# Go to the training directory
setwd("./train")
# read in the training files
subject_train <- read.table("subject_train.txt")
X_train       <- read.table("X_train.txt")
y_train       <- read.table("y_train.txt")

# Go to the test directory
setwd("../test")
# read in the training files
subject_test  <- read.table("subject_test.txt")
X_test        <- read.table("X_test.txt")
y_test        <- read.table("y_test.txt")

#Return to original directory
setwd("../..")

# Merge train & test data
subject <- rbind(subject_train,subject_test)
# Set columnname of subject
names(subject) <- "Subject"
X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)
# Set columnname of activities (y)
names(y) <- "Activity"


#Set names of X_train columns
names(X) <- features$V2
# select only columns for mean and std
X <- X[,grep("(mean[(][])])|(std[(][])])",features$V2)]

# Add subjectID & activity to each row in X
X <- cbind(subject, y, X)
# Replace activity id in X with description from activity_labels
X$Activity <- activity_labels$Activity[match(X$Activity,activity_labels$Id)]

# Melt all measurements on Subject & Activity
Xmelted <- melt(X,id=c("Subject","Activity"),measure.vars = colnames(X)[3:ncol(X)])

# Cast the melted data to frame again, calculating the mean for it
Xmeans <- dcast(Xmelted,Subject+Activity~variable,mean)

write.table(Xmeans,"Xmeans.txt",row.name=FALSE)