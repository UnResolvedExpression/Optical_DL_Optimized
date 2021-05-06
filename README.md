# Optical_DL_Optimized
This repository is an optimized version of the Optical model for Motor Imagery Classification tasks.

Specifically, the Deep Learning portion of the model has been modified, and Bayesian Optimization has been used to adjust the hyperparameters of the new model to the subject data.

Overall, the test accuracy has increased from 70% to 95% through these optimizations. Additional details and metrics inluding model precision, recall and computation time may be found in the following command line outputs. The demonstration was run in MATLAB 2020a on the dual core i5-3320M @2.60GHz.

The output of the unmodified model
```
|===============================================================================================================|
| Iter | Active  | Eval   | Objective   | Objective   | BestSoFar   | BestSoFar   | InitialLearn-| L2Regulariza-|
|      | workers | result |             | runtime     | (observed)  | (estim.)    | Rate         | tion         |
|===============================================================================================================|
|    1 |       1 | Accept |     0.13333 |      114.23 |     0.11667 |     0.11667 |     0.022025 |   5.1253e-05 |
|    2 |       1 | Best   |     0.11667 |      114.42 |     0.11667 |     0.11667 |    0.0080258 |    0.0008033 |
|    3 |       2 | Accept |     0.13889 |      111.78 |     0.11667 |     0.11667 |    0.0028666 |   2.1745e-05 |

__________________________________________________________
Optimization completed.
MaxTime of 300 seconds reached.
Total function evaluations: 3
Total elapsed time: 388.0011 seconds.
Total objective function evaluation time: 340.4263

Best observed feasible point:
    InitialLearnRate    L2Regularization
    ________________    ________________

       0.0080258           0.0008033    

Observed objective function value = 0.11667
Estimated objective function value = 0.11667
Function evaluation time = 114.4151

Best estimated feasible point (according to models):
    InitialLearnRate    L2Regularization
    ________________    ________________

       0.0080258           0.0008033    

Estimated objective function value = 0.11667
Estimated function evaluation time = 113.4691

Accuracy on train data is 89.44%
Accuracy on test data is 70.00%
```

This is the output after modifying the Deep Learning Network

(precision and recall were added to check model validity)
```
|===============================================================================================================|
| Iter | Active  | Eval   | Objective   | Objective   | BestSoFar   | BestSoFar   | InitialLearn-| L2Regulariza-|
|      | workers | result |             | runtime     | (observed)  | (estim.)    | Rate         | tion         |
|===============================================================================================================|
|    1 |       2 | Best   |        0.15 |      189.07 |        0.15 |        0.15 |     0.025791 |    4.112e-05 |

__________________________________________________________
Optimization completed.
MaxTime of 300 seconds reached.
Total function evaluations: 1
Total elapsed time: 381.9489 seconds.
Total objective function evaluation time: 189.0695

Best observed feasible point:
    InitialLearnRate    L2Regularization
    ________________    ________________

        0.025791           4.112e-05    

Observed objective function value = 0.15
Estimated objective function value = 0.15
Function evaluation time = 189.0695

Best estimated feasible point (according to models):
    InitialLearnRate    L2Regularization
    ________________    ________________

        0.025791           4.112e-05    

Estimated objective function value = 0.15
Estimated function evaluation time = 189.0695

Accuracy on train data is 90.56%
Accuracy on test data is 90.00%
Precision on test data is 83.00%
Recall on test data is 100%
```


This is the output after Bayesian Optimization was applied to the Deep Learning Network
```
|==============================================================================================================================|
| Iter | Active  | Eval   | Objective   | Objective   | BestSoFar   | BestSoFar   | InitialLearn-| L2Regulariza-| numHiddenUni-|
|      | workers | result |             | runtime     | (observed)  | (estim.)    | Rate         | tion         | ts1          |
|==============================================================================================================================|
|    1 |       2 | Best   |        0.05 |       132.6 |        0.05 |        0.05 |     0.037062 |   0.00067414 |           62 |
|    2 |       2 | Accept |    0.088889 |      160.94 |        0.05 |        0.05 |    0.0014933 |   4.6069e-05 |           85 |

__________________________________________________________
Optimization completed.
MaxTime of 300 seconds reached.
Total function evaluations: 2
Total elapsed time: 425.0457 seconds.
Total objective function evaluation time: 293.5352

Best observed feasible point:
    InitialLearnRate    L2Regularization    numHiddenUnits1
    ________________    ________________    _______________

        0.037062           0.00067414             62       

Observed objective function value = 0.05
Estimated objective function value = 0.05
Function evaluation time = 132.5956

Best estimated feasible point (according to models):
    InitialLearnRate    L2Regularization    numHiddenUnits1
    ________________    ________________    _______________

        0.037062           0.00067414             62       

Estimated objective function value = 0.05
Estimated function evaluation time = 146.0818

Accuracy on train data is 95.00%
Accuracy on test data is 95.00%
Precision on test data is 100.00%
Recall on test data is 90.00%
```
For practical use, I recommend increasing the 'MaxTime' and/or using more powerful hardware to allow the Bayesian Optimization to find a stronger model.

![image](https://user-images.githubusercontent.com/50681161/117360071-55025900-ae86-11eb-93d5-51706965d0a0.png)

This is a diagram of the model from the original paper.

Kumar, S., Sharma, A. & Tsunoda, T. Brain wave classification using long short-term memory network based OPTICAL predictor. Sci Rep 9, 9153 (2019). https://doi.org/10.1038/s41598-019-45605-1

