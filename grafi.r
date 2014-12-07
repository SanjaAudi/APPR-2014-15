g1 <- apply(AudiByMarkets,1,function(x) x[1])
g1 <- g1[!is.na(g1)]
pdf("slike/Audi_trgi_1996.pdf")
barplot(g1,main='Audi prodaja po trgih 1996', xlab='Država', ylab='Število prodanih avtomobilov (×1000)' col=c("pink"),las=2)
dev.off()
