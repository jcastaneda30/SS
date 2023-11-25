

install.packages("MASS")
install.packages("car")
install.packages("fitdistrplus")
install.packages("moments")

library("MASS")
library("car")
library("fitdistrplus")
library("moments")

datosTiempoEntreLlegadas <- read.table("TiemposEntreLlegadasSec.txt")
datosTiempoEntreLlegadas$V1 <- as.numeric(datosTiempoEntreLlegadas$V1)
mean(datosTiempoEntreLlegadas$V1)
plotdist(datosTiempoEntreLlegadas$V1,histo=TRUE,demp=TRUE)
descdist(datosTiempoEntreLlegadas$V1 )
fit_gamma <- fitdist(datosTiempoEntreLlegadas$V1,"gamma")
fit_exp <- fitdist(datosTiempoEntreLlegadas$V1,"exp")

plot(fit_gamma)
plot(fit_exp)

summary(fit_gamma)
summary(fit_exp)

gofstat(list(fit_gamma,fit_exp))

#Se concluye que se ajusta a una distribucion exponencial ya que no se rechaza por Kolmorogov smirnov
#Se toma la exponencial ya que es la que minimiza los criterios de informacion
par(mfrow=c(1,1))
plot.legend <- c("gamma","exp")
denscomp(list(fit_gamma,fit_exp), legendtext = plot.legend)
cdfcomp (list(fit_gamma,fit_exp), legendtext = plot.legend)
qqcomp (list(fit_gamma,fit_exp), legendtext = plot.legend)
ppcomp (list(fit_gamma,fit_exp), legendtext = plot.legend)



datosTiempoPedido <- read.table("TiemposDePedidoSec.txt")
datosTiempoPedido$V1 <- as.numeric(datosTiempoPedido$V1)

mean(datosTiempoPedido$V1)

plotdist(datosTiempoPedido$V1,histo=TRUE,demp=TRUE)
descdist(datosTiempoPedido$V1 )

fit_normal <- fitdist(datosTiempoPedido$V1,"norm")
fit_unif <- fitdist(datosTiempoPedido$V1,"unif")
fit_gamma <- fitdist(datosTiempoPedido$V1,"gamma")

plot(fit_normal)
plot(fit_unif)
plot(fit_gamma)

summary(fit_normal)
summary(fit_unif)
summary(fit_gamma)

gofstat(list(fit_normal,fit_unif, fit_gamma))

#La distribucion uniforme es descartada por kolmogorov smirnov, y
#por criterio de informacion se selecciona la distribucion gamma
par(mfrow=c(1,1))
plot.legend <- c("normal","uniforme","gamma")
denscomp(list(fit_normal,fit_unif, fit_gamma), legendtext = plot.legend)
cdfcomp (list(fit_normal,fit_unif, fit_gamma), legendtext = plot.legend)
qqcomp (list(fit_normal,fit_unif, fit_gamma), legendtext = plot.legend)
ppcomp (list(fit_normal,fit_unif, fit_gamma), legendtext = plot.legend)







datosTiempoServicio <- read.table("TiemposDeServicioSec.txt")
datosTiempoServicio$V1 <- as.numeric(datosTiempoServicio$V1)
mean(datosTiempoServicio$V1)
plotdist(datosTiempoServicio$V1,histo=TRUE,demp=TRUE)
descdist(datosTiempoServicio$V1, boot = 1000 )

fit_normal <- fitdist(datosTiempoServicio$V1,"norm")
fit_unif <- fitdist(datosTiempoServicio$V1,"unif")
fit_gamma <- fitdist(datosTiempoServicio$V1,"gamma")
fit_beta <- fitdist(datosTiempoServicio$V1,"beta")

plot(fit_normal)
plot(fit_unif)
plot(fit_gamma)

summary(fit_normal)
summary(fit_unif)
summary(fit_gamma)

gofstat(list(fit_normal,fit_unif))

#La distribucion uniforme es descartada por kolmogorov smirnov, y
#por criterio de informacion se selecciona la distribucion gamma
par(mfrow=c(2,2))
plot.legend <- c("normal","uniforme","gamma")
denscomp(list(fit_normal,fit_unif, fit_gamma), legendtext = plot.legend)
cdfcomp (list(fit_normal,fit_unif, fit_gamma), legendtext = plot.legend)
qqcomp (list(fit_normal,fit_unif, fit_gamma), legendtext = plot.legend)
ppcomp (list(fit_normal,fit_unif, fit_gamma), legendtext = plot.legend)


