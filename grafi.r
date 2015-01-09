g1 <- apply(AudiByMarkets,1,function(y) y[1])
g1 <- g1[!is.na(g1)]
pdf("slike/Audi_trgi.pdf")
barplot(as.matrix(AudiByMarkets[-15,])/1000, beside = TRUE,
        las=2, names.arg=1996:2006,
        col=rainbow(14), cex.names=0.6, ylim = c(0, 400))
legend("topleft", legend = row.names(AudiByMarkets)[1:14], cex=0.6,
       fill=rainbow(14))
dev.off()

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

pdf("slike/Audi_modeli.pdf")
vrstice <- grep("Total|Threreof", rownames(AudiProduction),
                ignore.case=TRUE, invert=TRUE)
izbor <- AudiProduction[vrstice,]
modeli <- c('A3','A4','A5','A6','A8','TT','Lamborghini')
vsote <- sapply(modeli,
                function(x) sum(izbor[grep(x, rownames(izbor)),11], na.rm = TRUE))
pie(vsote)
dev.off()
