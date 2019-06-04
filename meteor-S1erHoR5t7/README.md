## This is a guide for [ICLR2019 reproducibility challenge](https://reproducibility-challenge.github.io/iclr_2019/)

Review target: [The relativistic discriminator: a key element missing from standard GAN](https://openreview.net/forum?id=S1erHoR5t7) (*Accept Poster*)

Issue Ticket: [S1erHoR5t7](https://github.com/reproducibility-challenge/iclr_2019/issues/10)

Code Repo: [VSR](https://github.com/LoSealL/VideoSuperResolution)

### How to reproduce benchmark

0. Clone repo:

    ```bash
    git clone https://github.com/LoSealL/VideoSuperResolution -b iclr_submit
    ```

1. Download dataset and weights

   1. CIFAR10 will be downloaded in the code automatically.
   2. CelebA is downloaded [here](http://mmlab.ie.cuhk.edu.hk/projects/CelebA.html), and is processed by:
      ```bash
      python VSR/Tools/DataProcessing/CelebA.py /mnt/data/dataset/celeba/ --n_test=10000
      ```
      where `/mnt/data/dataset/celeba` is your root to CelebA dataset. This will create a `resize64` folder holds `192,599` training patches and a `test64` folder holds `10000` testing patches under that root directory.

   3. Weights are downloaded by using `python prepare_data.py --filter="\w*gan"`, which will extract weights into `./Results/` (*Requires your permission*).

2. Evaluate GAN models

   Example for RGAN:
   ```bash
   cd Train
   python run.py --mode=eval --model=rgan --checkpoint_dir=../Results/rgan --epochs=500 --test=cifar10 --enable_inception_score --enable_fid
   ```

   Where you can see printed FID and IS value on terminal, and you can also find records file in `/tmp/vsr/<date>/eval_results.csv`.

3. Generate samples

   ```bash
   cd Train
   python run.py --model=rgan --test=cifar10
   ```

   Where the generated images are saved in `../Results/rgan/cifar10`.

4. Train models from scratch

    1. Refer to general guide [here](./README.md)
    2. (Optional) Prepare your own dataset (if needed, refer DDF [here](./Data/README.md))
    3. (Optional) Modify [model config file](./Train/parameters/rgan.yaml), all models and information are defined [here](./VSR/Models/Gan.py)
    4. Run script: (i.e. RGAN)
    ```bash
    cd Train
    python run.py --model=rgan --epochs=500 --dataset=cifar10
    ```