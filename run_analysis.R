# Installing necessary packages
install.packages("dplyr")
install.packages("data.table")

# Loading the installed packages
library(data.table)
library(dplyr)

# Reading training data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Reading test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Reading description of data
variable_names <- read.table("./UCI HAR Dataset/features.txt")

# Reading activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merging the training set and the test set to create one data set.
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)

# 2. Extracting only the measurements on the mean and standard deviation for each measurement.
selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_total <- X_total[,selected_var[,1]]

# 3. Using descriptive activity names for naming the activities in the data set
colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

# 4. Labelling the data set appropriately with descriptive variable names.
colnames(X_total) <- variable_names[selected_var[,1],2]

# 5. From the data set in step 4, creating a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Sub_total) <- "subject"
total <- cbind(X_total, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
