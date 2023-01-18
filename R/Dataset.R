# Se instalo caTools, para dividir los datos
dataset = read.csv('./data/data.csv')

# Tratamiento de los valores Na



dataset$Age = ifelse(is.na(dataset$Age), ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)


dataset$Salary = ifelse(is.na(dataset$Salary), ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)


# Codificar variables categóricas

dataset$Country = factor(dataset$Country, 
                         levels=c("France", "Spain", "Germany"),
                         labels=c(1,2,3)
                         )

dataset$Purchased = factor(dataset$Purchased, 
                         levels=c("Yes", "No"),
                         labels=c(1,0)
)

# install.package("caTools")
# library(caTools)

set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

# estandarizar datos
training_set[,2:3] = scale(training_set[,2:3])
testing_set[,2:3] = scale(testing_set[,2:3])


