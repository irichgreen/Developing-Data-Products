---
title       : Slidify
subtitle    : Developing Data Products Project Assignments 2
author      : Jin-Hoon An (Apr. 26, 2015)
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



```
## Loading required package: knitr
```


<style>
p {
  text-align: justify;
}
body {
 background-image: url(libraries/frameworks/minimal/images/light_wool.png)
}
</style>

## Data

The data was collected by the International Labor Organization. I used a version of the dataset put together by the excellent data visualization blog: [thewhyaxis](http://thewhyaxis.info/gap-remake/). 


```
         country countrycode year id gender value
1           OECD        OECD 1995  1    Men   9.4
3        Austria         AUT 1995  3    Men   9.5
4        Belgium         BEL 1995  4    Men  12.2
5         Canada         CAN 1995  5    Men  13.2
7 Czech Republic         CZE 1995  7    Men   8.0
8        Denmark         DNK 1995  8    Men   9.6
```

* Creating an interactive visualization


```r
require(devtools)
install_github('ramnathv/rCharts')
```

 


--- .class #id 

## Bar Plot Process

Now recreate the bar plot shown in the visualization.

<div id='chart1'></div>


```r
require(rCharts)
YEAR = 2011

men   <- subset(dat2m, gender == "Men" & year == YEAR)
women <- subset(dat2m, gender == "Women" & year == YEAR)
p1 <- rPlot(x = list(var = "countrycode", sort = "value"), y = "value", 
  color = 'gender', data = women, type = 'bar')
p1$layer(x = "countrycode", y = "value", color = 'gender', 
  data = men, type = 'point', size = list(const = 3))

p1$guides(x = list(title = "", ticks = unique(men$countrycode)))
p1$guides(y = list(title = "", max = 18))
p1$addParams(width = 900, height = 800, dom = 'chart1',
  title = "% of Employed who are Senior Managers")
```

--- .class #id 

## Bar Plot


```r
p1
```

<iframe src=' assets/fig/chart1_1-1.html ' scrolling='no' frameBorder='0' seamless class='rChart polycharts ' id=iframe- chart1 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

--- .class #id 

## Line Chart

We can now add a line chart for comparing the values for a specific country across years. We follow the same approach outlined above, except that we only need a single layer in this case.

<div id='chart2'></div>



```r
COUNTRY = "Korea"
country = subset(dat2m, country == COUNTRY)
p2 <- rPlot(value ~ year, color = 'gender', type = 'line', data = country)
p2$addParams(width = 900, height = 800, dom = 'chart2')
p2$guides(y = list(min = 0, title = ""))
p2
```

<iframe src=' assets/fig/chart2-1.html ' scrolling='no' frameBorder='0' seamless class='rChart polycharts ' id=iframe- chart2 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>
