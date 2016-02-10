# Pustaka
library(leaflet)
library(dplyr)

# Ambil Data
data <- read.csv(
  "http://data.go.id/dataset/a980e023-b85f-4b47-b119-b9adb66cbd7e/resource/96f1ae28-23ac-457a-94c9-28e19f1ed6d6/download/processeddistribusipdrbperprovinsi20042012.csv",
  header=TRUE,
  sep=",")

# Data 2012
data2012 <- subset(data, tahun==2012)[, c('nama_provinsi', 'kontribusi',
                                  'latitude', 'longitude')]

# Cek Outlier
outliers <- boxplot(data2012, plot=FALSE)$out
data2012$outliers <- data2012$kontribusi %in% outliers
data2012$color <- ifelse(data2012$outliers == TRUE, "red", "green")

# Popup
data2012$popup <- paste0(
  "<strong>", data2012$nama_provinsi,
  "<br>Kontribusi : ", format(data2012$kontribusi, scientific=FALSE, format="d",
                              big.mark=".", decimal.mark=","), " %")

# Buat Peta
leaflet(data=data2012) %>%
  addTiles() %>%
  addCircleMarkers(
    ~longitude, ~latitude,
    color=~color,
    stroke=FALSE,
    fillOpacity=0.5,
    popup=~popup)
