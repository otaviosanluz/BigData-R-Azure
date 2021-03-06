# Fatores

# Diretório de trabalho
setwd('C:/Users/otavio/Mundo/Github/BigData-R-Azure/cap03-Fatores-EstruturasDeControle-Funcoes')
getwd()

vec1 <- c('Macho','Femea','Macho','Macho','Femea')
fac_vec1 <- factor(vec1)
fac_vec1
class(vec1)
class(fac_vec1)

# Variáveis categóricas nominais
# Não possuem uma ordem ímplícita
vec <- c('rinoceronte','macaco','zebra','leão','zebra')
vec
fac_vec <- factor(vec)
fac_vec
class(vec)
class(fac_vec)

# Variáveis categóricas ordinais
# Possuem uma ordem natural
grad <- c('doutorado','mestrado','phd','bacharelado','mestrado','doutorado')
grad
fac_grad <- factor(grad, order = T, levels = c('phd','doutorado','mestrado','bacharelado'))
fac_grad
levels(fac_grad)

# Sumarizar os dados fornece uma visão geral sobre o conteúdo das variáveis
summary(grad)
summary(fac_grad)

vec2 <- c('m','f','m','m','m','f','m','f','f','m','f','f','f','m','m')
vec2
fac_vec2 <- factor(vec2)
fac_vec2
levels(fac_vec2) <- c('Fêmea','Macho')
fac_vec2
summary(fac_vec2)
summary(vec2)

# Mais exemplos
data = c(1,2,2,3,1,1,1,3,3,2,1,1,2,3,3,3,2)
fdata = factor(data)
fdata

rdata = factor(data, labels = c('I','II','III'))
rdata

# Fatores não-ordenados
set1 <- c('AA','B','BA','CC','BB','BC','CC','CC','BA')
set1

# Transoformando os dados
# R apenas criou os níveis, o que significa que  não exista uma hierarquia
f.set1 <- factor(set1)
f.set1
class(f.set1)
is.ordered(f.set1)

# Fatores ordenados
o.set1 <- factor(set1,
                 levels = c('CA','BA','AA','CC','B'),
                 ordered = T)
o.set1
is.ordered(o.set1)

# Fatores e Dataframes
df <- read.csv('etnias.csv',sep = ',')
df

# Variáveis do tipo fator
str(df)

# Níveis dos fatores
levels(df$Etnia)
summary(df$Etnia)

# Plot
plot(df$Idade~df$Etnia, xlab = 'Etnia', ylab = 'Idade', main = 'Idade por Etnia')

# Regressão
summary(lm(Idade~Etnia, data = df))

# Convertendo uma coluna em variável categórica, isso criará um fator não-ordenado
str(df)
df$Estado_Civil.cat <- factor(df$Estado_Civil, labels = c('solteiro','casado','divorciado'))
df
str(df)