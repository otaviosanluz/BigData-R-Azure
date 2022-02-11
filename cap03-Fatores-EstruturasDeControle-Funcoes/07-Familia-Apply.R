# Família aplly - uma forma performática de fazer loops

# apply() - arrays e matrizes
# tapply() - os vetores podem ser divididos em diferentes subsets
# lapply() - vetores e listas
# sapply() - versão amigável da lapply
# vapply() - similar a sapply, com valor de retorno modificado
# rapply() - similar a lapply()
# eapply() - gera uma lista
# mapply() - similar a sapply(), multivariada
# by

# Se você estiver trabalhando com os objetos:

# list, numeric, character (list/vector) => sapply ou lapply
# matrix, data.frame (agregação por coluna) => by / tapply
# Operações por linha ou operações específicas => apply

# Usando um loop
lista1 <- list(a = (1:20),b = (35:67))

# Calculando o total de cada elemento da lista com loop for
valor_a = 0
valor_b = 0

for(i in lista1$a){
  valor_a = valor_a + i
}

for(j in lista1$b){
  valor_b = valor_b + j
}

print(valor_a)
print(valor_b)

# Calculando cada elemento da lista com sapply
sapply(lista1, sum)

sapply(lista1, mean)

# apply()
x <- matrix(c(20,13,4,7,89,54,10,1,99), nr = 3, byrow = T)

apply(x,mean) # erro
apply(x,1,mean) # média por linha
apply(x,2,mean) # média por coluna
apply(x,1,plot)

result <- apply(x,1,mean)
result

# Aplicando apply a um Dataframe
escola <- data.frame(aluno = c('maria','joão','aurélio','miguel','gabriel','otavio'),
                     matematica = c(90,55,68,70,25,96),
                     fisica = c(10,43,33,78,47,91),
                     quimica = c(77,87,54,61,45,90))
escola
escola$matematica

# Calculando a média por aluno
escola$media = NA
escola

escola$media <- apply(escola[,c(2,3,4)],1,mean) # todas as linhas, colunas 2,3,4
escola
escola$media <- round(escola$media)
escola

# tapply()
?gl # gerar níveis de fator
tabela_basquete <- data.frame(equipe = gl(5,5,labels = paste('Equipe', LETTERS[1:5])),
                              jogador = sample(LETTERS,25),
                              num_cestas = floor(runif(25,min = 0,max = 50)))
View(tabela_basquete)
summary(tabela_basquete)

# Como calcular o total de cestas por equipe?

# tapply() vs sqldf
library(sqldf)

sqldf('select equipe, sum(num_cestas) from tabela_basquete group by equipe')

tapply(tabela_basquete$num_cestas,tabela_basquete$equipe,sum)
tapply(tabela_basquete$num_cestas,tabela_basquete$equipe,mean)

# by
?by

dat <- data.frame(species=c(rep(c(1,2,3), each=5)),
                  petal.length=c(rnorm(5, 4.5, 1),
                                 rnorm(5, 4.5, 1),
                                 rnorm(5, 5.5, 1)),
                  petal.width=c(rnorm(5, 2.5, 1),
                                rnorm(5, 2.5, 1),
                                rnorm(5, 4, 1)))
dat$species <- factor(dat$species)
View(dat)

by(dat,dat$species,function(x){
  # calcular o comprimento médio da pétala por espécie
  mean.pl <- mean(x$petal.length)
})

# lapply()
lista <- list(a = (1:10), b = (45:77))
lista
lapply(lista,sum)
sapply(lista,sum)

# vapply()
vapply(lista,fivenum,c(Min. = 0,'1stqu' = 0,Median = 0,'3sqtu' = 0, Max = 0))
?fivenum
?vapply

# replicate()
replicate(7,runif(10))

# mapply()
mapply(rep,1:4,4:1)

# rapply()
lista2 <- list(a = c(1:5), b = c(6:10))
lista2

rapply(lista2,sum)
rapply(lista2,sum,how = 'list')