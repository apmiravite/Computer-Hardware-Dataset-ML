# Computer Hardware Dataset
Exercise on Computer Hardware Dataset

Data source: [https://archive.ics.uci.edu/ml/datasets/Computer+Hardware](https://archive.ics.uci.edu/ml/datasets/Computer+Hardware)

*0 Data Cleaning*

We implement the following transformations to our data:<br>
$CHAve=(CHMin+CHMax)/2$ <br>
$MAve=(MMin+MMax)/2$ <br>
$SPEED= (1/MYCT)$ <br>
$CHCAP=CHAve\cdot SPEED\cdot10$<br>
$SQRERF= \sqrt{ERP}$

We also put normalized variables for $MAve, CHCAP, CACH, SQRERF$, which we will be using later.

*1 Model*

This exercise follows the procedure in Ein-Dor (1987).

*1A Training and Testing dataset*<br>
We setup the training and test sets for our hardware data in the ratio 80:20. Since we have 209 oberservations, we have 167 training data points and 42 test data points.

Below is the correlation table of the variables we will be using:

<img
  src="https://github.com/apmiravite/Computer-Hardware-Dataset-ML/blob/main/images/correlation.png"
  alt="Alt text"
  title="Optional title"
  style="display: inline-block; margin: 0 auto; max-width: 300px">
  
*1B Linear Regression Model*<br>
Our regression model is as follows: $SQRERF = \epsilon + \beta_1\cdot MAve + \beta_2\cdot CACHE + \beta_3\cdot CHCAP$ 

This is the result of our linear regression model

<img
  src="https://github.com/apmiravite/Computer-Hardware-Dataset-ML/blob/main/images/linear_training.png"
  alt="Alt text"
  title="Optional title"
  style="display: inline-block; margin: 0 auto; max-width: 300px">

 $SQRERF = 3.78 + 0.49 MAve + 0.30 CACHE + 0.19 CHCAP$ 
 
 If we do a similar run using the normalized values, we get this result:
 
 $SQRERF = 6.80 + 0.72 MAve + 0.24 CACHE + 0.16 CHCAP$ 
 
 Both runs show that all three independent variables contribute significantly to explaining variances in the dependent variable.
 
 *1C Predicting the Target Variable and Evaluating the Accuracy of the Model*<br>
  Using our model from our training dataset (1B), we will predict target values using the data point of the testing dataset
  
```R
prediction_norm <- predict(linear_norm_train, test_set)
```


```R
data.frame(R2 = R2(prediction_norm, test_set$SQRERF),RMSE = RMSE(prediction_norm, test_set$SQRERF), MAE = MAE(prediction_norm, test_set$SQRERF))
```
