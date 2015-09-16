source("podatki2faza/konzola.r")
source("grafi.r")

g1 <- apply(AudiByMarkets,1,function(y) y[1])
g1 <- ag1[!is.na(g1)]

pdf("slike/Auditrgianaliza.pdf")
m <- as.matrix(AudiByMarkets[-15,])/1000
barplot(as.matrix(AudiByMarkets[-15,])/1000, beside = TRUE,
        las=2, names.arg=1996:2006,
        col=rainbow(14), cex.names=0.6, ylim = c(0, 400))
legend("topleft", legend = row.names(AudiByMarkets)[1:14], cex=0.6,
       fill=rainbow(14))
dev.off()

g_range <- range(0)
izbrani <- c(1, 4, 5, 6, 12, 13)
barve <- c("blue", "red", "pink", "green", "brown", "black")
for (i in izbrani ) {
  row <- as.numeric(as.vector(AudiByMarkets[i,]))
  row[is.na(row)] = 0
  row <- row / 1000
  g_range <- range(g_range, row)
}

row <- as.numeric(as.vector(AudiByMarkets[izbrani[1],])) 
row[is.na(row)] = 0
row <- row / 1000
plot(row, type="o", col=barve[1], ylim=g_range, 
     axes=FALSE, ann=FALSE)
for (k in 2:length(izbrani) ) {
  i <- izbrani[k]
  row <- as.numeric(as.vector(AudiByMarkets[i,])) 
  row[is.na(row)] = 0
  row <- row / 1000
  # Graph trucks with red dashed line and square points
  lines(row, type="o", col=barve[k])
}

# Make x axis using Mon-Fri labels
axis(1, at=1:11, lab=names(AudiByMarkets))

# Make y axis with horizontal labels that display ticks at 
# every 4 marks. 4*0:g_range[2] is equivalent to c(0,4,8,12).
axis(2, las=1, at=ceiling(seq(g_range[1], g_range[2],length=8)))

# Create box around plot
box()

# Create a title with a red, bold/italic font
title(main="Prodaja avtomobilov", col.main="black", font.main=4)

# Label the x and y axes with dark green text
title(xlab="Leta", col.lab=rgb(0,0.5,0))
title(ylab="Število prodanih Audijev v tisočih", col.lab=rgb(0,0.5,0))

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
legend(1, 221, row.names(AudiByMarkets)[izbrani], cex=0.8, 
       col=barve, lty=1:1);




#AUDI TOVARNE


g_range <- range(0)
izbrani <- c(4, 11, 18, 22, 25, 31)
barve <- c("blue", "red", 116, "brown", "black", "purple",)
for (i in izbrani ) {
  row <- as.numeric(as.vector(AudiProduction[i,]))
  row[is.na(row)] = 0
  row <- row / 1000
  g_range <- range(g_range, row)
}

row <- as.numeric(as.vector(AudiProduction[izbrani[1],])) 
row[is.na(row)] = 0
row <- row / 1000
plot(row, type="o", col=barve[1], ylim=g_range, 
     axes=FALSE, ann=FALSE)
for (k in 2:length(izbrani) ) {
  i <- izbrani[k]
  row <- as.numeric(as.vector(AudiProduction[i,])) 
  row[is.na(row)] = 0
  row <- row / 1000
  # Graph trucks with red dashed line and square points
  lines(row, type="o", col=barve[k])
}

# Make x axis using Mon-Fri labels
axis(1, at=1:11, lab=names(AudiProduction))

# Make y axis with horizontal labels that display ticks at 
# every 4 marks. 4*0:g_range[2] is equivalent to c(0,4,8,12).
axis(2, las=1, at=ceiling(seq(g_range[1], g_range[2],length=8)))

# Create box around plot
box()

# Create a title with a red, bold/italic font
title(main="Audi po modelih", col.main="black", font.main=4)

# Label the x and y axes with dark green text
title(xlab="Leta")
title(ylab="Število proizvedenih avtomobilov v tisočih")

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
legend(8.5, 2130 , row.names(AudiProduction)[izbrani], cex=0.6, 
       col=barve, lty=1:1);





xdata = c(1996:2006)
row <- as.numeric(as.vector(AudiProduction[4,])) 
row[is.na(row)] = 0
row <- row / 1000
ydata =  row


p1 = 5
p2 = 0.1
p3 = 0.3
p4 = -50
# do the fit
fit = nls(ydata ~ p2*xdata*xdata + p3*xdata + p4, start=list(p2=p2,p3=p3,p4=p4), algorithm="plinear")


