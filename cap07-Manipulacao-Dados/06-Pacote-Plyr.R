# Split-Apply-Combine - Pacote plyr
# Divida os dados, aplique uma regra e combine para gerar o resultado final

getwd()

install.packages('plyr')
install.packages('gapminder')

library(plyr)
library(gapminder)

# Split-Apply-Combine
?ddply
View(gapminder)
df <- ddply(gapminder, ~ continent,
            summarise,
            max_le = max(lifeExp))
str(df)
head(df)
View(df)
levels(df$continent)

# Split-Apply-Combine
ddply(gapminder, ~ continent,
      summarise,
      n_uniq_countries = length(unique(country)))

ddply(gapminder, ~ continent,
      summarise,
      min = min(lifeExp),
      max = max(lifeExp),
      median = median(lifeExp))

# Usando um dataset do ggplot
library(ggplot2)
data(mpg)
str(mpg)

# Trabalhando com um subset do dataset
data <- mpg[ ,c(1,7:9)]
View(data)

# Sumarizando e agregando os dados
ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty))

# Várias funções eum uma única chamda
ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty),
      sd = sd(cty),
      max = max(cty))

# Sumarizando os dados pela combinação de variáveis/fatores
ddply(data, .(manufacturer, drv),
      summarize,
      avgcty = mean(cty),
      sd = sd(cty),
      max = max(cty))