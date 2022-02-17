# Pie Chart - Gráfico de Pizza

# Criando fatias
fatias = c(40,20,40)

# Nomeando os labels
paises = c('Brasil','Argentina','Chile')

# Unindo fatias e países
paises = paste(paises,fatias)
paises

# Incluindo detalhes no label
paises = paste(paises,'%',sep = '')
paises

colors()

# Construindo um gráfico
pie(fatias,labels = paises,
    col = c('darksalmon','gainsboro','lemonchiffon4'),
    main = 'Distribuição de Vendas')

# Trabalhando com dataframes
attach(iris)
values = table(Species)
labels = paste(names(values))
pie(values,labels = labels,main = 'Distribuição de Espécies')