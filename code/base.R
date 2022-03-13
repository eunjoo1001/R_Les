## Vector
x <- c(1, 2, 3, 4, 5, 6)            ## vector of variable
y <- c(7, 8, 9, 10, 11, 12)
x + y                                  
x * y
sqrt(x)                            ## root
sum(x)                                
diff(x)                            ## difference
mean(x)                            ## mean  
var(x)                             ## variance
sd(x)                              ## standard deviation
median(x)                          ## median
IQR(x)                             ## inter-quantile range
max(x)                             ## max value
which.max(x)                       ## order of max value
max(x, y)                          ## max value among x & y
length(x)                          



## Slice
x[2]                               ## 2 π¯¬∞
x[-2]                              ## 2 π¯¬∞∏∏ ª©∞Ì
x[1:3]                             ## 1-3 π¯¬∞
x[c(1, 2, 3)]                      ## µø¿œ 
x[c(1, 3, 4, 5, 6)]                ## 1, 3, 4, 5, 6 π¯¬∞
x >= 4                             ## ∞¢ «◊∏Ò¿Ã 4 ¿ÃªÛ¿Œ¡ˆ TRUE/FALSE
sum(x >= 4)                        ## TRUE 1, FALSE 0 ¿ŒΩƒ 
x[x >= 4]                          ## TRUE ¿Œ ∞ÕµÈ∏∏, ¡Ô 4 ¿ÃªÛ¿Œ ∞ÕµÈ         
sum(x[x >= 4])                     ## 4 ¿ÃªÛ¿Œ ∞ÕµÈ∏∏ ¥ı«œ±‚ 
x %in% c(1, 3, 5)                  ## 1, 3, 5 ¡ﬂ «œ≥™ø° º”«œ¥¬¡ˆ TRUE/FALSE
x[x %in% c(1, 3, 5)]               



## Make vector
v1 <- seq(-5, 5, by = .2); v1             ## Sequence
v2 <- rep(1, 3); v2                       ## Repeat
v3 <- rep(c(1, 2, 3), 2); v3              ## Repeat for vector
v4 <- rep(c(1, 2, 3), each = 2); v4       ## Repeat for vector : each



## for
for (i in 1:3){
  print(i)
}

i <- 0
for (j in c(1, 2, 4, 5, 6)){
  i <- i + j
}
i


## if/else
x <- 5
if (x >= 3 ){
  x <- x + 3
}
x

x <- 5
if (x >= 10){
  print("High")
} else if (x >= 5){
  print("Medium")
} else {
  print("Low")
}       


## ifelse
x <- 1:6
y <- ifelse(x >= 4, "Yes", "No")         ## ifelse (¡∂∞«,¬¸¿œ∂ß,∞≈¡˛¿œ∂ß)
y



## function
x <- c(1:10, 12, 13, NA, NA, 15, 17)      ## Í≤∞Ï∏°ÏπòÍ?Ä ?è¨?ï®?êò?ñ¥ ?ûà?ã§Î©?..
mean(x)                                           
mean0 <- function(x){
  mean(x, na.rm = T)
}                                         ## mean?ï®?àò?ùò na.rm ?òµ?Öò?ùÑ TRUEÎ°? Î∞îÍøà. default?äî F

mean0 <- function(x){mean(x, na.rm = T)}  ## ?ïúÏ§ÑÏóê ?ì∏ ?àò?èÑ ?ûà?ã§. 
mean0(x)


twomean <- function(x1, x2){
  a <- (x1 + x2)/2
  a
}
twomean(4, 6)



## Apply: apply, sapply, lapply
mat <- matrix(1:20, nrow = 4, byrow = T)   ## 4?ñâ 5?ó¥, byrow = T : ?ñâÎ∂Ä?Ñ∞ Ï±ÑÏö¥?ã§. 
mat

out <- NULL                                ## Îπ? Î≤°ÌÑ∞, ?ó¨Í∏∞Ïóê ?ïò?Çò?î© Î∂ôÏó¨?Ñ£?äî?ã§.
for (i in 1:nrow(mat)){
  out <- c(out, mean(mat[i, ]))
}
out

sapply(1:nrow(mat), function(x){mean(mat[x, ])})             ## Return vector
lapply(1:nrow(mat), function(x){mean(mat[x, ])})             ## Return list type
unlist(lapply(1:nrow(mat), function(x){mean(mat[x, ])}))     ## Same to sapply
#parallel::mclapply(1:nrow(mat), function(x){mean(mat[x, ])}, mc.cores = 4)           ## Multicore

