# Funções Especiais

getwd()

# unlist()
# Produz um vetor com os elementos da lista
lst1 <- list(6,'b',15)
class(lst1)

unlist(lst1)
vec1 <- unlist(lst1)
class(vec1)

lst2 <- list(v1 = 6,v2 = list(381,2190),v3 = c(30,217))
lst2

unlist(lst2)

mean(unlist(lst2))
round(mean(unlist(lst2)))

# do.call()
# Executa uma função em um objeto
# **ATENÇÃO**
# As funções da família apply aplicam uma função a cada elemento de um objeto
# A função do.call aplica uma função a um objeto inteiro e não a cada elemento individualmente
data <- list()
N <- 100

for (n in 1:N){
  data[[n]] = data.frame(index = n,char = sample(letters, 1),z = rnorm(1))
}

head(data)

do.call(rbind,data)
class(do.call(rbind,data))

# lapply() x do.call()
y <- list(1:3, 4:6, 7:9)
y

lapply(y,sum) # soma a cada elemento da lista
do.call(sum,y) # soma para todos os elementos da lista

# O resultado da função lapply() pode ser obtido de ouras formas
# Pacote plyr
library('plyr')
y <- list(1:3,4:6,7:9)
y

ldply(y,sum)

# strsplit()
# Divide uma string ou vetor de caracteres
texto <- 'Data Science Academy'
strsplit(texto, " ")

dates <- c('1998-05-23','2008-09-13','1977-01-30')
temp <- strsplit(dates,'-')
temp
class(temp)

# Transforma a lista em matriz, fazendo antes um unlist()
matrix(unlist(temp), ncol = 3, byrow = T)

names <- c('brian, miguel','raquel, moraes','joao, teixeira',
           'dorsey, jack','glass, noah','mirian, leite')

temp <- strsplit(names,', ')
temp

frase <- 'Muitas vezes temos que repetir algo várias vezes para conseguir aprender'
palavras <- strsplit(frase,' ')
palavras
unique(tolower(palavras))

# strsplit() com dataframes
antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua','pao_e_agua_2'))
antes
a = strsplit(as.character(antes$tipo),'_e_')
class(a)

library(stringr)
str_split_fixed(antes$tipo, '_e_',2) # gera como saída uma matriz

# Usando do.call()
antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua','pao_e_agua_2'))
antes
depois <- strsplit(as.character(antes$tipo),'_e_')
depois
do.call(rbind,depois)

# Usando dplyr e tidyr
library(dplyr)
library(tidyr)

antes <- data.frame(
  attr = c(1,30,4,6),
  tipo = c('pao_e_agua','pao_e_agua_2')
)
antes
antes %>%
  separate(tipo,c('pao','agua'),'_e_')