# Subsetting

getwd()

# Muitas das técnicas abaixo podem ser realizadas com a aplicação das funções:
# subset(), merge(), arrange()
# Mas conhecer estas notações é fundamental para compreender como gerar
# subconjuntos de dados

# Vetores
x <- c('a','b','c','d','e')
x[]
x

# Índices positivos - elementos em posições específicas
x[c(1,3)]
x[c(1,1)]
x[order(x)]

# Índices negativos - Ignora elementos em posições específicas
x[-c(1,3)]
x[-c(1,4)]

# Vetor lógico para gerar subsetting
x[c(T,F)]
x[c(T,F,T,F)]

# Vetor de caracteres
x <- c('A','B','C','D')
y <- setNames(x, letters[1:4])
y

y[c('d','c','a')]
y[c('a','a','a')]

# Matrizes
mat <- matrix(1:9, nrow = 3)
colnames(mat) <- c('A','B','C')
mat[1:2, ]
mat[1:2,2:3]
 # Função outer() permite que uma matriz se comporte como vetores individuais
?outer
vals <- outer(1:5, 1:5, FUN = 'paste', sep = ',')
vals
vals[c(4,15)]

# DataFrames
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$x
df[df$x == 2, ]
df[c(1,3), ]
df[c('x','z')]
df[ ,c('x','z')]
str(df)
str(df['x'])
str(df[ ,'x'])

# Removendo colunas do DataFrame
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$z <- NULL
df

# Operadores [], [[]], $
a <- list(x = 1:3, y = 4:5)
a
a[1]
a[[1]]
a[[1]][[1]]
a[['x']]

b <- list(a = list(b = list(c = list(d = 1))))
b
b[[c('a','b','c','d')]]
b[['a']][['b']][['c']][['d']]

# x$y é equivalente a x[['y', exact = F]]
var <- 'cyl'
mtcars$var
View(mtcars)
mtcars[[var]]

x <- list(abc = 1)
x
x$a
x[['a']]
x$abc

# Subsetting e atribuição
x <- 1:5
x
x[c(1,2)] <- 2:3

x[-1] <- 4:1
x

# Isso é subsetting
head(mtcars)
mtcars[] <- lapply(mtcars, as.integer)
head(mtcars)

# Isso não é subsetting
mtcars <- lapply(mtcars, as.integer)
head(mtcars)

# Lookup tables
x <- c('m','f','u','f','f','m','m')
x
lookup <- c(m = 'MAle', f = 'female', u = NA)
lookup[x]
unname(lookup[x])

# Usando operadores lógicos
x1 <- 1:10 %% 2 == 0
x1
which(x1)
x2 <- which(x1)
x2
y1 <- 1:10 %% 5 == 0
y2 <- which(y1)
y2
intersect(x2,y2)
x1 & y1
union(x2,y2)
setdiff(x2,y2)