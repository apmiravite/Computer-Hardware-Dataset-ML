# Computer Hardware Dataset
Exercise on Computer Hardware Dataset

Data source: [https://archive.ics.uci.edu/ml/datasets/Computer+Hardware](https://archive.ics.uci.edu/ml/datasets/Computer+Hardware)

This exercise follows the procedure in Ein-Dor (1987).

*0 Data Cleaning*

We implement the following transformations to our data:<br>
$CHAve=(CHMin+CHMax)/2$ <br>
$MAve=(MMin+MMax)/2$ <br>
$SPEED= (1/MYCT)$ <br>
$CHCAP=CHAve\cdot SPEED\cdot10$<br>
$SQRERF= \sqrt{ERP}$

We also put normalized variables for $MAve, CHCAP, CACH, SQRERF$, which we will be using later.

*1 Model*

We setup the training and test sets for our hardware data in the ratio 80:20. Since we have 209 oberservations, we have 167 training data points and 42 test data points.
