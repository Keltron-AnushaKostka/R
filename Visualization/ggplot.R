#ggplot2

#Example 1
#relationship between wages (wage) and experience (expr)

#load data
data(CPS85, package = "mosaicData")

library(ggplot2)
ggplot(data = CPS85, mapping = aes(x = exper, y = wage))


ggplot(data = CPS85, mapping = aes(x = exper, y = wage)) + geom_point()


#delete outlier
library(dplyr)
plotData <- filter(CPS85, wage < 85) 



#redraw scatterplot
ggplot(data = plotData, mapping = aes(x = exper, y = wage)) + geom_point()

# make points blue, larger and semi-transparent
ggplot(data = plotData, mapping = aes(x = exper, y = wage)) + geom_point(color = 'CornFlowerBlue',
                                                                         alpha = 0.7,
                                                                         size = 3)

# add a line of best_fit
ggplot(data = plotData, mapping = aes(x = exper, y = wage)) + geom_point(color = 'CornFlowerBlue',
                                                                         alpha = 0.7,
                                                                         size = 3) +
  geom_smooth(method = "lm")


#indicate sex using color
ggplot(data = plotData, mapping = aes(x = exper, y = wage, color = sex)) + geom_point(color = 'CornFlowerBlue',
                                                                         alpha = 0.7,
                                                                         size = 3) +
  geom_smooth(method = "lm",
              se = FALSE,
              size = 1.5)


# modify x and y coordinates and specify the colors to be used
ggplot(data = plotData, mapping = aes(x = exper, y = wage, color = sex)) + geom_point(color = 'CornFlowerBlue',
                                                                                      alpha = 0.7,
                                                                                      size = 3) +
  geom_smooth(method = "lm",
              se = FALSE,
              size = 1.5) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5), 
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3", "cornFlowerBlue"))


#reproduce plot for each sector
ggplot(data = plotData,
       mapping = aes(x = exper,
                     y = wage,
                     color = sex)) +
  
  geom_point(alpha = .7) +
  geom_smooth(method = "lm",
              se = FALSE) +
  
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3",
                                "cornflowerblue")) +
  
  facet_wrap(~sector) 

#labels
ggplot(data = plotData,
mapping = aes(x = exper,
              y = wage,
              color = sex)) +
  
  geom_point(alpha = .7) +
  geom_smooth(method = "lm",
              se = FALSE) +
  
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3",
                                "cornflowerblue")) +
  
  facet_wrap(~sector) + 
  labs(title = "Relationship between wages and experience",
       subtitle = "Current Population Survey",
       caption = "source: http://mosaic-web.org/",
       x = " Years of Experience",
       y = "Hourly Wage",
       color = "Gender")


#themes
ggplot(data = plotData,
       mapping = aes(x = exper,
                     y = wage,
                     color = sex)) +
  
  geom_point(alpha = .7) +
  geom_smooth(method = "lm",
              se = FALSE) +
  
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3",
                                "cornflowerblue")) +
  
  facet_wrap(~sector) + 
  labs(title = "Relationship between wages and experience",
       subtitle = "Current Population Survey",
       caption = "source: http://mosaic-web.org/",
       x = " Years of Experience",
       y = "Hourly Wage",
       color = "Gender") + 
  theme_minimal()


#placing color mapping in ggplot function
ggplot(data = plotData,
       mapping = aes(x = exper,
                     y = wage,
                     color = sex)) +
  
  geom_point(alpha = .7) +
  geom_smooth(method = "lm",
              formula = y ~ poly(x,2), 
              se = FALSE)

#placing color mapping in the goem point
ggplot(plotData,
       aes(x = exper,
           y = wage)) +
  geom_point(aes(color = sex),
             alpha = .7,
             size = 3) +
  geom_smooth(method = "lm",
            formula = y ~ poly(x,2),
            se = FALSE,
            size = 1.5)


# Graphs as Objects
# prepare data
data(CPS85 , package = "mosaicData")
plotdata <- CPS85[CPS85$wage < 40,]

# create scatterplot and save it
myplot <- ggplot(data = plotdata,
                 
                 aes(x = exper, y = wage)) +
  geom_point()

# print the graph
myplot
# make the points larger and blue
# then print the graph
myplot <- myplot + geom_point(size = 3, color = "blue")
myplot
# print the graph with a title and line of best fit
# but don't save those changes
myplot + geom_smooth(method = "lm") +
  labs(title = "Mildly interesting graph")
# print the graph with a black and white theme
# but don't save those changes
myplot + theme_bw()

