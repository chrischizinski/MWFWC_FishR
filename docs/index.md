Getting ready for the workshop
================

Midwest 2017: Introduction to Fisheries Analyses with R
-------------------------------------------------------

This is a half-day course for fisheries professionals and students interested in fisheries-specific analysis. This introductory-to-intermediate course will familiarize participants with popular data wrangling (`tidyR` and `dplyr`) and plotting (`ggplot2`) packages in R. We will cover age comparisons, size structure, weight-length relationships, condition, length-at-age, mortality, and individual growth through coding exercises. Participants in the course should be familiar with some of R basics like importing data, loading libraries, and basic mathematical operations. Participants should come to the course with R and RStudio installed on a laptop.

I would like participants to take a short survey prior to coming to the workshop to help me gauge what materials you would like emphasized and to see where everyone is starting from. If you have not already completed the survey, please follow this [link](https://docs.google.com/forms/d/e/1FAIpQLSc3kac_FjhhYY9ST1liyyim50BxHQz9Jbs5TiIpDobf8ZUQbg/viewform) to take the survey.

Getting ready for the workshop.
-------------------------------

There are a couple things you **NEED** to do, prior to our workshop. Please follow the 5 required steps prior to our workshop. If you have any errors, please email me the error message or problem and I will do my best to help.

**NOTE**: depending on the computer you are using, you may need to get your IT folks to update your software prior to the workshop because installing/updating R and RStudio will require admin priveliges.

If you are brand new to R and need an introduction to R and RStudio, there are several resources available to you.

-   I have a one-hour webinar for a workshop ([A very basic introduction to R](https://www.youtube.com/watch?v=ganWW0tM4Qg)) that I gave to OFWIM last semester. This will go over installation of R and RStudio, basic background on R, descriptions of the console and script files, and the numerous ways to find help with R. I am going to be operating under the understanding at the workshop that you have already opened RStudio, know the difference between the console and script files, and have run some basic operations ([Data structure webinar](https://www.youtube.com/watch?v=O9m9tyf4G_8)).
-   There is a good tutorial from [Data Carpentry](http://www.datacarpentry.org/semester-biology/readings/R-intro/)
-   There is also a good short introduction from [Data Camp](https://www.datacamp.com/courses/free-introduction-to-r)
-   You will find lots of others by googling "intro to R course"

### 1. Install or updated to the most recent version of R.

Please install the most recent version (v &gt; 3.3.0) of [R](https://cran.r-project.org/). Please choose the appropriate link depending on your operating system. If you already have R installed and are unsure what version you are running please type `R.Version()` in the console and hit return.

``` r
R.Version()
```

You should see something similar to this returned in your console:

    ## $platform
    ## [1] "x86_64-apple-darwin13.4.0"
    ## 
    ## $arch
    ## [1] "x86_64"
    ## 
    ## $os
    ## [1] "darwin13.4.0"
    ## 
    ## $system
    ## [1] "x86_64, darwin13.4.0"
    ## 
    ## $status
    ## [1] ""
    ## 
    ## $major
    ## [1] "3"
    ## 
    ## $minor
    ## [1] "3.2"
    ## 
    ## $year
    ## [1] "2016"
    ## 
    ## $month
    ## [1] "10"
    ## 
    ## $day
    ## [1] "31"
    ## 
    ## $`svn rev`
    ## [1] "71607"
    ## 
    ## $language
    ## [1] "R"
    ## 
    ## $version.string
    ## [1] "R version 3.3.2 (2016-10-31)"
    ## 
    ## $nickname
    ## [1] "Sincere Pumpkin Patch"

The line that states `$version.string` will tell you what version your computer currently has installed. Mine states R version 3.3.2 (2016-10-31).

### 2. Install or update to the most recent version of RStudio.

Please install the most recent version (v &gt; 1.0) of [RStudio](https://www.rstudio.com/). If you already have RStudio installed and are unsure, you can check the version of RStudio by clicking on the "Help" menu at the top of your RStudio window, and then click "About RStudio".
![Rstudio Version 1](/MWFWC_FishR/figs/Rstudio_version_1.png)

The version will be right below RStudio at the top.

![Rstudio Version 2](/MWFWC_FishR/figs/Rstudio_version_2.png)

### 3. Create a directory to store your R packages.

There a couple of benefits for doing this. The biggest is that if you upgrade your version of R, you do not need to re-install all your R packages. You can create this directory via File Explorer on PC and Finder on Mac.

You can also create this new directory through R. To do this, you will use the `mkdirs()` function in the `R.utils` package (**NOTE**:  you will need to install this package with `install.packages("R.utils")`). You will need to provide a path to the folder that you would like the directory installed. **NOTE 1**: If you create your directory using File Explorer or Finder, there is no need to run the below code and you can skip to 4. **NOTE 2**: on PC you will need to use `\\` or `/` to differentiate between sub-directories and on Mac you will need to use `/`. **NOTE 3**: You will need to customize the path below based on where you want to install your packages. I am creating a folder called `RLibrary3` in my `Documents` folder.

``` r
R.utils::mkdirs('/Users/cchizinski2/Documents/RLibrary3', mustWork=TRUE)
```

    ## [1] FALSE

You should see a `TRUE` printed in the console. If you see `FALSE`, the directory was not created. You may want to double check that the path is correct or double-check that you had not already created it before.

### 4. Install required R packages for the workshop.

Please install the packages `tidyverse`, `readr`, `lubridate`, and `FSA`. The first thing you are going to want to do is set your Library path to the directory you created in <span style="color:dodgerblue">step 3</span>.

``` r
.libPaths('Documents/RLibrary3')
```

And then install the packages using the code:

``` r
install.packages(c('tidyverse','lubridate','stringr','FSA'))
```

And then load the packages using the code:

``` r
library(FSA)
library(stringr)
library(lubridate)
library(tidyverse)
```

If the packages, load correctly you should see the following information in your console. **NOTE**: Do not worry about the warnings about conflicting `tidy packages` for this workshop.

    ## ## FSA v0.8.11. See citation('FSA') if used in publication.
    ## ## Run fishR() for related website and fishR('IFAR') for related book.

    ## 
    ## Attaching package: 'lubridate'

    ## The following object is masked from 'package:base':
    ## 
    ##     date

    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## as.difftime(): lubridate, base
    ## date():        lubridate, base
    ## filter():      dplyr, stats
    ## intersect():   lubridate, base
    ## lag():         dplyr, stats
    ## setdiff():     lubridate, base
    ## union():       lubridate, base

### 5. Check that the required packages are installed correctly

Please take the code in the gray boxes and copy and paste into your console and hit return. If you would rather, you can download and R script with all the steps to help you get read [here](https://raw.githubusercontent.com/chrischizinski/MWFWC_FishR/master/CoursePrep/R/2017-01-30-PrepRscript.R). **NOTE**: You do not need to understand all the below code, we will be going through this in the workshop, but I would like you to make sure all the packages are installed and running.

#### FSA()

After loading the libraries above, run the below code in the console.

``` r
yepdf <- data.frame(yepmm=c(100,150,200), species=rep("Yellow Perch",3))

psdCalc(~yepmm,data=yepdf,species="Yellow perch",digits=1)
```

This should be produced.

    ## Warning: Some category sample size <20, some CI coverage may be
    ##  lower than 95%.

    ##         Estimate 95% LCI 95% UCI
    ## PSD-Q         50       0     100
    ## PSD S-Q       50       0     100
    ## PSD Q-P       50       0     100

#### stringr()

After loading the libraries above, run the below code in the console.

``` r
date_split<-str_split_fixed("2005-05-02T00:00:00-05:00", "T",2)
date_split
```

This should be produced.

    ##      [,1]         [,2]            
    ## [1,] "2005-05-02" "00:00:00-05:00"

#### lubridate()

After loading the libraries above, run the below code in the console.

``` r
ymd(date_split[,1])
```

This should be produced.

    ## [1] "2005-05-02"

#### readr()

After loading the libraries above, run the below code in the console.

``` r
read_csv("https://raw.githubusercontent.com/chrischizinski/MWFWC_FishR/master/CourseMaterial/data/fish_sample.csv")
```

This should be produced.

    ## Parsed with column specification:
    ## cols(
    ##   surveydate = col_datetime(format = ""),
    ##   Station = col_integer(),
    ##   SpeciesCode = col_integer(),
    ##   LengthGroup = col_integer(),
    ##   FishCount = col_integer()
    ## )

    ## # A tibble: 10 × 5
    ##             surveydate Station SpeciesCode LengthGroup FishCount
    ##                 <dttm>   <int>       <int>       <int>     <int>
    ## 1  2015-05-12 05:00:00       3         770         240         7
    ## 2  2015-05-12 05:00:00       2         770         260         4
    ## 3  2015-05-12 05:00:00       3         770         270         8
    ## 4  2015-05-12 05:00:00       1         770         240         1
    ## 5  2015-05-12 05:00:00       3         770         300         3
    ## 6  2015-05-12 05:00:00       1         770         380         1
    ## 7  2015-05-12 05:00:00       3         770         210         4
    ## 8  2015-05-12 05:00:00       2         770         280         5
    ## 9  2015-05-12 05:00:00       1         770         200         3
    ## 10 2015-05-12 05:00:00       2         770         460         1

#### tidyverse()

After loading the libraries above, run the below code in the console.

``` r
mini_iris <- iris[c(1, 51, 101), ]

mini_iris %>% 
  gather(key = flower_att, value = measurement, -Species) %>% 
  group_by(Species, flower_att) %>%
  summarise(Mean_measure = mean(measurement)) %>% 
  ggplot() +
  geom_bar(aes(x = Species, y = Mean_measure, fill = flower_att), stat="identity") +
  facet_wrap(~flower_att)
```

This should produce a figure that looks like this.

![](/MWFWC_FishR/figs/unnamed-chunk-17-1.png)
