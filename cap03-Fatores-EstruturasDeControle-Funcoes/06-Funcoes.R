# Funções

# Help
?sample
args(sample)
args(mean)
args(sd)

# Funções built-in
abs(-43)
sum(c(1:15))
mean(c(1:15))
round(c(1.1:5.8))
rev(c(1:5)) # reverso
seq(1:5)
sort(rev(c(1:5)))
append(c(1:5), 6)

vec1 <- c(1.5, 2.9, 3.3, 0.7, 1.9)
vec2 <- rev(vec1)
vec2

# Funções dentro de funções
plot(rnorm(10))
mean(c(abs(vec1), abs(vec2)))

# Criando funções
myfunc <- function(x) {x + x}
myfunc(10)
class(myfunc)

myfunc2 <- function(a,b) {
  valor = a ^ b
  print(valor)
}
myfunc2(4,3)

jogando_dados <- function(){
  num <- sample(1:6, size = 1) # variável local
  num
}
jogando_dados()

# Escopo
print(num)
num <- c(1:6)
num # variável global

# Funções sem número definido de argumentos
vec1 <- (10:13)
vec2 <- c('a','b','c','d')
vec3 <- c(6.5,9.2,11.9,5.1)


myfunc3 <- function(...){
  df <- data.frame(cbind(...))
  print(df)
}

myfunc3(vec1)
myfunc3(vec2,vec3)
myfunc3(vec1,vec2,vec3)