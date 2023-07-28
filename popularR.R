setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# R version 3.4.3 (2017-11-30) -- "Kite-Eating Tree"
# Copyright (C) 2017 The R Foundation for Statistical Computing
# Platform: x86_64-w64-mingw32/x64 (64-bit)

# update 1: on April 5, 2020 to add novel number of contributed packages from https://cran.r-project.org/web/packages/
# update 2: on August 16, 2022 to add missing numbers and adding changes to the graph appearance
# update 3: on July 28, 2023 to add missing numbers and adding changes to the graph appearance

library(ggplot2)

# dates when number of CRAN packages was checked
dates = c('2017-02-10', '2018-02-17', '2019-02-20', '2020-04-05', '2021-03-01', '2022-08-16', '2023-07-28')
dates <- as.Date(dates)
dates

# number of packages corresponding to dates
numberOfPackages = c(10065, 12162, 13741, 15514, 17214, 18442, 19880)

# creating data frame
d = list()
d$numberOfPackages = numberOfPackages
d$dates = dates
d = data.frame(d)
d

# plotting bar graph
p <- ggplot(data=d, aes(x = dates, y = numberOfPackages)) +
  geom_bar(stat="identity")
p
p + theme_minimal() + coord_flip() +
  ggtitle('CRAN packages') + ylab('number of packages') + xlab('year') +
  geom_text(aes(label=dates), hjust=1.3, col = "white")
p
# saving image
ggsave("numberOfPackages.jpg", width = 10.5, height = 6, dpi=400)
