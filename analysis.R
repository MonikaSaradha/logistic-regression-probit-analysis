# ----------------------------------
# Logistic & Probit Regression (R)
# ----------------------------------

# Libraries
library(dplyr)
library(ggplot2)
library(caret)
library(pROC)
library(stats)

# ----------------------------------
# 1. Heart Disease Dataset
# ----------------------------------

heart <- read.csv("heart.csv")

# Split data
set.seed(42)
trainIndex <- createDataPartition(heart$output, p = 0.7, list = FALSE)
train <- heart[trainIndex, ]
test <- heart[-trainIndex, ]

# ----------------------------------
# Logistic Regression
# ----------------------------------

log_model <- glm(output ~ ., data = train, family = binomial)

# Predictions
prob <- predict(log_model, test, type = "response")
pred <- ifelse(prob > 0.5, 1, 0)

# Confusion Matrix
confusionMatrix(as.factor(pred), as.factor(test$output))

# ROC Curve
roc_obj <- roc(test$output, prob)
plot(roc_obj, main = "ROC - Logistic Regression")

# ----------------------------------
# Decision Tree
# ----------------------------------

library(rpart)

tree_model <- rpart(output ~ ., data = train, method = "class")

tree_pred <- predict(tree_model, test, type = "class")

confusionMatrix(tree_pred, as.factor(test$output))

# ----------------------------------
# 2. NSSO Dataset - Probit Regression
# ----------------------------------

data <- read.csv("punjab.csv")

# Create binary variable (non-veg proxy)
data$target <- ifelse(data$eggsno_q > 0, 1, 0)

# Probit model
probit_model <- glm(target ~ eggsno_q + fishprawn_q + goatmeat_q +
                     beef_q + pork_q + chicken_q + othrbirds_q,
                   data = data,
                   family = binomial(link = "probit"))

summary(probit_model)

# ----------------------------------
# Visualization
# ----------------------------------

# Non-vegetarians by religion
nonveg <- data %>%
  group_by(Religion) %>%
  summarise(count = sum(target))

ggplot(nonveg, aes(x = Religion, y = count)) +
  geom_bar(stat = "identity", fill = "blue") +
  ggtitle("Number of Non-Vegetarians by Religion") +
  theme_minimal()
