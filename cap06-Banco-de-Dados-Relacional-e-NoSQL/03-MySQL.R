# Carregando e Analisando Dados do MySQL com Linguagem R

setwd('C:/Users/otavio/Mundo/Github/BigData-R-Azure/cap06-Banco-de-Dados-Relacional-e-NoSQL')
getwd()

# Instalando pacotes
install.packages('RMySQL') # utlizado para acessar o MySQL
install.packages('dbplyr') # contém o driver para conectar em bancos de dados relacionais

# Carregando pacotes
library(RMySQL)
library(ggplot2)
library(dbplyr)

# Conexão com o banco de dados
con = dbConnect(MySQL(), user = 'root', password = 'dsa1234', dbname = 'titanicDB', host = 'localhost')

# Query
# Salvando a query
qry <- "select pclass, survived, avg(age) as media_idade from titanic where survived = 1 group by pclass, survived;"

# Executar a query no banco de dados
?dbGetQuery
dbGetQuery(con, qry)

# Plot
dados <- dbGetQuery(con, qry)
head(dados)
class(dados)
ggplot(dados, aes(pclass, media_idade)) + geom_bar(stat = 'identity')

# Conectando no MySQL com dplyr
?src_mysql
con2 <- src_mysql(dbname = 'titanicdb', user = 'root', password = 'dsa1234', hpst = 'localhost')

# coletando e agrupando os dados
dados2 <- con2 %>%
  tbl('titanic') %>%
  select(pclass, sex, age, survived, fare) %>%
  filter(survived == 0) %>%
  collect()

head(dados2)

# Manipulando os dados
dados2 <- con2 %>%
  tbl('titanic') %>%
  select(pclass, sex, survived) %>%
  group_by(pclass, sex) %>%
  summarise(survival_ratio = avg(survived)) %>%
  collect()

View(dados2)

# Plot
ggplot(dados2, aes(pclass, survival_ratio, color = sex, group=sex)) +
  geom_point(size=3) + geom_line()

# Sumarizando os dados
dados2 <- con2 %>%
  tbl('titanic') %>%
  filter(fare > 150) %>%
  select(pclass, sex, age, fare) %>%
  group_by(pclass, sex) %>%
  summarise(avg_age = avg(age),
            avg_fare = avg(fare))

head(dados2)

# Para outros bancos de dados, use RODBC










