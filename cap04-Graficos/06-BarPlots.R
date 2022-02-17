# Bar Plot - Gráficos de Barra

# Preparando os dados - Número de casamentos em um igreja de SP
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,237,106,67),nrow = 3,byrow = T)
dados

# Nomeando linhas e colunas da matriz
colnames(dados) <- c('0','1-150','151-300','>300')
rownames(dados) <- c('jovem','adulto','idoso')
dados

# Construindo o BarPLot
barplot(dados,beside = T)
barplot(dados) # gráfico de barras empilhado

# Construindo o plot - Stacked Bar Plot
# As 3 faixas de idade são representadas na mesma coluna para as diferentes quantidades
?barplot
barplot(dados,col = c('red','blue','black'))


# Crie uma legenda para o gráfico anterior
colors()
barplot(dados,col = c('red','blue','black'),legend.text = c('jovem','adulto','idoso'))

# Agora temos uma coluna para cada faixa etária, mas na mesma faixa de quantidade
barplot(dados,beside = T,col = c('red','blue','black'),legend.text = c('jovem','adulto','idoso'))

# Com a transposta da matriz, invertemos as posições entre faixa etária e faixa de quantidade
barplot(t(dados),beside = T,col = c('red','blue','black','green'),legend.text = c('0','1-150','151-300','>300'))