

x_train<- read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
sub_train<-read.table("train/subject_train.txt")

x_test<- read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
sub_test<-read.table("test/subject_test.txt")

#print(x_train)

#Merging training and test
x_total <- rbind(x_train, x_test)
y_total <- rbind(y_train, y_test)
sub_total <- rbind(sub_train, sub_test)


activity<- read.table("activity_labels.txt")
features<-read.table("features.txt")
#print(features)

#Extracts only the measurements on the mean and standard deviation
selected <- features[grep("mean|std",features[,2]),]
x_total <- x_total[,selected[,1]]

#print(features_selected)



#Appropriate naming
colnames(activity) <- c("activity_ID", "activity_Type")
colnames(y_total)<-c("activity_ID")
colnames(sub_total)<-c("Subject_ID")


#Tidy Set



tidy_set<-cbind(sub_total,y_total,x_total)
tidy_set$activity_ID<-activity[tidy_set$activity_ID, 2]
write.table(tidy_set, "Tidy_Set.txt", row.name=FALSE)












