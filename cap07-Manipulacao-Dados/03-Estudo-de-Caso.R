# Estudo de caso - Limpando, Transformando e Manipulando dados de Voos

getwd()

# Instalando o pacote hflights (dados de voos de Houston)
install.packages('hflights')
library(hflights)

# Criando um obejto tbl
?tbl_df
flights <- tbl_df(hflights)
View(flights)

# Resumindo os dados
str(flights)
glimpse(flights)

# Visualizando como dataframe
data.frame(head(flights))

# Filtrando dados com slice
flights[flights$Month == 1 & flights$DayofMonth == 1, ]

# Aplicando filter
filter(flights, Month == 1, DayofMonth == 1)
filter(flights, UniqueCarrier == 'AA' | UniqueCarrier == 'UA')
filter(flights, UniqueCarrier %in% c('AA','UA'))# quero que o UniqueCarrier esteja dentro do vetor

# select
select(flights, Year:DayofMonth, contains('Taxi'), contains('Delay'))

# Organizando os dados
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60)

head(with(flights, tapply(ArrDelay, Dest, mean, na.rm = T)))
head(aggregate(ArrDelay ~ Dest, flights, mean))

flights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = T)