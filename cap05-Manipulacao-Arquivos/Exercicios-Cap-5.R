# Solução Lista de Exercícios - Capítulo 5

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
getwd()


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")

# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))


# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")

# Plotando na mesma área
h1 <- hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
h2 <- hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")

plot(h1, main = 'Histogramas', xlab = 'Altura',ylab = 'Peso',col=rgb(1,0,0,0.5),xlim = c(0,300))
plot(h2,col = rgb(0,0,1,0.5),add = T)

# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" ,
        color = ~Species,
        marker=list(size=20 , opacity=0.5))

# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
library(plotly)
head(volcano)

p = plot_ly(z = volcano, type = 'surface')
p

# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
library(rjson)
json <- fromJSON(file = 'input.json')

# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
df <- data.frame(json)
class(df)
View(df)

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
install.packages('XML')
library(XML)
library(methods)

result <- xmlParse(file = 'input.xml')
result
class(result)

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
df2 <- xmlToDataFrame('input.xml')
class(df2)

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:
archive <- read.csv('input.csv',sep = ',')
View(archive)
class(archive)
str(archive)

# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
nrow(archive)

# Pergunta 2 - Qual o maior salário?
max(archive$salary)

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
posicao <- which.max(archive[,'salary']) # posição no dataframe do maior salário
posicao

pessoa_maior_salario <- archive[posicao, c('name','salary')]
pessoa_maior_salario

registro <- subset(archive,salary == max(salary))
registro

# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
IT <- subset(archive,dept == 'IT')
IT

# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
pessoas <- subset(archive,salary > 600 & dept == 'IT')
pessoas