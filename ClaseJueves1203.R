#---- Preparacion del entorno ----
rm(list = ls())
graphics.off()
cat("\014")
#---- Planteamiento ----
# Supongamos se quiere encontrar la región determinada por las rectas:
# x+2y<= 12 -> y<=(12-x)/2
# 2x+y >= 4 -> y>=4-2x
# x-2y<= 6 -> y>=(x-6)/2
# x-y >= 0 -> y<=x
#---- Definimos el intervalo de graficacion ----
a <- -1
b <- 10
paso <- 0.1
x <- seq(a,b,paso);
#---- Generacion de las rectas ----
#---- Primer Recta ----
y1 <- (12-x)/2
y2 <- 4-2*x
y3 <-(x-6)/2
y4 <- x
#---- Generamos la ventana de graficacion ----
maximo <- max(y1,y2,y3,y4)
minimo <- min(y1,y2,y3,y4)
plot(NA, 
     xlim = c(a-1, b+1), 
     ylim = c(-1, maximo+1),
     xlab = "x", ylab = "y",
     main = "Región factible")
#---- Se agregan las rectas ----
lines(x, y1, lwd=2,col= "blue")
lines(x, y2, lwd=2,col= "green")
lines(x, y3, lwd=2,col= "purple")
lines(x, y4, lwd=2,col= "magenta")
abline(h=0,lty=1,col="gray",lwd=2)
abline(v=0,lty=1,col="gray",lwd=2)
legend("bottomleft",
       legend = c("x+2y<=12",
                  "2x+y>=4",
                  "x-2y<=6",
                  "x-y>=0"),
       col= c("blue","green","purple","magenta"),
       lwd = 2, bty = "n")
#---- Determinemos los vertices ----

v1 <- c(2,0)
# L2 con L4
A1 <- matrix(c(2,1,
               1,-1),2,byrow=TRUE)
b1 <- c(4,0)
v2 <- solve(A1,b1)

# L1 con L4
A2 <- matrix(c(1,2,
               1,-1),2,byrow=TRUE)
b2 <- c(12,0)
v3 <- solve(A2,b2)

# L1 con L3
A3 <- matrix(c(1,2,
               1,-2),2,byrow=TRUE)
b3 <- c(12,6)
v4 <- solve(A3,b3)
v5 <- c(6,0)

vx <- c(v1[1], v2[1], v3[1], v4[1],v5[1])
vy <- c(v1[2],v2[2], v3[2], v4[2],v5[2])

polygon(vx, vy,
        col = rgb(0.2,0.5,0.9,0.35),
        border = "lightblue",
        lwd = 2)

points(vx, vy, pch=19)

text(vx, vy,
     labels = paste0("(", round(vx,2), ",", round(vy,2), ")"),
     pos = 4)