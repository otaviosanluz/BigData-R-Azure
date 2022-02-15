# Expressões regulares em R

# Determinação de um padrão, para que depois possa ser realizada uma busca dentro,
# por exemplo, de um texto.

str <- c("Expressões", "regulares", "em linguagem R", 
         "permitem a busca de padrões", "e exploração de textos",
         "podemos buscar padrões em dígitos",
         "como por exemplo",
         "10992451280")
length(str)
str

# grep() # procura por algum padrão
grep('ex',str,value = F)
grep('ex',str,value = T)
grep('\\d',str,value = F)
grep('\\d',str,value = T)

# grepl() # procura por algum padrão, retornando apenas FALSE ou TRUE
grepl('\\d+', str)
grepl('\\D', str)

# gsub() => substituindo padrões
gsub('em', '***', str)
gsub('ex', 'EX', str)

# sub()
sub('em', 'EM', str)

# regexpr()
frase <- "Isso é uma string."
regexpr(pattern = "u", frase) # aonde esta a letra u?