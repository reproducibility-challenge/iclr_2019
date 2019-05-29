=========================================
Parth Kothari, Yuejiang Liu, Timur Lavrov
Team: Velvet Thunder
Project 2, Machine Learning, EPFL

ICLR Reproducibility Challenge
Issue
https://github.com/reproducibility-challenge/iclr_2019/issues/89
Codebase
https://github.com/timur26/ICLR_Reproducibility_Challenge_Autoloss

============= Dependency ================
python 3.6
tensorflow 1.11.0

============= Download ================
- Download MNIST data
python download.py mnist
- Download CIFAR10 data 
Link: https://www.cs.toronto.edu/~kriz/cifar.html
cd data 
wget https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz 
Unzip in 'cifar-10-python' folder as 'cifar10' folder 
- Download MNIST Inception Score graph 
mkdir model 
cd model 
wget https://github.com/tensorflow/models/raw/master/research/gan/mnist/data/classify_mnist_graph_def.pb

============= Command ================
- Joint minimization for classification:
sh run_gs_classification.sh
- Joint minimization for regression:
sh run_gs_regression.sh
- Hand-crafted schedule for classification:
python c_main.py --lambdaa 1e-1 --mode "alter" --T 25
- Auto-loss schedule for classification:
python c_main.py --lambdaa 1e-1 --mode "autol" --T 25
- GAN Baseline MNIST
python main.py
- GAN Baseline CIFAR-10
python main.py --dataset cifar10
- GAN Autoloss MNIST
python main.py --autoloss
- GAN Autoloss CIFAR10
python main.py --autoloss --dataset cifar10

