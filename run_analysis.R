rm(list = ls())

setwd("/Users/user/Documents/Machine Learning/data science specialization coursera/DSS3/W4")

# getting the data from the UCI dataset
# x, y and s come from the x data, y data and subject data respectively
trainx <- read.table("./data/UCI HAR Dataset/train/X_train.txt",sep = "", header = F)
trainy <- read.table("./data/UCI HAR Dataset/train/y_train.txt",sep = "", header = F)
trains <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",sep = "", header = F)
testx <- read.table("./data/UCI HAR Dataset/test/X_test.txt",sep = "", header = F)
testy <- read.table("./data/UCI HAR Dataset/test/y_test.txt",sep = "", header = F)
tests <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",sep = "", header = F)

# merging data (question 1)
mrgx <- rbind(trainx,testx) # the training data is merged with the test data 
mrgy <- rbind(trainy,testy)
mrgs <- rbind(trains,tests)

# we only select the mean and standard deviation in each direction (question 2) :
datax <- mrgx[,1:6]

# we name the activity variable data according to its name in the activity label file (question 3)
desc <- read.table("./data/UCI HAR Dataset/activity_labels.txt",sep = "", header = F)
namey <- mrgy
for (i in 1:dim(mrgy)[1]){
  idx <- mrgy[i,1]
  namey[i,1] <- as.character(desc[idx,2])
} 

# the resulting merged data is below
data <- cbind(datax,namey,mrgs)

# we then name all the variable (question 4)
names(data) <- c("meanX","meanY","meanZ",
                 "stdX","stdY","stdZ",
                 "activity","subject")



# for the second dataset (question 5), we gather (split) the data along activity and subject
datasplit <- split(data,data$activity) #activity split
res <- NULL #resulting dataset initialization
for (i in 1:length(datasplit)){
  data1 <- datasplit[[i]]
  data1split <- split(data1,data1$subject) #subject split
  for (j in 1:length(data1split)){
    data2 <- data1split[[j]]
    mn <- colMeans(data2[,1:6]) # average calculation for a given activity and subject
    newres <- cbind(as.data.frame(t(mn)),desc[i,2],as.character(j)) # the means are augmented with subject and activity names
    res <- rbind(res,newres) # the loop is then binding the new results to the old ones 
  }
}
# we finally gives a label to each variable for the resulting data set
names(res) <- c("meanX","meanY","meanZ",
                 "stdX","stdY","stdZ",
                 "activity","subject")
write.table(res,file = "data.txt",row.name=FALSE)