apply(mat, 1, mean)                                          ## 1: ?ñâ
rowMeans(mat)                                                ## ?èô?ùº
rowSums(mat)                                                 ## ?ñâÎ≥ÑÎ°ú ?ï©

apply(mat, 2, mean)                                          ## 2: ?ó¥
colMeans(mat)                                                ## ?ó¥Î≥ÑÎ°ú ?ï©



## Practice 1
x <- 1:6
y <- 7:12




## With data
getwd()                                                     ## ?òÑ?û¨ ?îî?†â?Ü†Î¶? 
setwd("data")                                               ## ?îî?†â?Ü†Î¶? ?Ñ§?†ï
## ?èô?ùº
setwd("/cloud/project/data")
getwd()

ex <- read.csv("example_g1e.csv")
head(ex)

ex <- read.csv("https://raw.githubusercontent.com/jinseob2kim/lecture-snuhlab/master/data/example_g1e.csv")
head(ex)


#install.packages(c("readxl", "haven"))                    ## install packages    
library(readxl)                                            ## for xlsx
ex.excel <- read_excel("example_g1e.xlsx", sheet = 1)      ## 1st sheet

library(haven)                                             ## for SAS/SPSS/STATA   
ex.sas <- read_sas("example_g1e.sas7bdat")                 ## SAS
ex.spss <- read_sav("example_g1e.sav")                     ## SPSS
head(ex.spss)

write.csv(ex, "example_g1e_ex.csv", row.names = F)
#write_sas(ex.sas, "example_g1e_ex.sas7bdat")
#write_sav(ex.spss, "example_g1e_ex.sav")


## See data
head(ex)                                                   ## Ï≤òÏùå 6?ñâ
tail(ex)                                                   ## ÎßàÏ?ÄÎß? 6?ñâ
head(ex, 10)                                               ## Ï≤òÏùå 10?ñâ
str(ex)
names(ex)
dim(ex)                                                    ## row, column
nrow(ex)                                                   ## row
ncol(ex)                                                   ## column

class(ex)
class(ex.spss)
summary(ex)



## See variables
ex$EXMD_BZ_YYYY                                            ## data.frame style
ex[, "EXMD_BZ_YYYY"]                                       ## matrix style
ex[["EXMD_BZ_YYYY"]]                                       ## list style
ex[, 1]                                                    ## matrix style with order
ex[[1]]                                                    ## list style with order

ex[, c("EXMD_BZ_YYYY", "RN_INDI", "BMI")]                  ## matrix syle with names
ex[, c(1, 2, 16)]                                          ## matrix syle with names
ex[, names(ex)[c(1, 2, 16)]]                               ## same

ex$EXMD_BZ_YYYY[1:50]                                      ## data.frame style
ex[1:50, 1]                                                ## matrix style
ex[[1]][1:50]                                              ## list style

unique(ex$EXMD_BZ_YYYY)                                   ## unique value
length(unique(ex$EXMD_BZ_YYYY))                           ## number of unique value
table(ex$EXMD_BZ_YYYY)                                    ## table



## New variable
mean(ex$BMI)                                              ## mean
BMI_cat <- (ex$BMI >= 25)                                 ## TRUE of FALSE
table(BMI_cat)                         
rows <- which(ex$BMI >= 25)                               ## row numbers
head(rows)                                      
values <- ex$BMI[ex$BMI >= 25]                            ## values
head(values)
length(values)
BMI_HGHT_and <- (ex$BMI >= 25 & ex$HGHT >= 175)              ## and
BMI_HGHT_or <- (ex$BMI >= 25 | ex$HGHT >= 175)               ## or

ex$zero <- 0                                              ## variable with 0
ex$BMI_cat <- (ex$BMI >= 25)                              ## T/F
ex$BMI_cat <- as.integer(ex$BMI >= 25)                    ## 0, 1
ex$BMI_cat <- as.character(ex$BMI >= 25)                  ## "0", "1"
ex$BMI_cat <- ifelse(ex$BMI >= 25, "1", "0")              ## same
table(ex$BMI_cat)
ex[, "BMI_cat"] <- (ex$BMI >= 25)                         ## matrix style
ex[["BMI_cat"]] <- (ex$BMI >= 25)                         ## list style



## Set class
vars.cat <- c("RN_INDI", "Q_PHX_DX_STK", "Q_PHX_DX_HTDZ", "Q_PHX_DX_HTN", "Q_PHX_DX_DM", "Q_PHX_DX_DLD", "Q_PHX_DX_PTB", 
              "Q_HBV_AG", "Q_SMK_YN", "Q_DRK_FRQ_V09N")
