# R version 3.4.3 (2017-11-30) -- "Kite-Eating Tree"
# Copyright (C) 2017 The R Foundation for Statistical Computing
# Platform: x86_64-w64-mingw32/x64 (64-bit)

# update 1: on April 5, 2020 to add novel number

library(ggplot2)

# dates when number of CRAN packages was checked
dates = c('2017-02-10', '2018-02-17', '2019-02-20', '2020-04-05')
dates <- as.Date(dates)
dates

# number of packages corresponding to dates
numberOfPackages = c(10065, 12162, 13741, 15514)

# creating data frame
d = list()
d$numberOfPackages = numberOfPackages
d$dates = dates
d = data.frame(d)
d

# plotting bar graph
p <- ggplot(data=d, aes(x = dates, y = numberOfPackages)) +
  geom_bar(stat="identity")
p + coord_flip(ylim = c(0, 16000)) + theme_minimal() +
  scale_y_discrete(limits = numberOfPackages) +
  ggtitle('CRAN packages') + ylab('number of packages') + xlab('year')

# saving image
ggsave("brojPaketa.tiff", dpi=300)
