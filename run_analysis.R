## Task: create one R script called run_analysis.R that does the following. 

#####################################################################
## a) Merges the training and the test sets to create one data set.
#####################################################################

## a1) check folder exists, otherwise exist with warning message
message("checking ./UCI HAR Dataset exits")
folder <- "./UCI HAR Dataset"
if (!file.exists(folder)) { stop("./UCI HAR Dataset does not exits!")}

## a2) load data frome training/testing data
loaddata <- function(name) {
    if (!(name %in% c("train", "test"))) {stop("no such folder!")}
    foldername <- paste(folder, "/", name, sep="")
    
    ## read subject
    subject <- read.table(paste(foldername, "/", "subject_", name, ".txt", 
                                sep=""), colClasses="numeric")
    ## read X
    feature <- read.table(paste(foldername, "/", "X_", name, ".txt", sep=""),
                          colClasses="numeric")
    ## read Y
    activityid <- read.table(paste(foldername, "/", "y_", name, ".txt", sep=""),
                             colClasses="numeric")
    
    ## return data frame
    data <- data.frame(subject=subject, activityid=activityid, 
                       activity=activityid, feature=feature)
}

foldertrain <- paste(folder, "/train", sep="")
message("checking UCI HAR Dataset/train exists...")
if (!file.exists(foldertrain)) { stop("./UCI HAR Dataset/train does not exits!")}

## load training data 
message("loading train data...")
traindata <- loaddata("train")
## load testing data
message("loading test data...")
testdata <- loaddata("test")
## row combine training and testing data
traintestdata <- rbind(traindata, testdata)

################################################################################
## b) Extracts only the measurements on the mean and standard deviation for 
## each measurement. 
################################################################################

## load feature names
message("select mean and standard deviation for each measurement...")
featurename <- read.table(paste(folder, "/features.txt", sep=""))[[2]]
featurename <- as.character(levels(featurename))[featurename]

## subset featurename to find names contain "-mean()" or "-std()"
featureindex <- grepl("-mean[^F]()|-std()", featurename)
featurename <- featurename[featureindex]

## clean names
## remove parenthsis
featurename <- gsub("\\(\\)", "", featurename)
## replace "-" by "."
featurename <- gsub("-", ".", featurename)

featurename <- gsub("Body", "body.", featurename)
## remove duplication substring "Body" in the names
featurename <- gsub("body.body.", "body.", featurename)

## replace abbre by full name
## "t" -> "time"
# "f" -> "frequency"
## "Acc" -> acceleration
## "Mag" -> magnitude
## "Gyro" -> gyroscope
featurename <- gsub("Acc", "acceleration.", featurename)
featurename <- gsub("Mag", "magnitude.", featurename)
featurename <- gsub("Gyro", "gyroscope.", featurename)
featurename <- gsub("Jerk", "jerk.", featurename)
featurename <- gsub("^t", "time.", featurename)
featurename <- gsub("^f", "frequency.", featurename)

## remove duplicate "."
featurename <- gsub("\\.\\.", "\\.", featurename)
## to lower case
featurename <- tolower(featurename)

## subset features, only keep mean or std features
traintestdata <- traintestdata[, c(TRUE, TRUE, TRUE, featureindex)]
## add names to each col
names(traintestdata) <- c("subject", "activity.id", "activity.name", featurename)

################################################################################
## c) Uses descriptive activity names to name the activities in the data set
################################################################################

message("add activity names to data...")
## load activity names
activityname <- read.table(paste(folder, "/activity_labels.txt", sep=""))[[2]]
## turn factor to vector
actitityname <- as.character(levels(activityname))[activityname]

## replace "_" by "." and turn character to lower case
activityname <- tolower(gsub("_", ".", activityname))
## set activity name in traintestdata
traintestdata$activity.name <- activityname[traintestdata$activity.name]

################################################################################
## d) Appropriately labels the data set with descriptive activity names. 
################################################################################

## this is done in step b)

################################################################################
## e) Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject. 
################################################################################
message("create tidydata set...")
## split traintestdata according to subject and activity.name columns
splitdata <- split(traintestdata, list(traintestdata$subject, 
                                       traintestdata$activity.name))
## function used to extract average for each measurements
colmean <- function(data) {
    datamean <- colMeans(data[, c(-1,-2,-3)])
    res <- c(data[1,1:3], datamean)
    as.data.frame(res)
}
## apply lapply to each element in splitdata
## use rbind to combine list to a dataframe
tidydata <- do.call(rbind, lapply(splitdata, colmean))

## add "average" to the names of measurements
names(tidydata) <- c(names(tidydata)[1:3], 
                        paste(names(tidydata)[c(-1,-2,-3)],"average", sep="."))
## store tidydata into file
write.table(tidydata, file="tidydata.txt", sep="\t")
message("Data preprocessing done...")