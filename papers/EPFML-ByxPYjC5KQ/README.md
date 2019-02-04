# EPFL Machine Learning Project 2
ICLR Reproducibility Challenge: Improving Generalization and Stability of Generative

Link to code: https://github.com/wanhaozhou/Machine-Learning/blob/master/project2/Improving_Generalization_And_Stability_Of_GAN.ipynb

## Authors

* [**Junze Li**](junze.li@epfl.ch)
* [**Siyuan Li**](siyuan.li@epfl.ch)
* [**Wanhao Zhou**](wanhao.zhou@epfl.ch)

## Prerequisites

The whole project is written and tested in Python 3.6. Experiments described in the report are included in the single jupyter notebook file. Before running the notebook, make sure the following dependencies are installed and could be referenced properly.
Specifically, we experiment with our code on **torch version 0.4.1** and **torchvision version 0.2.1**. 
Attempting to run on later pytorch version will have errors.
```
import numpy
import matplotlib
import torch
import torchvision
```
## File organization
We organize all the experiments described in the report in the jupyter notebook, consisting of experiments on:
- synthetic data
- MNIST
-  CIFAR

All cells are evaluated with the exact figures included in our report. Re-evaluating cells will generally have different but might be similar results.

