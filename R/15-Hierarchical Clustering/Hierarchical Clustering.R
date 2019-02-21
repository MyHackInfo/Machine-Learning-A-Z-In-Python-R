# Hierarchical Clustering

# We can Use <- or = to for variable
# Importing the mall dataset
dataset = read.csv('mall.csv')
X = dataset[4:5]

# Using the Dendrogram to find the optimal n of clusters
dendrogram = hclust(dist(X,method='euclidean'),method='ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab='Customers',
     ylab='Euclidean Distances')

# Fitting Hierarchical CLustering to the mall dataset
hc = hclust(dist(X,method='euclidean'),method='ward.D')
y_hc = cutree(hc,5)

# Visualising the Clusters
library(cluster)
clusplot(X,
         y_hc,
         lines =0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Cluster of Clients'),
         xlab = "Annual Income",
         ylab = "Spending Score")


