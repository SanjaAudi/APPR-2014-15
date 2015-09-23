# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                          "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                          encoding = "Windows-1252")
pdf("slike/zemljevidiprodaja.pdf")
row.names(AudiByMarkets)[3:4] <- c("United Kingdom", "United States")

evropa <- svet[svet$continent == "Europe",]
rest <- c("United States", "China", "Japan")
imenaevropa <- match(row.names(AudiByMarkets), svet$name)
imenasvet <- match(rest, svet$name)
koordinate <- coordinates(svet)
rownames(koordinate) <- svet$name
imena <- as.character(svet$name)
names(imena) <- svet$name

imena["United Kingdom"] <- "United\nKingdom"
imena["United States"] <- "United\nStates"
imena["Netherlands"] <- "Netherl."
imena["Switzerland"] <- "Switzer."
koordinate["Sweden",1] <- koordinate["Sweden",1] - 1
koordinate["United Kingdom",1] <- koordinate["United Kingdom",1] + 1
koordinate["United Kingdom",2] <- koordinate["United Kingdom",2] - 1
koordinate["Austria",1] <- koordinate["Austria",1] + 0.5


#LETO 2001
# Izračunamo povprečno velikost.
min.2001 <- min(AudiByMarkets$X2001[1:13], na.rm=TRUE)
max.2001 <- max(AudiByMarkets$X2001[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")

n = 100
barve = cm.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2001-min.2001)/(max.2001-min.2001)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
text(koordinate[imenasvet,], labels = rest, cex = 0.5)
title(main="Prodaja v svetu leta 2001", font.main=4)

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2001, max.2001, (max.2001-min.2001)/(k-1))),
       fill = barve[koraki*n/k])




evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
text(koordinate[imenaevropa,], labels = imena[imenaevropa], cex = 0.5)
title(main="Prodaja v Evropi leta 2001", font.main=4)

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2001, max.2001, (max.2001-min.2001)/(k-1))),
       fill = barve[koraki*n/k])


#LETO 2002
# Izračunamo povprečno velikost.
min.2002 <- min(AudiByMarkets$X2002[1:13], na.rm=TRUE)
max.2002 <- max(AudiByMarkets$X2002[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")

n = 100
barve = rainbow(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2002-min.2002)/(max.2002-min.2002)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
text(koordinate[imenasvet,], labels = rest, cex = 0.5)
title(main="Prodaja v svetu leta 2002", font.main=4)
k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2001, max.2001, (max.2001-min.2001)/(k-1))),
       fill = barve[koraki*n/k])


evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
mm <- imenaevropa[!is.na(AudiByMarkets$X2002)]
text(koordinate[mm,], labels = imena[mm], cex = 0.5)
title(main="Prodaja v Evropi leta 2002", font.main=4)

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2002, max.2002, (max.2002-min.2002)/(k-1))),
       fill = barve[koraki*n/k])

#LETO 2003
# Izračunamo povprečno velikost.
min.2003 <- min(AudiByMarkets$X2003[1:13], na.rm=TRUE)
max.2003 <- max(AudiByMarkets$X2003[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")


n = 100
barve = terrain.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2003-min.2003)/(max.2003-min.2003)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
text(koordinate[imenasvet,], labels = rest, cex = 0.5)
title(main="Prodaja v svetu leta 2003", font.main=4)
k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2001, max.2001, (max.2001-min.2001)/(k-1))),
       fill = barve[koraki*n/k])


evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
mm <- imenaevropa[!is.na(AudiByMarkets$X2003)]
text(koordinate[mm,], labels = imena[mm], cex = 0.5)
title(main="Prodaja v Evropi leta 2003", font.main=4)

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2003, max.2003, (max.2003-min.2003)/(k-1))),
       fill = barve[koraki*n/k])


#LETO 2004
# Izračunamo povprečno velikost.
min.2004 <- min(AudiByMarkets$X2004[1:13], na.rm=TRUE)
max.2004 <- max(AudiByMarkets$X2004[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")


n = 100
barve = cm.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2004-min.2004)/(max.2004-min.2004)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
text(koordinate[imenasvet,], labels = rest, cex = 0.5)
title(main="Prodaja v svetu leta 2004", font.main=4)
k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2001, max.2001, (max.2001-min.2001)/(k-1))),
       fill = barve[koraki*n/k])



evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
text(koordinate[imenaevropa,], labels = imena[imenaevropa], cex = 0.5)
title(main="Prodaja v Evropi leta 2004", font.main=4)

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2004, max.2004, (max.2004-min.2004)/(k-1))),
       fill = barve[koraki*n/k])


#LETO 2005
# Izračunamo povprečno velikost.
min.2005 <- min(AudiByMarkets$X2005[1:13], na.rm=TRUE)
max.2005 <- max(AudiByMarkets$X2005[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")


n = 100
barve = rainbow(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2005-min.2005)/(max.2005-min.2005)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
text(koordinate[imenasvet,], labels = rest, cex = 0.5)
title(main="Prodaja v svetu leta 2005", font.main=4)
k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2001, max.2001, (max.2001-min.2001)/(k-1))),
       fill = barve[koraki*n/k])



evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
text(koordinate[imenaevropa,], labels = imena[imenaevropa], cex = 0.5)
title(main="Prodaja v Evropi leta 2005", font.main=4)

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2005, max.2005, (max.2005-min.2005)/(k-1))),
       fill = barve[koraki*n/k])


#LETO 2006
# Izračunamo povprečno velikost.
min.2006 <- min(AudiByMarkets$X2006[1:13], na.rm=TRUE)
max.2006 <- max(AudiByMarkets$X2006[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")


n = 100
barve = terrain.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2006-min.2006)/(max.2006-min.2006)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
text(koordinate[imenasvet,], labels = rest, cex = 0.5)
title(main="Prodaja v svetu leta 2006", font.main=4)
k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2001, max.2001, (max.2001-min.2001)/(k-1))),
       fill = barve[koraki*n/k])



evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
text(koordinate[imenaevropa,], labels = imena[imenaevropa], cex = 0.5)
title(main="Prodaja v Evropi leta 2006", font.main=4)

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2006, max.2006, (max.2006-min.2006)/(k-1))),
       fill = barve[koraki*n/k])
dev.off()
