#Intro
This dataset uses the instructions [here](https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions) to summarize a dataset of HCI data.

The original source data is included in the UCI\_HAR\_DATASET directory, and information on the source data can be found in its README.

#Variables
`test_measurements`, `training_measurements`, `test_labels`, `training_labels`, `test_subjects`, `training_subjects`, `features`, `activities` are read directly from the source dataset, and defined in the source dataset codebook.

`merged_measurements` is the data for both the test and training sets, merged together.

`merged_labels` are the numeric activity labels for the test and traing sets, merged together.

`merged_subjects` are the subject identifiers for the test and traing sets, merged together.

`desired_measurements` are all measurements on the mean and standard deviation, taken from the merged measurement dataset.

`descriptive_labels` replaces the numeric labels with a more descriptive on taken from the activities description file

`merged_data` is a single tidy dataset.  Each row contains the desired measurements for a given subject activity tuple, along with the subject identifier and descriptive subject name.

`averages` contains an average of all desired measurements for each subject activity tuple.
