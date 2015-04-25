library(plyr)

# Read measurement vectors and merge them together
test_measurements <- read.table("UCI_HAR_DATASET/test/X_test.txt")
training_measurements <- read.table("UCI_HAR_DATASET/train/X_train.txt")
merged_measurements <- rbind(test_measurements, training_measurements)

# Read labels and merge them together
test_labels <- read.table("UCI_HAR_DATASET/test/y_test.txt")
training_labels <- read.table("UCI_HAR_DATASET/train/y_train.txt")
merged_labels <- rbind(test_labels, training_labels)

# Read subjects and merge them together
test_subjects <- read.table("UCI_HAR_DATASET/test/subject_test.txt")
training_subjects <- read.table("UCI_HAR_DATASET/train/subject_train.txt")
merged_subjects <- rbind(test_subjects, training_subjects)
names(merged_subjects) <- "subject"

# Extract only measurements on mean and standard deviation
features <- read.table("UCI_HAR_DATASET/features.txt")
desired_features <- grep("-(mean|std)\\(\\)", features[, 2])
desired_measurements <- merged_measurements[, desired_features]

# Fix up measurement names
names(desired_measurements) <- features[desired_features, 2]

# Create descriptive labels
activities <- read.table("UCI_HAR_DATASET/activity_labels.txt")
descriptive_labels <- data.frame("activity" = activities[merged_labels[, 1], 2])

# Merge into single, tidy dataset
merged_data <- cbind(desired_measurements, descriptive_labels, merged_subjects)

# Create tidy dataset with average data, last two columns are subject and activity to omit them.
averages <- ddply(merged_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages, "averages_data.txt", row.name=FALSE)
