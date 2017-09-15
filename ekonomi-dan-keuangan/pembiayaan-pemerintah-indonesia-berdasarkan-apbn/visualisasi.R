# Ambil data
data <- read.csv(
  "http://www.data.id/storage/f/2014-03-14T03%3A34%3A28.422Z/processed-apbn-pembiayaan-indonesia-1990-2013.csv",
  header=TRUE,
  sep=",")

# Data Pembiayaan per Tahun
data_plot <- aggregate(data[,c('nilai')], by=list(data$tahun), "sum")
summary(data_plot)

# Plot
barplot(data_plot$x, ylim=data_plot$Group.1)
