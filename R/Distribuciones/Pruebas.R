

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







datosTiempoServicio <- read.table("TiemposDeServicioSec.txt",sep = ",")
datosTiempoServicio$V1 <- as.numeric(datosTiempoServicio$V1)

datosEstante <- datosTiempoServicio[datosTiempoServicio$V2=="estante",]


mean(datosEstante$V1)
plotdist(datosEstante$V1,histo=TRUE,demp=TRUE)
descdist(datosEstante$V1, boot = 1000 )

fit_gamma <- fitdist(datosEstante$V1,"gamma")
fit_exp <- fitdist(datosEstante$V1,"exp")

plot(fit_gamma)
plot(fit_exp)

summary(fit_gamma)
summary(fit_exp)

gofstat(list(fit_gamma,fit_exp))

#La distribucion exp es descartada por kolmogorov smirnov, y
#por criterio de informacion se selecciona la distribucion gamma
par(mfrow=c(2,2))
plot.legend <- c("gamma","exp")
denscomp(list(fit_gamma,fit_exp), legendtext = plot.legend)
cdfcomp (list(fit_gamma,fit_exp), legendtext = plot.legend)
qqcomp (list(fit_gamma,fit_exp), legendtext = plot.legend)
ppcomp (list(fit_gamma,fit_exp), legendtext = plot.legend)


par(mfrow=c(1,1))

datosRestaurante <- datosTiempoServicio[datosTiempoServicio$V2=="restaurante",]

mean(datosRestaurante$V1)
plotdist(datosRestaurante$V1,histo=TRUE,demp=TRUE)
descdist(datosRestaurante$V1, boot = 1000 )

fit_gamma <- fitdist(datosRestaurante$V1,"gamma")
fit_ln <- fitdist(datosRestaurante$V1,"lnorm")

plot(fit_gamma)
plot(fit_ln)

summary(fit_gamma)
summary(fit_ln)

gofstat(list(fit_gamma,fit_ln))

#La distribucion lognormal es descartada por kolmogorov smirnov, y
#por criterio de informacion se selecciona la distribucion gamma
par(mfrow=c(2,2))
plot.legend <- c("gamma","log normal")
denscomp(list(fit_gamma,fit_ln), legendtext = plot.legend)
cdfcomp (list(fit_gamma,fit_ln), legendtext = plot.legend)
qqcomp (list(fit_gamma,fit_ln), legendtext = plot.legend)
ppcomp (list(fit_gamma,fit_ln), legendtext = plot.legend)


