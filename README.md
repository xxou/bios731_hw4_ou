README
================
Xiaxian Ou

**data**

`data/cannabis-2.rds`: rds data will be used.


**source**

`source/my_rq.R`: This code defines a function `my_rq` to perform quantile regression using linear programming. It implements the formulation based on splitting coefficients into positive and negative parts and solves the optimization using the lp function from the lpSolve package.

`source/my_lasso.R`: This code defines a function `my_lasso` to solve the LASSO regression problem using quadratic programming. It reformulates the problem by separating coefficients into positive and negative parts and solves it with the LowRankQP package, which handles non–positive definite matrices.



**analysis**

- Rmarkdown file for homework questions
- pdf file rendered from Rmarkdown



