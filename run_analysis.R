

# The data has accelerometer data for triaxial acceleration
# and radial acceleration. In addition to the raw data, the
# sets include several calculated values, such as mean, 
# standard deviation, maximum, and more.

# The data is divided into a "test" set and a "train" set.
# These will be merged for this project.

# In separate files there are labels identifying the subject
# by number, 1 throught 30, for each record, labels for the 
# train and test data, and activity identifiers, plus
# an activity key.

# Load all of the data and correlate the lengths of the vectors
# The "X" files take a long time; uncomment for final version

setwd("C:/documents/work/R/Coursera/GetCleanData/ProjectData")
library(reshape2)

xtrain <- read.table("train/X_train.txt", header = FALSE)
trainactlabels <- read.table("train/y_train.txt", header = FALSE)
xtest <- read.table("test/X_test.txt", header = FALSE)
testactlabels <- read.table("test/y_test.txt", header = FALSE)
subjtrain <- read.table("train/subject_train.txt", header = FALSE)
subjtest <- read.table("test/subject_test.txt", header = FALSE)
xfeatures <- read.table("features.txt", header = FALSE)
actlabels <- read.table("activity_labels.txt", header = FALSE)


str(xtrain, max.level = 0)
str(trainactlabels)
str(xtest, max.level = 0)
str(testactlabels)
str(xfeatures)
str(subjtrain, max.level = 0)
str(subjtest, max.level = 0)
str(actlabels)

# find only the labels that match mean and std and form
# a vector to pull out only those items

means <- grep("mean", xfeatures[,2])
stds <- grep("std", xfeatures[,2])
ms <- c(means, stds)

# merge the test and train data, train first
# to keep observations in order for subject id's, etc.
# FUTURE: it would be easy to mix up the order
# train-test would be better solved programmatically than
# by rote order

x <- rbind(xtrain, xtest)
subj <- rbind(subjtrain, subjtest)
actcode <- rbind(trainactlabels, testactlabels)

# take only the data relating to means and stsd
# these are columns/features we are taking from X_train
# and X_test

y <- x[,ms]
`
# transform feature columns into readable names

names(y) <- xfeatures[ms,2]

# add Activity and Subject to the data

names(actcode) <- "Activity"
names(subj) <- "Subject"

y <- cbind(actcode, y)
y <- cbind(subj, z)
