# Lista de Exercícios - Capítulo 4

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap04")
getwd()

# Exercicio 1 - Crie uma função que receba os dois vetores abaixo como parâmetro, 
# converta-os em um dataframe e imprima no console
vec1 <- (10:13)
vec2 <- c("a", "b", "c", "d")

func <- function(v1,v2){
  df <- data.frame(v1,v2)
  print(df)
}

func(vec1,vec2)

# Exercicio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com 
# números inteiros e calcule a média de cada linha
num <- (1:16)
mat <- matrix(num, nrow = 4, ncol = 4)
mat

# média por linha
apply(mat,1,mean)

# Exercicio 3 - Considere o dataframe abaixo. 
# Calcule a média por disciplina e depois calcule a média de apenas uma disciplina
escola <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Ajay'),
                     Matematica = c(90, 80, 85, 87, 56, 79),
                     Geografia = c(100, 78, 86, 90, 98, 67),
                     Quimica = c(76, 56, 89, 90, 100, 87))
escola

sum(escola$Matematica) / length(escola$Matematica)
sum(escola$Geografia) / length(escola$Geografia)
sum(escola$Quimica) / length(escola$Quimica)

# utilizando apply
apply(escola[,c(2,3,4)],2,mean)

# calculando a média de apenas uma disciplina
apply(escola[,c(2), drop = F],2,mean)

# Exercicio 4 - Cria uma lista com 3 elementos, todos numéricos 
# e calcule a soma de todos os elementos da lista
lst <- list(a = 1:10, b = 1:5)
lst
do.call(sum,lst)
# Exercicio 5 - Transforme a lista anterior um vetor
vec <- unlist(lst)
vec
class(vec)


# Exercicio 6 - Considere a string abaixo. Substitua a palavra "textos" por "frases"
str <- c("Expressoes", "regulares", "em linguagem R", 
         "permitem a busca de padroes", "e exploracao de textos",
         "podemos buscar padroes em digitos",
         "como por exemplo",
         "10992451280")
str
sub('textos','frases',str)

# Exercicio 7 - Usando o dataset mtcars, crie um gráfico com ggplot do tipo 
# scatter plot. Use as colunas disp e mpg nos eixos x e y respectivamente
View(mtcars)
camada1 <- geom_point(mapping = aes(x = disp,y = mpg,color = cyl),
                      data = mtcars,
                      size = 3)
ggplot() + camada1

# Exercicio 8 - Considere a matriz abaixo.
# Crie um bar plot que represente os dados em barras individuais.
mat1 <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
mat1
barplot(mat1, beside = T)

# Exercício 9 - Qual o erro do código abaixo?
data(diamonds)
View(diamonds)
ggplot(data = diamonds, aes(x = price, group = fill, fill = cut)) + 
  geom_density(adjust = 1.5)

"Error in FUN(X[[i]], ...) : objeto 'fill' não encontrado"

ggplot(data = diamonds, aes(x = price, fill = cut)) + 
  geom_density(adjust = 1.5)

# Exercício 10 - Qual o erro do código abaixo?
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_barplot() +
  labs(fill = "cyl")

"Error in geom_barplot() : 
  não foi possível encontrar a função" "geom_barplot"

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cyl")