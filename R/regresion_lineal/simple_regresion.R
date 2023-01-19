dataset = read.csv('./data/regresion/simpleRegresion/Salary_Data.csv')


set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)

training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)