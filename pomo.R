# POMO history reader
require('quantmod')

url <- "/Users/mrb/Dropbox/Great Gray/POMO/pomo.csv"

# historical through 2012-05-03
pomo = read.csv(url,header=TRUE, stringsAsFactors=F)

# cot = subset(cot,cot$CFTC_Contract_Market_Code == contractCode)
pomo[,5:7] <- data.frame(sapply(pomo[,5:7],as.numeric),stringsAsFactors=F)
pomo.xts <- xts(pomo[,7], order.by=as.Date(pomo$Settlement.Date,format='%m/%d/%Y'))
colnames(pomo.xts) <- c("Money.Flow")
