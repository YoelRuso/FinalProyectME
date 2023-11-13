setwd("C:/Users/joelm/OneDrive/Documentos/FinalProyectME")

library(dplyr)

datos <- read.csv("Guns.csv")


estados <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California",
             "Colorado", "Connecticut", "Delaware", "Florida", "Georgia",
             "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
             "Kentucky", "Louisiana", "Maine", "Maryland",
             "Massachusetts", "Michigan", "Minnesota", "Mississippi",
             "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
             "New Jersey", "New Mexico", "New York", "North Carolina",
             "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
             "Rhode Island", "South Carolina", "South Dakota", "Tennessee",
             "Texas", "Utah", "Vermont", "Virginia", "Washington",
             "West Virginia", "Wisconsin", "Wyoming", "Columbia")


# Crear un conjunto de datos para cada estado
for (estado in estados) {
  # Filtrar datos para el estado actual
  datos_estado <- datos %>% filter(state == estado)
  
  # Asignar el conjunto de datos a una variable con el nombre del estado
  assign(paste0("datos_", estado), datos_estado)
}
