# Dataframese Operações com Dataframes

getwd()

# Criando um dataframe vazio
df <- data.frame()
class(df)
df

# Criando vetores vazios
nomes <- character()
idades <- numeric()
itens <- numeric()
codigos <- integer()

df <- data.frame(c(nomes,idades,itens,codigos))
df

# Criando vetores
pais = c('Portugal','Inglaterra','Irlanda','Egito','Brasil')
nome = c('Bruno','Maria','Tiago','Amanda','Bianca')
altura = c(1.75, 1.66, 1.90, 1.55, 1.73)
codigo = c(8890, 6788, 2233, 1411, 5566)

# criando um dataframe de diversos vetores
pesquisa = data.frame(pais, nome, altura, codigo)
pesquisa

# Adicionando um novo vetor a um dataframe existente
olhos = c('verde','azul','azul','castanho','verde')
pesq = cbind(pesquisa, olhos)
pesq

# Informações sobre o dataframe
str(pesq)
dim(pesq)
length(pesq)

# Obtendo um vetor de um dataframe
pesq$pais
pesq$altura

# Extraindo alguns elementos do dataframe
pesq[1,3]
pesq[3,2]

# Números de linhas e colunas
nrow(pesq)
ncol(pesq)

# Primeiras 5 linhas
head(mtcars)

# Últimas 5 linhas
tail(mtcars)

# Dataframes built-in do R
View(mtcars)

# filtro para um subset de dados que atendem a um critério
pesq[altura < 1.65, ]
pesq[altura < 1.65, c('codigo','olhos')]

# Nomeando dataframes
names(pesq) <- (c('País','Nome','Altua','Código','Olhos'))
pesq

colnames(pesq) <- c('var1','var2','var3','var4','var5')
rownames(pesq) <- c('obs1','obs2','obs3','obs4','obs5')
pesq

# Carregando um arquivo csv
pacientes <- data.frame(read.csv(file = 'pacientes.csv', header = TRUE, sep = ','))

View(pacientes)
head(pacientes)
summary(pacientes)

# Visualizando as variáveis
pacientes$Diabete
pacientes$ID
pacientes$Idade

# Histograma
hist(pacientes$Idade)

# Combinando dataframes
dataset_final <- merge(pesq, pacientes)
dataset_final