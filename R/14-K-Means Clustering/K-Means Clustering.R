# K-Means Clustering

# Importing the mall dataset
dataset <- read.csv('mall.csv')
X <-dataset[4:5]

# Using the Elbow method to find the optimal n of clusters
set.seed(6)
wcss <-vector()
for (i in 1:10) wcss[i] <- sum(kmeans(X,i)$withinss)
plot(1:10 , wcss , type="b", main = paste('Clusters of clients'), xlab='Number of Clusters',ylab = 'WCSS')

# Applying k-Meand to the mall dataset
set.seed(29)
kmeans <-kmeans(X,5, iter.max=300, nstart=10)

# Visualising the Clusters
library(cluster)
clusplot(X,
         kmeans$cluster,
         lines =0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Cluster of Clients'),
         xlab = "Annual Income",
         ylab = "Spending Score")


