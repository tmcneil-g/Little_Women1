# GGplot 2 lesson
# Torbet McNeil
# tmcneil@arizona.edu
# 2024-02-18

?ggplot2
# practice exercise
# example


library("ggplot2")
gapminder <- read.csv("data/gapminder_data.csv")
ggplot(data=gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()

ggplot(data=gapminder, mapping = aes(x = year, y = lifeExp, group=country)) +
  geom_line(mapping = aes(color=continent)) + geom_point()

ggplot(data=gapminder, mapping = aes(x = year, y = lifeExp, group=country)) +
  geom_point() + geom_line(mapping = aes(color=continent)) 

ggplot(data=gapminder, mapping = aes(x = gdpPercap, 
                                     y = lifeExp)) + geom_point(alpha = 0.5) + scale_x_log10() +
  geom_smooth(method="lm", size=1.5)

# Multi-panel figures
americas <- gapminder[gapminder$continent=="Americas",]

lifeExp_plot <- ggplot(data=americas, mapping = aes(x = year, y = lifeExp, 
                                                    color=continent)) + geom_line() +
  facet_wrap(~country) +
  labs(
    x="Year",   # x axis title
    y="Life expectancy",   # y axis title
    title="Figure 1",    # main title of figure
    color="Continent"   # title of legend
  ) +
  theme(axis.text.x=element_text(angle = 90, hjust =1))
theme(axis.text.x=element_text(angle=45))

# Exporting the plot
ggsave(filename="output/lifeExp.png", plot = lifeExp_plot, 
       width = 12, height = 10, dpi = 300, units = "cm")
