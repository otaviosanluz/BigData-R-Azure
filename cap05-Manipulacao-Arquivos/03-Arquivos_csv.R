# Arquivos csv

setwd('C:/Users/otavio/Mundo/Github/BigData-R-Azure/cap05-Manipulacao-Arquivos')

# Usando o pacote readr
library(readr)

# Abre o prompt para escolher o arquivo
meu_arquivo <- read_csv(file.choose())

View(meu_arquivo)

# Importando arquivos
df1 <- read_table('temperaturas.txt',
                  col_names = c('day','month','year','temp'))

head(df1)
View(df1)
str(df1)

read_lines('temperaturas.txt',skip = 0,n_max = -1L)
read_file('temperaturas.txt')

# Exportando e importando
write_csv(iris,'iris.csv')
dir()

df_iris <- read_csv('iris.csv',col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c('setosa','versicolor','virginica'))
))

dim(df_iris)
str(df_iris)
View(df_iris)

# Manipulando arquivos csv
df_cad <- read_csv('cadastro.csv')
View(df_cad)
class(df_cad)

library(dplyr)
options(warn = -1) # para não visualizar as mensagens warning

df_cad <- tbl_df(df_cad)
head(df_cad)
View(df_cad)

write.csv(df_cad,'df_cad_bkp.csv')
dir()

# Importando vários arquivos de forma simultânea
list.files()
lista_arquivos <- list.files(setwd('C:/Users/otavio/Mundo/Github/BigData-R-Azure/cap05-Manipulacao-Arquivos/arquivos'),full.names = T)
class(lista_arquivos)
lista_arquivos

lista_arquivos2 <- lapply(lista_arquivos, read_csv) # aplica um looping em lista_arquivos aplicando a função read_csv
class(lista_arquivos2)
View(lista_arquivos2)

# Parsing
parse_date('01/02/15','%m/%d/%y')
parse_date('01/02/15','%d/%m/%y')
parse_date('01/02/34','%y/%m/%d')

locale('en')
locale('fr')
locale('pt')