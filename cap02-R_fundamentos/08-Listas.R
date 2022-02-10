# Listas, Operações com Listas e Listas Nomeadas

getwd()

# Use list() para criar as listas

# Listas de strings
lista_caracter1 = list('A','B','C')
lista_caracter1
lista_caracter2 = list(c('A','A'),'B','C')
lista_caracter2
lista_caracter3 = list(matrix(c('A','A','A','A'), nr = 2),'B','C')
lista_caracter3

# As listas podem ser de números inteiros, floats, números complexos, valores lógicos, listas compostas

lista1 <- list(1:10, c('Zico','Pele','Ronaldo'), rnorm(10))
lista1

# Slicing (fatiamento) das listas
lista1[1]
lista1[2]
lista1[[1]][2]
lista1[[2]][1]
lista1[[2]][3] = 'Monica'
lista1

# Listas nomeadas
names(lista1) <- c('inteiros','caracteres','numéricos')
lista1

vec_num <- 1:4
vec_char <- c('A','B','C','D')

lista2 <- list(Numeros = vec_num, Letras = vec_char)
lista2

# Nomear os elementos diretamente
lista2 <- list(elemento1 = 3:5, elemento2 = c(7,2,3,5))
lista2

# Trabalhando com elementos específicos da lista
lista1$caracteres
length(lista1)
lista1$inteiros

# Verificar o comprimento da lista
length(lista2)

# Podemos extrair um elemento específico dentro de cada nínvel da lista
lista1$caracteres[2]

# Mode dos elementos
mode(lista1$numéricos)
mode(lista1$caracteres)
mode(lista1$inteiros)

# Combinando duas listas
lista3 <- c(lista1, lista2)
lista3

# Transformando vetor em lista
v = c(1:3)
v
l = as.list(v)
l

# Unindo 2 elementos em uma lista
mat = matrix(1:4, nrow = 2)
mat
vec = c(1:9)
vec
lst = list(mat,vec)
lst