# Fatores e Dataframe

# Níveis dos fatores
# Internamente, o R armazena valores inteiros e faz um mapeamento para as strings
# e agrupa as estatísticas por níveis

# Criando vetores
vec1 <- c(1001,1002,1003,1004,1005)
vec2 <- c(0,1,1,0,2)
vec3 <- c('verde','laranja','azul','laranja','verde')

# Unindo os vetores em um dataframe
df <- data.frame(vec1,vec2,vec3)
df

# Verificando que o R categorizou a última coluna como fator
str(df)

# Verificando os níveis do fator. Perceba que os níveis estão categorizados em ordem
levels(df$vec3)

# Criando uma outra coluna e atribuindo labels
df$cat1 <- factor(df$vec3, levels = c('cor2','cor1','cor3'))
df

# Internamente, os fatores são registrados como inteiros, mas a ordenação segue a ordem alfabética das strings
str(df)

# Criando uma outra coluna e atribuindo labels
df$cat2 <- factor(df$vec2, labels = c('divorciado','casado','solteiro'))
df
str(df)
levels(df$cat2)