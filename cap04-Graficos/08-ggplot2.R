# ggplot2

# Sistema gráfico completo

# https://cran.r-project.org/web/packages/ggplot2/ggplot2.pdf

# Instalando e carregando o pacote
iinstall.packages('ggplot2')
library(ggplot2)

# Plotando um gráfico básico com qplot()
data(tips,package = 'reshape2')
View(tips)
qplot(total_bill,tip,data = tips,geom = 'point')

# Camada 1
camada1 <- geom_point(mapping = aes(x = total_bill,y = tip,color = sex),
                      data = tips,
                      size = 3)
ggplot() + camada1

?aes

# Construindo um modelo de regressão
modelo_base <- lm(tip ~ total_bill,data = tips,)
modelo_fit <- data.frame(
  total_bill = tips$total_bill,
  predict(modelo_base,interval = 'confidence')
)
head(modelo_fit)

# Camada 2
camada2 <- geom_line(mapping = aes(x = total_bill,y = fit),
                    data = modelo_fit,
                    color = 'darkred')
ggplot() + camada1 + camada2

# Camada 3
camada3 <- geom_ribbon(mapping = aes(x = total_bill,ymin = lwr,ymax = upr),
                       data = modelo_fit,
                       alpha = 0.3)
ggplot() + camada1 +camada2 + camada3

# Versão final otimizada - Tudo o que foi feito com os comando anteriores, pode ser feito dessa forma
ggplot(tips,aes(x = total_bill,y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')

# Gravando um gráfico em um objeto
myplot <- ggplot(tips,aes(x = total_bill,y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')

class(myplot)
print(myplot)
myplot

# ScatterPlot com linha de regressão
data = data.frame(cond = rep(c('obs1','obs2'),
                          each = 10), var1 = 1:100 +
                          rnorm(100,sd = 9),var2 = 1:100 +
                          rnorm(100,sd = 16))

data

# Plot
ggplot(data,aes(x = var1,y = var2)) +
       geom_point(shape = 1) +
       geom_smooth(method = lm,color = 'red',se = FALSE)

# BarPlot

# Dados
data = data.frame(grupo = c('a','b','c','d'),
                  valor = c(33,62,56,67),
                  num_obs = c(100,500,459,342))

# Gerando a massa de dados
data$right = cumsum(data$num_obs) + 30 * c(0:(nrow(data)-1))
data$left = data$right - data$num_obs

# Plot
ggplot(data,aes(ymin = 0)) +
  geom_rect(aes(xmin = left,xmax = right,
                ymax = valor,colour = grupo,fill = grupo)) +
                xlab('Número de Observações') + ylab('valor')

# Usando o mtcars
head(mtcars)
ggplot(data = mtcars,aes(x = disp,y = mpg)) + geom_point()

# outro aspecto que pode ser mapeado nesse gráfico é a cor dos pontos
ggplot(data = mtcars,aes(x = disp,y = mpg,color = as.factor(am))) + geom_point()

# No entanto, também podemos mapear uma variável contínua à cor dos pontos
ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl, size = wt)) + geom_point()

# Também podemos mapear o tamanho dos pontos à uma variável de interesse:
# A legenda é inserida no gráfico automaticamente
ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl, size = wt)) + geom_point()

# Os geoms definem qual forma geométrica será utilizada para a visualização dos dados no gráfico
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) + geom_boxplot()

# Histograma
ggplot(mtcars , aes(x = mpg), binwidth = 30) + geom_histogram()

# Gráfico de Barras
ggplot(mtcars, aes(x = as.factor(cyl))) + geom_bar()

# Personalizando os gráficos
colors()

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg,
                   colour = as.factor(cyl))) + geom_boxplot()

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg,
                   fill = as.factor(cyl))) + geom_boxplot()

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) +
  geom_boxplot(color = 'blue', fill = 'seagreen')

# Podemos alterar os eixos
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram() +
  xlab('Milhas por Galão') + ylab('Frequência')

# Legendas
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) +
  geom_bar() +
  labs(fill = 'cyl')

# Trocando a posição da legenda
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) +
  geom_bar() +
  labs(fill = 'cyl') +
  theme(legend.position = 'top')

# Sem legenda
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) +
  geom_bar() +
  guides(fill = F)

# Facets
ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) +
  geom_point() +
  facet_grid(am~.)

ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) +
  geom_point() +
  facet_grid(.~am)

# Plots diferentes juntos (diferente de facet)
install.packages('gridExtra')
library(gridExtra)
library(ggplot2)

# Dataset diamonds
data(diamonds)

# Histograma com0 plot1
plot1 <- qplot(price, data = diamonds, binwidth = 1000)

# Histograma como plot2
plot2 <- qplot(carat, price, data = diamonds, colour = cut)

# Combina os dois plots na mesma área
grid.arrange(plot1, plot2, ncol = 1)

# Gráficos de densidade
ggplot(data = diamonds, aes(x = price, ggroup = cut, fill = cut)) +
  geom_density(adjust = 1.5)

ggplot(data = diamonds, aes(x = price, ggroup = cut, fill = cut)) +
  geom_density(adjust = 1.5, alpha = 0.2)

ggplot(data = diamonds, aes(x = price, ggroup = cut, fill = cut)) +
  geom_density(adjust = 1.5, position = 'fill')

# Facets com reshape
install.packages("reshape2")
install.packages("plotly")
library(reshape2)
library(plotly)

sp <- ggplot(tips, aes(x = total_bill, y = tip/total_bill)) + geom_point(shape = 1)
sp + facet_grid(sex ~ .)
ggplotly()
sp + facet_grid(. ~ sex)
ggplotly()
sp + facet_wrap( ~ day, ncol = 2)
ggplotly()


ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~manufacturer)
ggplotly()