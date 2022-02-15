# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap02")
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
dir()
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
df <- data.frame(v1 = c('a','b','c','d','e'), v2 = c(T,F,F,T,T), v3 = c(1:5))
df
class(df)

# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.

# Criando o vetor
vec <- c(10,5,43,11,2,-9,0,17,-22,90,3)
vec
class(vec)

for (i in vec){
  if (i > 10){
    print(i)
    print('Este número é maior que 10.')}
}

# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst <- list('oi',10,T,-22,'otavio',55)
lst

for (i in lst){print(i)}

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as matrizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat1*mat2

# Multiplicação de matrizes
mat1%*%mat2

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos
vec <- c(1:5)
names(vec) <- c('col1','col2','col3','col4','col5')
vec

mat1 <- matrix(c(1:9), nrow = 3, ncol = 3)
dimnames(mat1) <- list(c('obs1','obs2','obs3'), c('var1','var2','var3'))
mat1

lst <- list(1,'c',4,c(1:3))
names(lst) <- c('dim1','dim2','dim3','dim4')
lst

df <- data.frame(v1 = c('a','b','c','d','e'), v2 = c(T,F,F,T,T), v3 = c(1:5))
colnames(df) <- c('caracteres','logico','integer')
rownames(df) <- c('obs1','obs2','obs3','obs4','obs5')
df

# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2

?sample
mat2[sample(1:50,10)] = NA
mat2

# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
apply(mat1,1,sum)
apply(mat1,2,sum)

# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a
sort(a)
order(a)

# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

for (i in mat1) {
  if (i > 15){
    print(i)}
}