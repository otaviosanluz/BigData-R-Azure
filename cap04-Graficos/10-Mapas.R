# Mapas

# Instalando os pacotes
install.packages(c('maps', 'mapdata'))

# Carregando os pacotes
library(ggplot2)
library(maps)
library(mapdata)

# Função para buscar coordenadas dos países
mapa <- map_data('world')

# Visualizando o dataframe
View(mapa)
dim(mapa)

# Gerando o mapa
ggplot() + geom_polygon(data = mapa, aes(x = long, y = lat,group = group)) +
  coord_fixed(1.3)

ggplot() +
  geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = NA, color = 'blue') +
  coord_fixed((1.3))

gg1 <- ggplot() + 
  geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = 'seagreen1', color = 'blue') +
  coord_fixed((1.3))
gg1

# Marcando alguns pontos no mapa
# OBS: Caso não tenha as latitudes e longitudes, pode-se utilizar um ShapeFile(ex:disponivel no IBGE)
labs <- data.frame(
  long = c(69.24140, -2.8456051),
  lat = c(-78.38995, 22.44512),
  names = c('Ponto1', 'Ponto2'),
  stringsAsFactors = FALSE
)

# Pontos no mapa
gg1 +
  geom_point(data = labs, aes(x = long, y = lat), color = 'black', size = 2) +
  geom_point(data = labs, aes(x = long, y = lat), color = 'yellow', size = 2) 

# Divisão por países
ggplot(data = mapa) +
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = 'white') +
  coord_fixed(1.3) +
  guides(fill = FALSE)

# rMaps 
# http://rmaps.github.io