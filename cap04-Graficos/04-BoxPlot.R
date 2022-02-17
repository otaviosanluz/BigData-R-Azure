# Boxplots

# Anexando o dataset
attach(sleep)

# Boxplort
sleepbpxplot = boxplot(data = sleep,extra ~ group,
                       main = 'Duração do Sono',
                       col.main = 'red',ylab = 'Horas',xlab = 'Droga')

# Calculo da média
medias = by(extra,group,mean)

# Adiciona as médias no gráfico
points(medias,col = 'red')

# Boxplot na horizontal
horizontalbpxplot = boxplot(data = sleep,extra ~ group,
                       main = 'Duração do Sono',
                       col.main = 'red',ylab = 'Horas',xlab = 'Droga',
                       horizontal = T)
# Adicionando cores
horizontalbpxplot = boxplot(data = sleep,extra ~ group,
                            main = 'Duração do Sono',
                            col.main = 'red',ylab = 'Horas',xlab = 'Droga',
                            horizontal = T,col = c('red','blue'))
