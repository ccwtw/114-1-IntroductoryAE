library(ggplot2)
library(gapminder)
library(dplyr)
library(data.table)
options(scipen = 10)

df <- gapminder
glimpse(df)


ggplot(data = df) + geom_point(mapping = aes(x = gdpPercap, y = lifeExp))


p + geom_hline(aes(yintercept = mean(lifeExp), color = "red"))


# collapse

df1 <- df %>% group_by(year, continent) %>%
  summarize(lifeExp = mean(lifeExp, na.rm = T),
            pop = mean(pop, na.rm = T),
            gdpPercap = mean(gdpPercap, na.rm = T), .groups = "keep")
df1 <- df %>% group_by(year, continent) %>%
  summarize(across(lifeExp:gdpPercap, mean), .groups = "keep")

library(ggplot2)
library(gapminder)
library(dplyr)
df <- gapminder_unfiltered
t <- df %>% group_by(year) %>% 
  filter(country == 'Taiwan')
# HW1
df %>% group_by(year) %>% 
  filter(country == 'Taiwan') %>% 
  summarise(pp = sum(pop)) %>%
  ggplot() + geom_point(aes(x = year, y = pp)) 


df %>% group_by(year) %>% 
  filter(country == 'Taiwan') %>% 
  summarise(pp = sum(pop)) %>%
  ggplot() + geom_point(aes(x = year, y = pp/1E6)) +
  ylab('popuiation(millions)')