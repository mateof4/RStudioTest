#Importing features dataframe to have the column names and extract indexes of the desired ones
features <- read.table("./data/UCI HAR Dataset/features.txt")
feature_names <- features[,2]
desired_features_idxs <- grep('mean|std', feature_names)
desired_features_idxs

#Importing and merging Train dataframes with mean and std columns only
train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")[desired_features_idxs]
train_act <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
train_sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
all_train <- cbind(train_sub, train_act, train)
dim(all_train)

#Importing and merging Test dataframes
test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")[desired_features_idxs]
test_act <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
test_sub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
all_test <- cbind(test_sub, test_act, test)
dim(all_test)

#Names of the columns 
column_names <- append(feature_names[desired_features_idxs], c("subject","activity_id"), after=0)

#Merging train and test
merged <- rbind(all_train, all_test)
dim(merged)
colnames(merged)<- column_names
head(merged)

#Importing Activity identifers to merge with the principal df
act_lbls <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
colnames(act_lbls)[2] <- 'activity'
act_lbls
merged <- merge(merged, act_lbls, by.x='activity_id', by.y='V1', all.x = TRUE)
merged <- subset(merged, select = -c(activity_id))
head(merged)

library(dplyr)
merged %>% relocate('activity')

#New dataframe with the mean of all the columns grouped by activity and subject
mean_df <- merged %>% group_by(activity, subject) %>% 
  summarise(across(everything(), mean),
            .groups = 'drop')
head(mean_df,15)

write.table(mean_df, file='mean_df.txt', row.name=FALSE)
