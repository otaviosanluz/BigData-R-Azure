# Operações com strings

getwd()

# String
texto <- 'Isso é uma string'
texto

x = as.character(3.14)
x
class(x)

# Concatenando strings
nome = 'Nelson'; sobrenome = 'Mandela'
paste(nome, sobrenome)
cat(nome, sobrenome)

# Formatando a saída
sprintf('A %s é nota %d', 'Data Science Academy', 10)

# Extraindo parte da string
texto = 'Isso é uma string'
substr(texto, start = 12, stop = 17)

# Contando o npumero de caracteres
nchar(texto)

# Alternando a capitalização
tolower('Histogramas e elementos')
toupper('Histogramas e elementos')

# Usando stringr
library(stringr)

# Dividindo uma string em caracteres
strsplit('Histogramas e Elementos de dados', NULL)

string1 <- c('Esta é a primeira parte da minha string e será a primeira parte do meu vetor',
             'Aqui a minha string continua, mas será transformada em um segundo vetor')
string1

string2 <- c('Precisamos testar outras strings - @???!&&',
             'Análise de dados em R')
string2

# Adicionando duas strings
str_c(c(string1,string2))

# Podemos contar quantas vezes um caracter aparece no texto
str_count(string1, 's')

# Localiza a primeira e a última posição em que o caracter aparece na string
str_locate_all(string1, 's')

# Substitui a primeira ocorrência de um caracter
str_replace(string1, '\\s', '')

# Substitui todas as ocorrências de um caracter
str_replace_all(string1, '\\s', '')

# Detectando padrões nas strings
string1 <- '17 jan 2022'
string2 <- '1 jan 2022'
padrao <- 'jan 20'
grepl(pattern = padrao, x = string1)
padrao <- 'jan20'
grepl(pattern = padrao, x = string2)