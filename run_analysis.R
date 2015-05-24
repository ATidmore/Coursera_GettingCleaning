setwd("~/Training/CourseraDataScience/3GettingCleansing/Week3/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

#install.packages("reshape2")

#install.packages("data.table")

library(reshape2)

library(data.table)

#read in pertinent data
xtrain <- read.table("train/X_train.txt")

ytrain <- read.table("train/y_train.txt")

xtest <- read.table("./test/X_test.txt")

ytest <- read.table("./test/y_test.txt")

#Only read second column here!
act_labels <- read.table("./activity_labels.txt")[ ,2]

features <- read.table("./features.txt")[ ,2]

#Exctract the "mean" and "std" features - returns logical:
my_features <- grepl("mean|std", features)

########## Training data section ################

# 1. Apply Features to the X-tran dataset
names(xtrain) <- features

# 2. Extract only the features we're concerned with
xtrain <- xtrain[ ,my_features]

# 3. Set up Activity data w/ ytrain
ytrain[,2] = act_labels[ytrain[,1]]
names(ytrain) = c("Act_ID", "Act_Label")
names(subtrain) = "subject"

# 4. Create final training set: bind subjects to train data to activities
train_ds <- cbind(subtrain, xtrain, ytrain)

########## Test data section ################

# 1. Apply Features to the X-test dataset
names(xtest) <- features

# 2. Extract only the features we're concerned with
xtest <- xtest[ ,my_features]

# 3. Set up Activity data w/ ytest
ytest[,2] = act_labels[ytest[,1]]
names(ytest) = c("Act_ID", "Act_Label")
names(subtest) = "subject"

# 4. Create final training set: bind subjects to test data to activities
test_ds <- cbind(subtest, xtest, ytest)

########## Prep final output section ################
final_ds <- rbind(train_ds, test_ds)

id_labels <- c("subject", "Act_ID", "Act_Label")
data_labels <- setdiff(colnames(final_ds), id_labels)
melt_ds   <- melt(final_ds, id = id_labels, measure.vars = data_labels)

# Create output data using reshape2.dcast
output <- dcast(melt_ds, subject + Act_Label ~ variable, mean)

write.table(output, file = "./AT_MEANS.txt", row.name = FALSE)

