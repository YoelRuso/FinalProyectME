setwd("C:/Users/joelm/OneDrive/Documentos/FinalProyectME")

library(dplyr)
library(ggplot2)
library(cowplot)


datos <- read.csv("Guns.csv")

datos$year <- as.numeric(as.character(datos$year))

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
             "West Virginia", "Wisconsin", "Wyoming", "District of Columbia")



# Crear un conjunto de datos para cada estado
for (estado in estados) {
  # Filtrar datos para el estado actual
  datos_estado <- datos %>% filter(state == estado)
  
  # Asignar el conjunto de datos a una variable con el nombre del estado
  assign(paste0("datos_", estado), datos_estado)
}


for (estado in estados) {
  # Crear el nombre de la variable
  var_name <- paste0("datos_", estado)
  
  # Crear la gráfica para el estado actual
  plots <- ggplot(get(var_name), aes(x = year)) +
    geom_line(aes(y = violent, color = "Violent Crime"), size = 1) +
    geom_line(aes(y = murder, color = "Murder"), size = 1) +
    geom_line(aes(y = robbery, color = "Robbery"), size = 1) +
    labs(title = paste("Evolución de la Criminalidad a lo largo del Tiempo en", estado),
         x = "Año",
         y = "Tasa de Crimen (por 100,000 habitantes)",
         color = "Tipo de Crimen") +
    scale_color_manual(values = c("Violent Crime" = "red", "Murder" = "blue", "Robbery" = "green")) +
    theme_minimal()
  print(plots)
}

