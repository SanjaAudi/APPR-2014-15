g1 <- apply(AudiByMarkets,1,function(y) y[1])
g1 <- g1[!is.na(g1)]
pdf("slike/Audi_trgi.pdf")
barplot(as.matrix(AudiByMarkets[-15,])/1000, beside = TRUE,
        las=2, names.arg=1996:2006,
        col=rainbow(14), cex.names=0.6, ylim = c(0, 400))
legend("topleft", legend = row.names(AudiByMarkets)[1:14], cex=0.6,
       fill=rainbow(14))
dev.off()

# GRAFI ZAPOSLENIH V POSAMEZNIH LETIH
# f1 <- apply(AudiEmployees,1,function(x) x[1])
# pdf("slike/Audi_zaposleni_2000.pdf")
# vrstice <- rownames(AudiEmployees)
# vrstice[2] <- "Audi AG\nincl. Others"
# vrstice[7] <- "Cosworth\nTechnology"
# barplot(f1/1000,main='Zaposleni v Audi tovarnah 2000',
#         ylab='Število zaposlenih (×1000)', col=c("pink"),
#         names.arg = vrstice, las=2,cex.names=0.6)
# dev.off()
# 
# f2 <- apply(AudiEmployees,1,function(x) x[3])
# pdf("slike/Audi_zaposleni_2002.pdf")
# barplot(f2/1000,main='Zaposleni v Audi tovarnah 2002',
#         ylab='Število zaposlenih (×1000)',
#         col=c("blue"),las=2,cex.names=0.6)
# dev.off()
# 
# f3 <- apply(AudiEmployees,1,function(x) x[4])
# pdf("slike/Audi_zaposleni_2003.pdf")
# barplot(f3/1000,main='Zaposleni v Audi tovarnah 2003',
#         ylab='Število zaposlenih (×1000)',
#         col=c("yellow"),las=2,cex.names=0.6)
# dev.off()
# 
# f4 <- apply(AudiEmployees,1,function(x) x[5])
# pdf("slike/Audi_zaposleni_2004.pdf")
# barplot(f4/1000,main='Zaposleni v Audi tovarnah 2004',
#         ylab='Število zaposlenih (×1000)',
#         col=c("green"),las=2,cex.names=0.6)
# dev.off()


pdf("slike/Audi_modeli.pdf")
vrstice <- grep("Total|Threreof", rownames(AudiProduction),
                ignore.case=TRUE, invert=TRUE)
izbor <- AudiProduction[vrstice,]
modeli <- c('A3','A4','A5','A6','A8','TT','Lamborghini')
vsote <- sapply(modeli,
                function(x) sum(izbor[grep(x, rownames(izbor)),11], na.rm = TRUE))
pie(vsote)
dev.off()










f1 <- apply(AudiEmployees,1,function(x) x[1])
pdf("slike/Audi_zaposleni.pdf")

g_range <- range(0)
izbrani <- c(2:8)
barve <- c("blue", "red", 116, "brown", "black", "purple", "orange")
for (i in izbrani ) {
  row <- as.numeric(as.vector(AudiEmployees[i,]))
  row[is.na(row)] = 0
  row <- row / 1000
  g_range <- range(g_range, row)
}

row <- as.numeric(as.vector(AudiEmployees[izbrani[1],])) 
row[is.na(row)] = 0
row <- row / 1000
plot(row, type="o", col=barve[1], ylim=g_range, 
     axes=FALSE, ann=FALSE)
for (k in 2:length(izbrani) ) {
  i <- izbrani[k]
  row <- as.numeric(as.vector(AudiEmployees[i,])) 
  row[is.na(row)] = 0
  row <- row / 1000
  # Graph trucks with red dashed line and square points
  lines(row, type="o", col=barve[k])
}

# Make x axis using Mon-Fri labels
axis(1, at=1:6, lab=names(AudiEmployees))

# Make y axis with horizontal labels that display ticks at 
# every 4 marks. 4*0:g_range[2] is equivalent to c(0,4,8,12).
axis(2, las=1, at=ceiling(seq(g_range[1], g_range[2],length=8)))

# Create box around plot
box()

# Create a title with a red, bold/italic font
title(main="Audi tovarne", col.main="black", font.main=4)

# Label the x and y axes with dark green text
title(xlab="Leta")
title(ylab="Število zaposlenih")

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
legend(1, 29 , row.names(AudiEmployees)[izbrani], cex=0.5, 
       col=barve, lty=1:1);
dev.off()

