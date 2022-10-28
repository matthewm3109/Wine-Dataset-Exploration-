# Red Wine Exploration

## Introduction
My goal for this exercise is to improve understanding of modeling techniques. I built a prediction model for the perceived quality for red wines. To do this, I used stepwise regression to select for factors that are most likely to be statistically significant, using a training dataset. I then built a multiple linear regression (MLR) model to predict perceived quality of red wine on my test dataset. 

## Results 
The resulting model used 7 factors, out of the 11 potential factors. It has an adjusted R-squared value of 35 - meaning 35% of the variability is captured, adjusting for the number of factors. Since quality is an extremely subjective measure and can vary person to person, I am ok seeing the score is low. When I tested this against the test dataset, it was correct 62% of the time. The model also has a Root Mean Square Error (RMSE) of 0.016. 

## References
You can find the full dataset, originally from the UCI machine learning repository, here: https://www.kaggle.com/datasets/uciml/red-wine-quality-cortez-et-al-2009

