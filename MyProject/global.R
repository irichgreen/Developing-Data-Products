# Coursera Developing Data Product
# Peer Assignment Project
# by Jin-Hoon An (Apr, 26, 2015)
## @knitr global.R

get_gdoc <- function(url){
  require(RCurl)
  s = getURLContent(url)
  read.csv(textConnection(s))
}

durl <- "http://irichgreen.github.io/EmploymentSharesBlogRemake.csv"

dat <- get_gdoc(durl)
dat2 <- reshape(dat, varying = names(dat)[2:35], direction = 'long', timevar = "year")
dat2m <- reshape2::melt(dat2, id = c(1:3, 6))
dat2m <- na.omit(transform(dat2m, value = as.numeric(as.character(value))))
names(dat2m) <- c('country', 'countrycode', 'year', 'id', 'gender', 'value')
