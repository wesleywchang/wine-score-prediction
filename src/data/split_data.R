# load library
library(tidyverse)

# set working directory and read in csv to data frame
setwd('~/W203/Lab_2/andamooka')
wine_full <- read.csv('./data/raw/wine_data/winequality-white.csv', sep= ';', header=TRUE)

# update column names to true chemical compound
colnames(wine_full) <- c('tartaric_acid', 'acetic_acid', 'citric_acid', 'residual_sugar', 
                         'sodium_chloride', 'free_sulfur_dioxide', 'total_sulfur_dioxide', 
                         'density', 'pH', 'potassium_sulphate', 'alcohol', 'quality')

# set seed and split data into explore and confirm datasets
set.seed(999)
sample_size <- floor(0.7*nrow(wine_full))
dt <- sample(seq_len(nrow(wine_full)), size= sample_size)
wine_confirm <- wine_full[dt,] %>% na.omit()
wine_explore <- wine_full[-dt,] %>% na.omit()

# write interim confirm and explore datasets to csv in data/interim/ folder
write.csv(wine_confirm, '~/W203/Lab_2/andamooka/data/interim/wine_confirm.csv', row.names=FALSE)
write.csv(wine_explore, '~/W203/Lab_2/andamooka/data/interim/wine_explore.csv', row.names=FALSE)

# filter columns that will not be used in final dataset.
wine_confirm <- select(wine_confirm, -c('free_sulfur_dioxide', 'pH'))
wine_explore <- select(wine_explore, -c('free_sulfur_dioxide', 'pH'))

# write final confirm and explore datasets to csv in data/processed/ folder
write.csv(wine_confirm, '~/W203/Lab_2/andamooka/data/processed/wine_confirm.csv', row.names=FALSE)
write.csv(wine_explore, '~/W203/Lab_2/andamooka/data/processed/wine_explore.csv', row.names=FALSE)