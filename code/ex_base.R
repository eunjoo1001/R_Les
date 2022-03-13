# Vector
x <- c(1, 2, 3, 4, 5, 6)           
y <- c(7, 8, 9, 10, 11, 12)
x + y                                  
x * y
sqrt(x)                           
sum(x)                                
diff(x)                            
mean(x)                            
var(x)                             
sd(x)                              
median(x)                          
IQR(x)                            
max(x)                             
which.max(x)                      
max(x, y)                         
length(x)                          


# Slice
x[2]                              
x[-2]                              
x[1:3]                             
x[c(1, 2, 3)]                     
x[c(1, 3, 4, 5, 6)]                
x >= 4                             
sum(x >= 4)                         
x[x >= 4]                                   
sum(x[x >= 4])                     
x %in% c(1, 3, 5)                  
x[x %in% c(1, 3, 5)]               


# Make vector
v1 <- seq(-5, 5, by = .2); v1             
v2 <- rep(1, 3); v2                      
v3 <- rep(c(1, 2, 3), 2); v3            
v4 <- rep(c(1, 2, 3), each = 2); v4       


# for
for (i in 1:3){
  print(i)
}

i <- 0
for (j in c(1, 2, 4, 5, 6)){
  i <- i + j
}
i


# if/else
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


# ifelse
x <- 1:6
y <- ifelse(x >= 4, "Yes", "No")          
y



# function
x <- c(1:10, 12, 13, NA, NA, 15, 17)  
mean(x)

mean0 <- function(x){
  mean(x, na.rm = T)
}                                         

mean0 <- function(x){mean(x, na.rm = T)}  
mean0(x)


twomean <- function(x1, x2){
  a <- (x1 + x2)/2
  a
}
twomean(4, 6)


# Apply: apply, sapply, lapply
mat <- matrix(1:20, nrow = 4, byrow = T)    
mat

out <- NULL                               
for (i in 1:nrow(mat)){
  out <- c(out, mean(mat[i, ]))
}
out

sapply(1:nrow(mat), function(x){mean(mat[x, ])})            
lapply(1:nrow(mat), function(x){mean(mat[x, ])})            
unlist(lapply(1:nrow(mat), function(x){mean(mat[x, ])}))    
# parallel::mclapply(1:nrow(mat), function(x){mean(mat[x, ])}, mc.cores = 4)           ## Multicore


apply(mat, 1, mean)                                      
rowMeans(mat)                                               
rowSums(mat)                                                

apply(mat, 2, mean)                                         
colMeans(mat)                                               



# Practice 1:sapply, lapply ?´?š©?•˜?—¬ ?•„?ž˜ ?‘ ë²¡í„°?˜ ìµœë?€ê°? êµ¬í•˜ê¸?
x <- 1:6
y <- 7:12
lapply(list(x, y), max)
unlist(lapply(list(x, y), max))



## With data
getwd()  
setwd("data")                                              
## ?™?¼
setwd("/cloud/project/data")
getwd()

ex <- read.csv("example_g1e.csv")
head(ex)

ex <- read.csv("https://raw.githubusercontent.com/jinseob2kim/lecture-snuhlab/master/data/example_g1e.csv")
head(ex)


# install.packages(c("readxl", "haven"))
library(readxl)
ex.excel <- read_excel("example_gle.xlsx", sheet = 1)
getwd()
ex.excel <- read_excel("example_g1e.xlsx", sheet = 1)

library(haven)
ex.sas <- read_sas("example_gle.sas7bdat")
ex.sas <- read_sas("example_g1e.sas7bdat") 
head(ex.sas)
ex.spss <- read_sav("example_g1e.sav")
head(ex.spss)

write.csv(ex, "example_gle_ex.csv", row.names = F)
write_sas(ex.sas, "example_gle_ex.sas7dbat")
write_sav(ex.spss, "example_gle_ex.sav")


# See data
head(ex)
tail(ex)    
head(ex, 10)
ex
str(ex)
names(ex)
dim(ex)  
nrow(ex)
ncol(ex)
class(ex)
class(ex.spss)
class(ex.excel)
class(ex.sas)
summary(ex)


# See variables
ex$EXMD_BZ_YYYY
ex[, "EXMD_BZ_YYYY"]
ex[["EXMD_BZ_YYYY"]]
ex[, 1]
ex[[1]]

ex[, c("EXMD_BZ_YYYY", "RN_INDI", "BMI")]
ex[, c(1, 2, 6)]
ex[, names(ex)[c(1, 2, 16)]] 

ex$EXMD_BZ_YYYY[1:50]
ex[1:50, 1]
ex[[1]][1:50]

unique(ex$EXMD_BZ_YYYY)
length(unique(ex$EXMD_BZ_YYYY))
length(ex$EXMD_BZ_YYYY)
table(ex$EXMD_BZ_YYYY)


# New variable
mean(ex$BMI)
BMI_cat <- (ex$BMI >= 25)
table(BMI_cat)
rows <- which(ex$BMI >= 25)
head(rows)
values <- ex$BMI[ex$BMI >= 25]
head(values)
length(values)
BMI_HGHT_and <- (ex$BMI >= 25 & ex$HGHT >= 175)
BMI_HGHT_or <- (ex$BMI >= 25 | ex$HGHT >= 175)

