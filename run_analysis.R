library(dplyr)

#First read the data from the folder
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_train <-  read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <-  read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

#1.Merges the training and the test sets to create one data set
X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)
colnames(subject) <- "subjectId"
colnames(X) <- features[,2]
colnames(y) <- "activityId"
colnames(activity_labels) <- c('activityId','activityType')

#2.Extracts only the measurements on the mean and standard deviation for each measurement
colNamesWithMean <- grep("mean", colnames(X), value = TRUE)
colNamesWithstd <- grep("std", colnames(X), value = TRUE)
setForMeanAndStd <- X[,c(colNamesWithMean,colNamesWithstd)]

#3. Uses descriptive activity names to name the activities in the data set
ActivityNameTable <- merge(y, activity_labels, by='activityId', all.x=TRUE)
setWithActivityNames <- cbind(ActivityNameTable$activityType,setForMeanAndStd)
colnames(setWithActivityNames)[1] <- "activityType"

#4. Appropriately labels the data set with descriptive variable names
#As done in first step

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject
dataset = cbind(subject,setWithActivityNames)
cleanDataset = aggregate(dataset[,3:81],list(dataset$subjectId,dataset$activityType),mean)
colnames(cleanDataset)[1:2]<- c("subjectId","activityType")
write.table(cleanDataset, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)





