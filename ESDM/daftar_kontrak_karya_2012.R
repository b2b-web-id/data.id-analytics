# Ambil data
kontrak_karya <- read.csv(
  "http://data.ukp.go.id/storage/f/2014-04-20T14%3A52%3A57.039Z/processed-daftar-kontrak-karya-2012.csv",
  header=TRUE,
  sep=",")

# Ringkasan Data
summary(kontrak_karya)

# Total wilayah
sum(kontrak_karya$luas_wilayah)

# Pemegang kontrak karya dengan luas wilayah terkecil
subset(kontrak_karya,luas_wilayah==min(kontrak_karya$luas_wilayah))

# Pemegang kontrak karya dengan luas wilayah terbesar
subset(kontrak_karya,luas_wilayah==max(kontrak_karya$luas_wilayah))
