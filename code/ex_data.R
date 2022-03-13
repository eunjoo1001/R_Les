# Set up
install.packages("data.table")
install.packages("curl")

library(data.table)
library(curl)

# Load file
url <- "https://raw.githubusercontent.com/jinseob2kim/lecture-snuhlab/master/data/example_g1e.csv"
df <- read.table(url, header=T)
dt <- fread(url, head=T)
print(class(df))
print(class(dt))
dt








