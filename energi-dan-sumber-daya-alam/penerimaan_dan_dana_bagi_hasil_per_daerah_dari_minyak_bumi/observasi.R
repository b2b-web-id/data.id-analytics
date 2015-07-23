# Ambil data
bagi_hasil <- read.csv(
  "http://data.go.id/dataset/64bda63f-c2ee-4128-8b63-7047c950f6b3/resource/476513d0-f4f8-4a3a-a020-773dcf843c1f/download/processeddanabagihasilminyakbumiperkkkskabupaten20102011.csv",
  header=TRUE,
  sep=",")

# Ringkasan Data
summary(bagi_hasil)

# Data 2010
bagi_hasil_2010 <- subset(bagi_hasil,tahun==2010)
# Ringkasan Data Tahun 2010
summary(bagi_hasil_2010)

# Data 2011
bagi_hasil_2011 <- subset(bagi_hasil,tahun==2011)
# Ringkasan Data Tahun 2011
summary(bagi_hasil_2011)

# Total Penerimaan SDA
sum(na.omit(bagi_hasil$penerimaan_sda))
# Total Penerimaan 2010 SDA
sum(na.omit(bagi_hasil_2010$penerimaan_sda))
# Total Penerimaan 2011 SDA
sum(na.omit(bagi_hasil_2011$penerimaan_sda))

# Penerimaan SDA terkecil 2010
subset(bagi_hasil_2010,
       penerimaan_sda==min(
         na.omit(bagi_hasil_2010$penerimaan_sda)
       )
)
# Penerimaan SDA terkecil 2011
subset(bagi_hasil_2011,
       penerimaan_sda==min(
         na.omit(bagi_hasil_2011$penerimaan_sda)
       )
)

# Penerimaan SDA terbesar 2010
subset(bagi_hasil_2010,
       penerimaan_sda==max(
         na.omit(bagi_hasil_2010$penerimaan_sda)
       )
)
# Penerimaan SDA terbesar 2011
subset(bagi_hasil_2011,
       penerimaan_sda==max(
         na.omit(bagi_hasil_2011$penerimaan_sda)
       )
)