vars.cat <- names(ex)[c(2, 4:12)]                              ## same
vars.cat <- c("RN_INDI", grep("Q_", names(ex), value = T))     ## same: extract variables starting with "Q_"

vars.conti <- setdiff(names(ex), vars.cat)                     ## Exclude categorical variables
vars.conti <- names(ex)[!(names(ex) %in% vars.cat)]            ## same: !- not, %in%- including

for (vn in vars.cat){                                          ## for loop: as.factor
  ex[, vn] <- as.factor(ex[, vn])
}

for (vn in vars.conti){                                        ## for loop: as.numeric
  ex[, vn] <- as.numeric(ex[, vn])
}

summary(ex)

table(as.numeric(ex$Q_PHX_DX_STK))
table(as.numeric(as.character(ex$Q_PHX_DX_STK)))


## Date
addDate <- paste(ex$HME_YYYYMM, "01", sep = "")                ## add day- use `paste`
ex$HME_YYYYMM <- as.Date(addDate, format = "%Y%m%d")           ## set format                  
head(ex$HME_YYYYMM)
class(ex$HME_YYYYMM)



## NA
tapply(ex$LDL, ex$EXMD_BZ_YYYY, mean)                          ## measure/group/function

tapply(ex$LDL, ex$EXMD_BZ_YYYY, 
       function(x){
         mean(x, na.rm = T)
       })    


summary(lm(LDL ~ HDL, data = ex))


## Practice 2
ex.naomit <- na.omit(ex)
nrow(ex.naomit)

getmode <- function(v){
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(ex$Q_PHX_DX_STK)



## Subset
ex1 <- ex.naomit                                               ## simple name
ex1.2012 <- ex1[ex1$EXMD_BZ_YYYY >= 2012, ]
table(ex1.2012$EXMD_BZ_YYYY)

ex1.2012 <- subset(ex1, EXMD_BZ_YYYY >= 2012)                  ## subset
table(ex1.2012$EXMD_BZ_YYYY)


## Group by 
aggregate(ex1[, c("WSTC", "BMI")], list(ex1$Q_PHX_DX_HTN), mean)
aggregate(cbind(WSTC, BMI) ~ Q_PHX_DX_HTN, data = ex1, mean)   ## same

aggregate(cbind(WSTC, BMI) ~ Q_PHX_DX_HTN, data = ex, mean)

aggregate(ex1[, c("WSTC", "BMI")], list(ex1$Q_PHX_DX_HTN, ex1$Q_PHX_DX_DM), mean)
aggregate(cbind(WSTC, BMI) ~ Q_PHX_DX_HTN + Q_PHX_DX_DM, data = ex1, mean)

aggregate(cbind(WSTC, BMI) ~ Q_PHX_DX_HTN + Q_PHX_DX_DM, data = ex1, function(x){c(mean = mean(x), sd = sd(x))})

aggregate(. ~ Q_PHX_DX_HTN  + Q_PHX_DX_DM, data = ex1, function(x){c(mean = mean(x), sd = sd(x))})    


## Sort
ord <- order(ex1$HGHT)                                        ## ?ûë??Ä ?àú?Ñú??ÄÎ°? ?àú?úÑ
head(ord)
head(ex1$HGHT[ord])                                           ## Sort

ord.desc <- order(-ex1$HGHT)                                  ## descending
head(ex1$HGHT[ord.desc])

ex1.sort <- ex1[ord, ]
head(ex1.sort)


## Wide to long, long to wide format
library(reshape2)
long <- melt(ex1, id = c("EXMD_BZ_YYYY", "RN_INDI"), measure.vars = c("BP_SYS", "BP_DIA"), variable.name = "BP_type", value.name = "BP")
long

library(reshape2)
long <- melt(ex1, id = c("EXMD_BZ_YYYY", "RN_INDI"), measure.vars = c("BP_SYS", "BP_DIA"), variable.name = "BP_type", value.name = "BP")
long %>% paged_table(options = list(rownames.print = F))

wide <- dcast(long, EXMD_BZ_YYYY + RN_INDI ~ BP_type, value.var = "BP")
head(wide)


## Merge
ex1.Q <- ex1[, c(1:3, 4:12)]
ex1.measure <- ex1[, c(1:3, 13:ncol(ex1))]
head(ex1.Q)
head(ex1.measure)

# all = T: Full, all.x = T: Left, all.y: Right, all = F: inner join
ex1.merge <- merge(ex1.Q, ex1.measure, by = c("EXMD_BZ_YYYY", "RN_INDI", "HME_YYYYMM"), all = T)
head(ex1.merge)


