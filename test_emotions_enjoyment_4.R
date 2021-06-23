library("GAabbreviate")
te <- read.csv("enjoyment.csv", header = TRUE)
psych::alpha(te[, seq(1, 10)])$total

scales = cbind(rowSums(te[, seq(1, 10)]))

te <- as.data.frame(sapply(te, as.integer))
te <- matrix(as.integer(unlist(te)), nrow=nrow(te))
te_GA = GAabbreviate(items = te, scales = scales, itemCost = 0.01,
                     maxItems = 4, # please change this value as 5 or 6 to see other versions
                     maxiter = 1000, 
                     run = 100, 
                     crossVal = TRUE, 
                     seed = 2021) 
te_GA$measure
enjoyment <- which(te_GA$measure$key[,1]==1)

te_GA$measure$items

