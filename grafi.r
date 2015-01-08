g1 <- apply(AudiByMarkets,1,function(y) y[1])
g1 <- g1[!is.na(g1)]
pdf("slike/Audi_trgi.pdf")
barplot(apply(AudiByMarkets, 1, c)/1000, beside = TRUE,
        las=2, legend=1996:2006, args.legend=c(x="top"),
        col=rainbow(11), cex.names=0.6)
dev.off()
# barplot(g1/1000,main='Audi prodaja po trgih 1996 (enako za 1997)', ylab='Število prodanih avtomobilov (×1000)', col=c("pink"),las=2,cex.names=0.6)
# dev.off()
# 
# g2 <- apply(AudiByMarkets,1,function(x) x[3])
# pdf("slike/Audi_trgi_1998.pdf")
# barplot(g2/1000,main='Audi prodaja po trgih 1998', ylab='Število prodanih avtomobilov (×1000)', col=c("purple"),las=2,cex.names=0.6)
# dev.off()
# 
# g3 <- apply(AudiByMarkets,1,function(x) x[4])
# pdf("slike/Audi_trgi_1999.pdf")
# barplot(g3/1000,main='Audi prodaja po trgih 1999', ylab='Število prodanih avtomobilov (×1000)', col=c("367"),las=2,cex.names=0.6)
# dev.off()
# 
# g4 <- apply(AudiByMarkets,1,function(x) x[5])
# pdf("slike/Audi_trgi_2000.pdf")
# barplot(g4/1000,main='Audi prodaja po trgih 2000', ylab='Število prodanih avtomobilov (×1000)', col=c("green"),las=2,cex.names=0.6)
# dev.off()
# 
# g5 <- apply(AudiByMarkets,1,function(x) x[6])
# pdf("slike/Audi_trgi_2001.pdf")
# barplot(g5/1000,main='Audi prodaja po trgih 2001', ylab='Število prodanih avtomobilov (×1000)', col=c("641"),las=2,cex.names=0.6)
# dev.off()
# 
# g6 <- apply(AudiByMarkets,1,function(x) x[7])
# pdf("slike/Audi_trgi_2002.pdf")
# barplot(g6/1000,main='Audi prodaja po trgih 2002', ylab='Število prodanih avtomobilov (×1000)', col=c("508"),las=2,cex.names=0.6)
# dev.off()
# 
# g7 <- apply(AudiByMarkets,1,function(x) x[8])
# pdf("slike/Audi_trgi_2003.pdf")
# barplot(g7/1000,main='Audi prodaja po trgih 2003', ylab='Število prodanih avtomobilov (×1000)', col=c("432"),las=2,cex.names=0.6)
# dev.off()
# 
# g8 <- apply(AudiByMarkets,1,function(x) x[9])
# pdf("slike/Audi_trgi_2004.pdf")
# barplot(g8/1000,main='Audi prodaja po trgih 2004', ylab='Število prodanih avtomobilov (×1000)', col=c("450"),las=2,cex.names=0.6)
# dev.off()
# 
# g9 <- apply(AudiByMarkets,1,function(x) x[10])
# pdf("slike/Audi_trgi_2005.pdf")
# barplot(g9/1000,main='Audi prodaja po trgih 2005', ylab='Število prodanih avtomobilov (×1000)', col=c("463"),las=2,cex.names=0.6)
# dev.off()
# 
# g10 <- apply(AudiByMarkets,1,function(x) x[11])
# pdf("slike/Audi_trgi_2006.pdf")
# barplot(g10/1000,main='Audi prodaja po trgih 2006', ylab='Število prodanih avtomobilov (×1000)', col=c("118"),las=2,cex.names=0.6)
# dev.off()

f1 <- apply(AudiEmployees,1,function(x) x[1])
pdf("slike/Audi_zaposleni_2000.pdf")
vrstice <- rownames(AudiEmployees)
vrstice[2] <- "Audi AG\nincl. Others"
vrstice[7] <- "Cosworth\nTechnology"
barplot(f1/1000,main='Zaposleni v Audi tovarnah 2000',
        ylab='Število zaposlenih (×1000)', col=c("pink"),
        names.arg = vrstice, las=2,cex.names=0.6)
dev.off()

f2 <- apply(AudiEmployees,1,function(x) x[3])
pdf("slike/Audi_zaposleni_2002.pdf")
barplot(f2/1000,main='Zaposleni v Audi tovarnah 2002',
        ylab='Število zaposlenih (×1000)',
        col=c("blue"),las=2,cex.names=0.6)
dev.off()

f3 <- apply(AudiEmployees,1,function(x) x[4])
pdf("slike/Audi_zaposleni_2003.pdf")
barplot(f3/1000,main='Zaposleni v Audi tovarnah 2003',
        ylab='Število zaposlenih (×1000)',
        col=c("yellow"),las=2,cex.names=0.6)
dev.off()

f4 <- apply(AudiEmployees,1,function(x) x[5])
pdf("slike/Audi_zaposleni_2004.pdf")
barplot(f4/1000,main='Zaposleni v Audi tovarnah 2004',
        ylab='Število zaposlenih (×1000)',
        col=c("green"),las=2,cex.names=0.6)
dev.off()

# pdf('slike/Audi_modeli_1996.pdf')
# pie(AudiProduction, labels = c('A3','A4','A5','A6', 'A8', 'TT', 'Lamborghini'), col=c('magenta4','lawngreen','red3','deepskyblue2'), main ='Zaposleni v Audi tovarnah')
# dev.off()
pdf("slike/Audi_modeli.pdf")
vrstice <- grep("Total|Threreof", rownames(AudiProduction),
                ignore.case=TRUE, invert=TRUE)
izbor <- AudiProduction[vrstice,]
modeli <- c('A3','A4','A5','A6','A8','TT','Lamborghini')
vsote <- sapply(modeli,
                function(x) sum(izbor[grep(x, rownames(izbor)),11], na.rm = TRUE))
pie(vsote)
