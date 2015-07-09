# Ambil data
kontrak_karya <- read.csv(
  "http://data.ukp.go.id/storage/f/2014-04-20T14%3A52%3A57.039Z/processed-daftar-kontrak-karya-2012.csv",
  header=TRUE,
  sep=",")

##################################
# Observasi Data
##################################

# Ringkasan Data
summary(kontrak_karya)

# Total wilayah
sum(kontrak_karya$luas_wilayah)

# Pemegang kontrak karya dengan luas wilayah terkecil
subset(kontrak_karya,luas_wilayah==min(kontrak_karya$luas_wilayah))

# Pemegang kontrak karya dengan luas wilayah terbesar
subset(kontrak_karya,luas_wilayah==max(kontrak_karya$luas_wilayah))

##################################
# Visualisasi Data
##################################

# Pustaka
library(leaflet)
library(ggmap)

# Ambil Data Geospasial atas Nama Perusahaan
geocodes <- geocode(as.character(kontrak_karya$nama_perusahaan))

# Gabungkan Data
data <- data.frame(kontrak_karya,geocodes)

# Bersihkan Data
clean <- na.omit(data)
clean$latitude <- jitter(clean$latitude)
clean$longitude <- jitter(clean$longitude)

# Buat Grafik (Peta)
m <- leaflet(data = clean) %>%
  addTiles() %>%
  addMarkers(~lon, ~lat, popup=~as.character(nama_perusahaan))
m
