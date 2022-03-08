# Limpeza, Formatação de Manipulação de Dados
# dplyr() - transformação de dados

setwd('C:/Users/otavio/Mundo/Github/BigData-R-Azure/cap07-Manipulacao-Dados')
getwd()

# Carregando os pacotes
library(readr)
library(dplyr)

sono_df <- read_csv('sono.csv')
View(sono_df)
str(sono_df)
head(sono_df)
class(sono_df)

# Função glimpse() pode ser usada no lugar da função str()
glimpse(sono_df)

# Aplicando mutate()
glimpse(mutate(sono_df, peso_libras = sono_total / 0.45359237))
View(sono_df) # a coluna peso_libras não é criada

# Contagem e histograma
count(sono_df, cidade)
hist(sono_df$sono_total)

# Amostragem
sample_n(sono_df, size = 10)

# select() - seleciona partes do dataset
sleepData <- select(sono_df, nome, sono_total)
head(sleepData)
class(sleepData)
select(sono_df, nome) # seleção de apenas uma coluna
select(sono_df, nome:pais) # retorna todas as colunas de nome até pais - range de colunas

# filter() - aplica filtros
filter(sono_df, sono_total >= 16)
filter(sono_df, sono_total >= 16, peso >= 80)
filter(sono_df, cidade %in% c('Recife', 'Curitiba'))

# arrange() - ordena por algum critério
sono_df %>% arrange(cidade) %>% head

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  head

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  filter(sono_total >= 16)

# mutate() - realiza oprações com os dados, porém sem criar novas colunas
sono_df %>%
  mutate(novo_indice = sono_total / peso) %>% # a coluna é mostrada apenas em tempo de execução
  head

head(sono_df)

sono_df %>%
  mutate(novo_inidice = sono_total / peso,
         peso_libras = peso / 0.453592) %>%
  head

# summarize() - resumo de algo
sono_df %>%
  summarise(media_sono = mean(sono_total))

sono_df %>%
  summarise(media_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n()) # função n() busca o número total

# group_by - agrupar por algum critério
sono_df %>%
  group_by(cidade) %>%
  summarise(media_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())

# Operador %>%
head(select(sono_df, nome, sono_total))

sono_df %>%
  select(nome, sono_total) %>%
  head

sono_df %>%
  mutate(novo_inidice = round(sono_total * peso)) %>%
  arrange(desc(novo_inidice)) %>%
  select(cidade, novo_inidice)