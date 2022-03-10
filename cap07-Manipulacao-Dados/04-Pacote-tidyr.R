# Remodelagem de Dados com tidyr

getwd()

# Carregando os pacotes
library(tidyr)
library(ggplot2)

# Criando dados
dados <- data.frame(
  Nome = c('geografia','literatura','biologia'),
  regiao_a = c(97,80,84),
  regiao_b = c(86,90,91)
)

dados

dados %>%
  gather(regiao, NotaFinal, regiao_a:regiao_b)

# Criando dados
set.seed(10)
df2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle','tratamento'),each = 2)),
  work.t1 = runif(4),
  home.t1 = runif(4),
  work.t2 = runif(4),
  home.t2 = runif(4)
)
df2

# Reshape 1
df2_organizado1 <- df2 %>%
  gather(key,time, -id, -acao)

df2_organizado1

# Reshape 2
df2_organizado2 <- df2_organizado1 %>%
  separate(key,into = c('localidade','tempo'), sep = '\\.')

df2_organizado2

# Mais um exemplo
set.seed(1)
df3 <- data.frame(
  participante = c('p1','p2','p3','p4','p5','p6'),
  info = c('g1m','g1m','g1f','g2m','g2m','g2m'),
  day1score = rnorm(n = 6,mean = 80,sd = 15),
  day2score = rnorm(n = 6,mean = 88,sd = 8)
)
df3

df3 %>%
  gather(day,score,c(day1score,day2score))

df3 %>%
  gather(day,score,c(day1score,day2score)) %>%
  spread(day,score)
  
df3 %>%
  gather(day,score,c(day1score,day2score)) %>%
  separate(col = info,into = c('group','gender'),sep = 2)

df3 %>%
  gather(day,score,c(day1score,day2score)) %>%
  separate(col = info,into = c('group','gender'),sep = 2) %>%
  unite(infoAgain, group,gender)

df3 %>%
  gather(day,score,c(day1score,day2score)) %>%
  separate(col = info,into = c('group','gender'),sep = 2) %>%
  ggplot(aes(x = day,y = score)) +
  geom_point() +
  facet_wrap(~ group) +
  geom_smooth(method = 'lm', aes(group = 1), se = F)
