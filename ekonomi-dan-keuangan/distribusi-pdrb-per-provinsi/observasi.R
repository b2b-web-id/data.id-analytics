# Ambil data
data <- read.csv(
  "http://data.go.id/dataset/a980e023-b85f-4b47-b119-b9adb66cbd7e/resource/96f1ae28-23ac-457a-94c9-28e19f1ed6d6/download/processeddistribusipdrbperprovinsi20042012.csv",
  header=TRUE,
  sep=",")

# Ringkasan Data
summary(data)

# Cek Tipe Data
str(data)

# Tahun yang Termasuk dalam Data
unique(data$tahun)

# Rata-rata Kontribusi per Tahun
aggregate(data[, c('kontribusi')], by=list(data$tahun), "mean")

# Jumlah Kontribusi per Tahun
aggregate(data[, c('kontribusi')], by=list(data$tahun), "sum")

# Buat Daftar per Tahun
year <- data.frame(list=unique(data$tahun),
                   text=paste0('Tahun ', unique(data$tahun)))

# Buat Daftar Latitude & Longitude per Provinsi
longlat <- aggregate(data[, c('kode_provinsi','latitude','longitude')],
                     by=list(data$nama_provinsi),
                     FUN="mean")
