# Estruturas de controle

getwd()

# if-else
x = 25
if (x < 30)
  {'este número é menor que 30.'}

# else
if (x < 7){
  'Este número é menor que 7.'
} else {
  'este número não é menor que 7.'
}

# Comandos podem ser aninhados
x = 7
if (x < 7){
  'Este número é menor que 7. '
} else if (x == 7){
  'Este número é igual a 7.'
} else{
  'Este número é maior que 7.'
}

# ifelse
x = 5
ifelse(x < 6, 'correto!', NA)

x = 9
ifelse(x < 6, 'correto!', NA)

# Expressões ifelse aninhadas
x = c(7,8,9)
ifelse(x < 5, 'Menor que 5',
       ifelse(x == 5, 'igual a 5','maior que 5'))

# Estruturas if dentro de funções
func1 <- function(x,y){
  ifelse(y < 7, x + y, 'não encontrado')
}

func1(4,2)
func1(40,7)

# rep
rep(rnorm(10), 5)

# Repeat
x = 1
repeat{
  x = x + 3
  if(x > 99)
    break
  print(x)
}

# loop for
for (i in 1:20) {print(i)}
for (q in rnorm(10)) {print(q)}

# Ignora alguns elementos dentro do loop
for (i in 1:22){
  if(i == 13 | i == 15)
    next # pula os números 13 e 15
  print(i)
}

# Loop while
x = 1
while (x < 5){
  x = x + 1
  print(x)
}

# O loop while não será executado
y = 6
while (y < 5){
  y = y + 10
  print(y)
}