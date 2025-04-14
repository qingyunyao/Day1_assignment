
#installing and initializing packages
install.packages("tidyverse")
install.packages("ggplot2")
devtools::install_github("kassambara/ggpubr")
library("tidyverse")
library("ggplot2")
library("ggpubr")

#load data
data(iris)

head(iris)
summary(iris)
str(iris)

#manipulate data
df <- as_tibble(iris)
df

filter(df, Species == "setosa")
help('arrange')
arrange(df, Sepal.Length, desc(Sepal.Width))

df %>%
  group_by(Species) %>%
  summarise(mean(Sepal.Length))

#ggplot

Sepal_fig <- ggplot(data=df, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species) ) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")
Petal_fig <- ggplot(data=df, aes(x = Petal.Length, y = Petal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Petal Length") +
  ylab("Petal Width") +
  ggtitle("Petal Length-Width")
ggarrange(Sepal_fig, Petal_fig, labels = c("A","B"), ncol=1, nrow=2)