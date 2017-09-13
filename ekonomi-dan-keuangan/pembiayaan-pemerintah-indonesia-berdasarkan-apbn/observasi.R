# Ambil data
data <- read.csv(
  "http://www.data.id/storage/f/2014-03-14T03%3A34%3A28.422Z/processed-apbn-pembiayaan-indonesia-1990-2013.csv",
  header=TRUE,
  sep=",")

# Ringkasan Data
summary(data)

# Cek Tipe Data
str(data)

# Tahun Data
unique(data$tahun)

# Sumber Pembiayaan dan Jenis Pembiayaan
unique(data$sumber_pembiayaan)
unique(data$jenis_pembiayaan)
unique(data$keterangan_jenis_pembiayaan)
unique(data[, 2:4])
unique(data[, 2:3])
unique(data[, 3:4])

# Buat Daftar per Tahun
year <- data.frame(list=unique(data$tahun),
                   text=paste0('Tahun ', unique(data$tahun)))

# Data Pembiayaan per Tahun
aggregate(data[,c('nilai')], by=list(data$tahun), "sum")