ex$zero <- 0
ex$zero
ex$BMI_cat <- (ex$BMI >= 25)
ex$BMI_cat
ex$BMI_cat <- as.integer(ex$BMI >= 25)
ex$BMI_cat
ex$BMI_cat <- as.character(ex$BMI >= 25)
ex$BMI_cat
ex$BMI_cat <- ifelse(ex$BMI >= 25, "1", "0")
ex$BMI_cat
table(ex$BMI_cat)
ex$BMI_cat2 <- as.character(ex$BMI_cat)
ex$BMI_cat2
ex[, "BMI_cat"] <- (ex$BMI >= 25)    
head(ex)


# Set class
vars.cat <- c("RN_INDI", "Q_PHX_DX_STK", "Q_PHX_DX_HTDZ", "Q_PHX_DX_HTN", "Q_PHX_DX_DM", "Q_PHX_DX_DLD", "Q_PHX_DX_PTB", 
              "Q_HBV_AG", "Q_SMK_YN", "Q_DRK_FRQ_V09N")
vars.cat <- names(ex)[c(2, 4:12)]
vars.cat <- c("RN_INDI", grep("Q_", names(ex), value = T))
vars.cat

vars.conti <- setdiff(names(ex), vars.cat)
vars.conti <- names(ex)[!names(ex) %in% vars.cat]
vars.conti

for (vn in vars.cat){
  ex[, vn] <- as.factor(ex[, vn])
}

for (vn in vars.conti){
  ex[, vn] <- as.numeric(ex[, vn])
}

summary(ex)

table(as.numeric(ex$Q_PHX_DX_STK))
table(as.numeric(as.character(ex$Q_PHX_DX_STK)))


# Date
addDate <- paste(ex$HME_YYYYMM, "01", sep = "")
addDate
ex$HME_YYYYMM <- as.Date(addDate, format = "%Y%m%d")
head(ex$HME_YYYYMM)
class(ex$HME_YYYYMM)
ex


# NA
tapply(ex$LDL, ex$EXMD_BZ_YYYY, mean)
tapply(ex$LDL, ex$EXMD_BZ_YYYY,
       function(x){
         mean(x, na.rm = T)
       })

summary(lm(LDL ~ HDL, data = ex))

ex.naomit <- na.omit(ex)
nrow(ex.naomit)
getmode <- function(v){
  uniqv <- unique(v)
  uniqv[which.max{(tabulate(match(v, uniqv)))}]
}  

getmode <- function(v){
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(ex$Q_PHX_DX_STK)


vars.ok <- sapply(names(ex), function(v){sum(is.na(ex[, v])) < nrow(ex)/10})
ex.impute <- ex[, vars.ok]

ex.impute              

for (v in names(ex.impute)){
  if (is.factor(ex.impute[, v])){
    ex.impute[,v] <- ifelse(is.na(ex.impute[, v]), 
                            getmode(ex.impute[, v]), 
                            ex.impute[,v])
  } else if (is.numeric(ex.impute[, v])){
    ex.impute[,v] <- ifelse(is.na(ex.impute[, v]), 
                            median(ex.impute[, v], na.rm = T), 
                            ex.impute[,v])
  } else {
    ex.impute[, v]
  }
      
}

summary(ex.impute)

# Subset
ex1 <- ex.naomit
ex1.2012 <- ex1[ex1$EXMD_BZ_YYYY >= 2012, ]
table(ex1.2012$EXMD_BZ_YYYY)

ex1.2012 <- subset(ex1, EXMD_BZ_YYYY >= 2012)
table(ex1.2012$EXMD_BZ_YYYY)

# Group by
aggregate(ex1[, c("WSTC", "BMI")], list(ex1$Q_PHX_DX_HTN), mean)
aggregate(cbind(WSTC, BMI) ~ Q_PHX_DX_HTN, data = ex1, mean)

aggregate(cbind(WSTC, BMI) ~ Q_PHX_DX_HTN, data = ex, mean)

aggregate(ex1[, c("WSTC", "BMI")], list(ex1$Q_PHX_DX_HTN, ex1$Q_PHX_DX_DM), mean)
aggregate(cbind(WSTC, BMI) ~ Q_PHX_DX_HTN + Q_PHX_DX_DM, data = ex1, mean)
aggregate(cbind(WSTC, BMI) ~ Q_PHX_DX_HTN + Q_PHX_DX_DM, data = ex1, function(x){
  c(mean=mean(x), sd = sd(x))
})
aggregate(. ~ Q_PHX_DX_HTN + Q_PHX_DX_DM, data = ex1, function(x){
  c(mean=mean(x), sd = sd(x))
})



# Sort
ord <- order(ex1$HGHT)
head(ord)
head(ex1$HGHT[ord])

ord.desc <- order(-ex1$HGHT)
head(ord.desc)
head(ex1$HGHT[ord.desc])

ex1.sort <- ex1[ord, ]
ex1.sort
head(ex1.sort)

# Wide to long, long to wide
install.packages("reshape2")
libray(reshape2)


# Merge
ex1.Q <- ex1[, c(1:3, 4:12)]
head(ex1.Q)
ex1.measure <- ex1[, c(1:3, 13:ncol(ex1))]
head(ex1.measure)



# all = T : Full,  all.x = T : Left,  all.y = T : Right,  all = F : inner join
ex1.merge <- merge(ex1.Q, ex1.measure, by = c("EXMD_BZ_YYYY", "RN_INDI", "HME_YYYYMM"), all = T)
head(ex1.merge)




























