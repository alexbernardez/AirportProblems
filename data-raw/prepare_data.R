### Birmingham airport data ###

# Aircraft type
type = c("Fokker Friendship 27", "Viscount 800", "Hawker Siddeley Trident", "Britannia 100",
         "Caravelle VI R", "BAC 111 (50)", "Vanguard 953", "Comet 4B",
         "Britannia 300", "Convair Corronado", "Boeing 707")

# Subscript
i <- 1:11

# Actual 1968/1969 number of movements
eta <- c(42, 9555, 288, 303, 151, 1315, 505, 1128, 151, 112, 22)

# Actual 1968/1969 changes per movement (in pounds)
p <- c(5.8, 11.4, 21.7, 29.8, 20.3, 16.7, 26.4, 29.4, 34.7, 48.3, 66.7)

# Estimated diversion costs per movement (in pounds)
d <- c(85.38, 89.37, 89.25, 142.31, 118.85, 143.91, 288.48, 76.04, 170.77, 156.54, 185.00)

# Benefit per movement (in pounds)
b <- c(91.98, 100.77, 110.95, 172.11, 139.15, 160.61, 314.88, 105.44, 205.47, 204.84, 251.70)

# Runway user index
l <- c(0.560, 0.652, 0.809, 0.826, 0.828, 0.834, 0.871, 0.891, 0.963, 0.981, 1)

# Maintenance cost per movement (in pounds)
c <- c(5.23, 6.09, 7.55, 7.71, 7.73, 7.79, 8.13, 8.32, 8.99, 9.16, 9.34)

# Capital cost (assumed contribution) (in pounds)
g <- c(65899, 76725, 95200, 97200, 97436, 98142, 102496, 104849, 113322, 115440, 117676)

## Data frame
Birmingham <- data.frame(type, i, eta, p, d, b, l, c, g)
Birmingham$p <- format(round(Birmingham$p, 2), nsmall = 2)

# Dataset
usethis::use_data(Birmingham, overwrite = TRUE)
################################################################################

### Elevator data ###

# Identificador de cada vivienda
id <- c("1ºA", "1ºB", "1ºC", "1ºD", "2ºA", "2ºB","2ºC", "2ºD", "3ºA", "3ºB", 
        "3ºC", "3ºD", "4ºA", "4ºB")

# Piso en el que encuentra
floor <- c(rep(1,4), rep(2,4), rep(3,4),rep(4,2))

# Coste de instalación por piso
c <- c(rep(25000, 4), rep(30000, 4), rep(35000, 4), rep(45000, 2))

# Superficie (en metros cuadrados)
area <- c(rep(80, 2), rep(90,2), rep(80,2), rep(90,2), rep(80, 2),
          rep(90, 2), 110, 120)

# Data frame
elevator <- data.frame(id, floor, c, area)

# Dataset
usethis::use_data(elevator, overwrite = TRUE)
################################################################################

### Peinador airport data ###

library(readxl)
library(dplyr)

# Leer datos
datos <- read_excel("C:/Users/alebe/Dropbox/Tesis_Alex/Programas_R/Reglas aeropuerto/Peinador enero 2025.xlsx")

# Ordenar datos (deberías especificar por qué variable ordenas)
datos <- datos %>% arrange(Type)  

# Crear las variables
type <- as.character(datos$Type)

# Subscript
i <- seq_along(type)  # Más elegante que 1:length(type)

# MTOW (in tons)
MTOW <- datos$MTOW

# MLW (in tons)
MLW <- datos$MLW

# Takeoffs
TO <- datos$Takeoffs

# Landings
LDG <- datos$Landings

# Data frame
Peinador <- data.frame(type, i, TO, LDG, MTOW, MLW)

# Dataset
usethis::use_data(Peinador, overwrite = TRUE)
################################################################################

### University bus travel ###

# district
district <- c("Domaio", "Meira", "Moaña", "Tirán", "Cangas", "Darbo", "O Hío", "Aldán",
              "Beluso", "Bueu", "Cela", "Ardán", "Seixo")

# Town
town <- c(rep("Moaña", 4), rep("Cangas", 4), rep("Bueu", 3), rep("Marín", 2))

# Number of passengers
passengers <- c(4, 4, 10, 5, 12, 1, 3, 6, 2, 5, 1, 2, 1)

# Distancia con respecto al Campus de Vigo (en km)
distance <- c(26.2, 27.5, 29.1, 31.2, 33.9, 35.9, 39.7, 44.0, 46.8, 49.7, 53.5, 56.4, 57.1)

# Data frame
universitybus <- data.frame(district, town, distance, passengers)

# Dataset
usethis::use_data(universitybus, overwrite = TRUE)
