# Solução Lista de Exercícios - Capítulo 7

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
getwd()

# Formatando os dados de uma página web
library(rvest)
library(stringr)
library(tidyr)

# Exercício 1 - Faça a leitura da url abaixo e grave no objeto pagina
# http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I
pagina <- read_html('http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I')
pagina
class(pagina)

# Exercício 2 - Da página coletada no item anterior, extraia o texto que contenha as tags:
# "#detailed-forecast-body b  e .forecast-text"
results <- html_nodes(pagina, '#detailed-forecast-body b , .forecast-text')
results

# Exercício 3 - Transforme o item anterior em texto
texto <- html_text(results)
texto
paste(texto, collapse = ' ')

# Exercício 4 - Extraímos a página web abaixo para você. Agora faça a coleta da tag "table"
url <- 'http://espn.go.com/nfl/superbowl/history/winners'
pagina <- read_html(url)
tag <- pagina %>% html_nodes('table')

# Outra forma de fazer
tag <- html_nodes(pagina, 'table')
tag

# Exercício 5 - Converta o item anterior em um dataframe
df <- html_table(tag)[[1]]
df
class(df)
head(df)
View(df)
str(df)

# Exercício 6 - Remova as duas primeiras linhas e adicione nomes as colunas
df <- df[-(1:2), ]
head(df)
names(df) <- c('number','date','site','results')
View(df)

# Exercício 7 - Converta de algarismos romanos para números inteiros
df$number <- 1:56
View(df) 
df$date <- as.Date(df$date, '%B. %d, %Y')
View(df)

# Exercício 8 - Divida a coluna result em 2 colunas com vencedores e perdedores
df <- separate(df, results, c('vencedor','perdedor'), sep = ', ', remove = T)
View(df)

# Exercício 9 - Inclua mais 2 colunas com o score dos vencedores e perdedores
# Dica: Você deve fazer mais uma divisão nas colunas
pattern <- '\\d+$'
df$pontosVencedor <- as.numeric(str_extract(df$vencedor, pattern))
df$pontosPerdedor <- as.numeric(str_extract(df$perdedor, pattern))
View(df)

df$vencedor <- gsub(pattern, "", df$vencedor)
df$perdedor <- gsub(pattern, "", df$perdedor)
View(df)

# Exercício 10 - Grave o resultado em um arquivo csv
write.csv(df, 'superbowl.csv', row.names = F)
dir()
