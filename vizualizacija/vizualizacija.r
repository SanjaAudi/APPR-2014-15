# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                          "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                          encoding = "Windows-1252")

row.names(AudiByMarkets)[3:4] <- c("United Kingdom", "United States")

evropa <- svet[svet$continent == "Europe",]
m <- match(row.names(AudiByMarkets), evropa$name)
koordinate <- coordinates(evropa)
rownames(koordinate) <- evropa$name
imena <- as.character(evropa$name)
names(imena) <- evropa$name

imena["United Kingdom"] <- "United\nKingdom"

#LETO 1996,1997
# Izračunamo povprečno velikost.
min.1996 <- min(AudiByMarkets$X1996[1:13], na.rm=TRUE)
max.1996 <- max(AudiByMarkets$X1996[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid_prodaja_1996_1997.pdf")

n = 100
barve = heat.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X1996-min.1996)/(max.1996-min.1996)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
title("Prodaja v svetu leta 1996/1997")
dev.off()

pdf("slike/zemljevid_evropa_1996_1997.pdf")
evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
title("Prodaja v Evropi leta 1996/1997")

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.1996, max.1996, (max.1996-min.1996)/(k-1))),
       fill = barve[koraki*n/k])
dev.off()


#LETO 1998
# Izračunamo povprečno velikost.
min.1998 <- min(AudiByMarkets$X1998[1:13], na.rm=TRUE)
max.1998 <- max(AudiByMarkets$X1998[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid_prodaja_1998.pdf")

n = 100
barve = heat.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X1998-min.1998)/(max.1998-min.1998)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
title("Prodaja v svetu leta 1998")
dev.off()

pdf("slike/zemljevid_evropa_1996_1997.pdf")
evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
title("Prodaja v Evropi leta 1998")

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.1998, max.1998, (max.1998-min.1998)/(k-1))),
       fill = barve[koraki*n/k])
dev.off()

#LETO 1999,2000
# Izračunamo povprečno velikost.
min.1999 <- min(AudiByMarkets$X1999[1:13], na.rm=TRUE)
max.1999 <- max(AudiByMarkets$X1999[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid_prodaja_1999_2000.pdf")

n = 100
barve = heat.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X1999-min.1999)/(max.1999-min.1999)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
title("Prodaja v svetu leta 1999/2000")
dev.off()

pdf("slike/zemljevid_evropa_1999_2000.pdf")
evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
title("Prodaja v Evropi leta 1999/2000")

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.1999, max.1999, (max.1999-min.1999)/(k-1))),
       fill = barve[koraki*n/k])
dev.off()

#LETO 2001
# Izračunamo povprečno velikost.
min.2001 <- min(AudiByMarkets$X2001[1:13], na.rm=TRUE)
max.2001 <- max(AudiByMarkets$X2001[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid_prodaja_2001.pdf")

n = 100
barve = heat.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2001-min.2001)/(max.2001-min.2001)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
title("Prodaja v svetu leta 2001")
dev.off()

pdf("slike/zemljevid_evropa_2001.pdf")
evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
title("Prodaja v Evropi leta 2001")

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2001, max.2001, (max.2001-min.2001)/(k-1))),
       fill = barve[koraki*n/k])
dev.off()

#LETO 2002
# Izračunamo povprečno velikost.
min.2002 <- min(AudiByMarkets$X2002[1:13], na.rm=TRUE)
max.2002 <- max(AudiByMarkets$X2002[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid_prodaja_2002.pdf")

n = 100
barve = heat.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2002-min.2002)/(max.2002-min.2002)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
title("Prodaja v svetu leta 2002")
dev.off()

pdf("slike/zemljevid_evropa_2002.pdf")
evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
title("Prodaja v Evropi leta 2002")

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2002, max.2002, (max.2002-min.2002)/(k-1))),
       fill = barve[koraki*n/k])
dev.off()

#LETO 2003
# Izračunamo povprečno velikost.
min.2003 <- min(AudiByMarkets$X2003[1:13], na.rm=TRUE)
max.2003 <- max(AudiByMarkets$X2003[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid_prodaja_2003.pdf")

n = 100
barve = heat.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2003-min.2003)/(max.2003-min.2003)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
title("Prodaja v svetu leta 2003")
dev.off()

pdf("slike/zemljevid_evropa_2003.pdf")
evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
title("Prodaja v Evropi leta 2003")

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2003, max.2003, (max.2003-min.2003)/(k-1))),
       fill = barve[koraki*n/k])
dev.off()

#LETO 2004
# Izračunamo povprečno velikost.
min.2004 <- min(AudiByMarkets$X2004[1:13], na.rm=TRUE)
max.2004 <- max(AudiByMarkets$X2004[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid_prodaja_2004.pdf")

n = 100
barve = heat.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2004-min.2004)/(max.2004-min.2004)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
title("Prodaja v svetu leta 2004")
dev.off()

pdf("slike/zemljevid_evropa_2004.pdf")
evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
title("Prodaja v Evropi leta 2004")

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2004, max.2004, (max.2004-min.2004)/(k-1))),
       fill = barve[koraki*n/k])
dev.off()

#LETO 2005
# Izračunamo povprečno velikost.
min.2005 <- min(AudiByMarkets$X2005[1:13], na.rm=TRUE)
max.2005 <- max(AudiByMarkets$X2005[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid_prodaja_2005.pdf")

n = 100
barve = heat.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2005-min.2005)/(max.2005-min.2005)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
title("Prodaja v svetu leta 2005")
dev.off()

pdf("slike/zemljevid_evropa_2005.pdf")
evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
title("Prodaja v Evropi leta 2005")

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2005, max.2005, (max.2005-min.2005)/(k-1))),
       fill = barve[koraki*n/k])
dev.off()

#LETO 2006
# Izračunamo povprečno velikost.
min.2006 <- min(AudiByMarkets$X2006[1:13], na.rm=TRUE)
max.2006 <- max(AudiByMarkets$X2006[1:13], na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid_prodaja_2006.pdf")

n = 100
barve = heat.colors(n)[n:1]
barve.svet <- barve[1+(n-1)*(AudiByMarkets$X2006-min.2006)/(max.2006-min.2006)]
plot(svet, col = barve.svet[match(svet$name, row.names(AudiByMarkets))])
title("Prodaja v svetu leta 2006")
dev.off()

pdf("slike/zemljevid_evropa_2006.pdf")
evropa <- svet[svet$continent == "Europe",]
plot(evropa, col = barve.svet[match(evropa$name, row.names(AudiByMarkets))],
     xlim = c(-20, 20), ylim = c(33, 73))
title("Prodaja v Evropi leta 2006")

k <- 5
koraki <- 1:k
legend("left", legend = round(seq(min.2006, max.2006, (max.2006-min.2006)/(k-1))),
       fill = barve[koraki*n/k])
dev.off()
