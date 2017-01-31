#  Midwest 2017:  Introduction to Fisheries Analysis in R
# Christopher J Chizinski
# January 30, 2017

#  Preliminary information

R.Version() # Check the version of R you are using

R.utils::mkdirs('"path/to/directory', mustWork=TRUE)  # Create your library directory

.libPaths("path/to/directory")  # path/to/directory should match the one created above
install.packages(c("tidyverse", "lubridate", "stringr","FSA"))

library(FSA)
library(lubridate)
library(stringr)
library(tidyverse)

## Check FSA
yepdf <- data.frame(yepmm=c(100,150,200), species=rep("Yellow Perch",3))

psdCalc(~yepmm,data=yepdf,species="Yellow perch",digits=1)

## Check stringr
date_split<-str_split_fixed("2005-05-02T00:00:00-05:00", "T",2)
date_split

## Check lubridate
ymd(date_split[,1])

## Check readr
read_csv("https://raw.githubusercontent.com/chrischizinski/MWFWC_FishR/master/CourseMaterial/data/fish_sample.csv")

## Check tidyverse
mini_iris <- iris[c(1, 51, 101), ]

mini_iris %>% 
  gather(key = flower_att, value = measurement, -Species) %>% 
  group_by(Species, flower_att) %>%
  summarise(Mean_measure = mean(measurement)) %>% 
  ggplot() +
  geom_bar(aes(x = Species, y = Mean_measure, fill = flower_att), stat="identity") +
  facet_wrap(~flower_att)