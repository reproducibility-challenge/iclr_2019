# ICLR Reprodicibility Challenge 2019

[Website]() | [Sign-up Form]() 

Welcome to the 2nd edition of ICLR reproducibility challenge! One of the challenges in machine learning research is to ensure that published results are reliable and reproducible. In support of this, the goal of this challenge is to investigate reproducibility of empirical results submitted to the [2019 International Conference on Learning Representations](http://iclr.cc/).
We are choosing ICLR for this challenge because the timing is right for course-based participants (see below), and because papers submitted to the conference are automatically made available publicly on [Open Review](https://openreview.net/).

## Registration & Workflow

We will be using this repository primarily to organize the challenge. Once the ICLR paper review period starts, [our form]() will be live for participants to _claim_ a paper. Unlike last year's challenge, this year we want to encourage participants to avoid duplicate reproducibility efforts. Thus, before registering for the challenge [go through our issues]() to search for the papers which are already claimed by other participants. You can search by the paper name or by the OpenReview ID, which you will need to submit at the time of registration.

Once you submit the form, a Github issue will be created for your claim. Take note of this issue number (#001). Participant details are kept anonymous from the issue, only the Team Name and Institution name should be visible for the claim. You are encouraged to contact the authors in private to clarify doubts regarding the paper but you should maintain your anonymity in the issue section before your report submission.

After your reproducibility project is complete, you should:

- Post a public description of your report to the linked OpenReview forum
- Submit your paper in OpenReview
- Change the label of your issue from "in-progress" to "complete". Note this is when you make yourself public.
- Link your Github reproducibilty repository in your issue comment (Optional but recommended, obviously!).
- Use the issue link to create badges to show off in your repository.

## Task Description

You should select a paper from the 2019 ICLR submissions, and aim to replicate the experiments described in the paper. The goal is to assess if the experiments are reproducible, and to determine if the conclusions of the paper are supported by your findings. Your results can be either positive (i.e. confirm reproducibility), or negative (i.e. explain what you were unable to reproduce, and potentially explain why).
Essentially, think of your role as an inspector verifying the validity of the experimental results and conclusions of the paper. In some instances, your role will also extend to helping the authors improve the quality of their work and paper.

You do not need to reproduce all experiments in your selected paper, for example the authors may experiment with a new method that requires more GPUs than you have access to, but also present results for a baseline method (e.g. simple logistic regression), in which case you could elect to reproduce only the baseline results. It is sometimes the case that baseline methods are not properly implemented, or hyper-parameter search is not done with the same degree of attention.

If available, the authors' code can and should be used; authors of ICLR submissions are encouraged to release their code to facilitate this challenge. The methods described can also be implemented/re-implemented according to the description in the paper. This is a higher bar for reproducibility, but may be helpful in detecting anomalies in the code, or shedding light on aspects of the implementation that affect results.


## Important dates

- Announcement of the challenge: Early September 2018
- Registration of participants (see link below): Anytime during the fall
- Final submission of reproducibility report (on OpenReview): Sometime in December


## Badges

We also provide easy to use badges to use both for the challenge participant and the authors. Authors can use the badge in their repositories to gain increased recognition of their work. Challenge participants enjoy increased visibility and recognition for their reproducibility efforts.

## Contact

- [Genevieve Fried](), logistics and registration
- [Rosemary Nan Ke](), references, adverstising and technical support
- [Hugo Larochelle](), corporate sponsorship
- [Joelle Pineau](), challenge coordinator
- [Koustuv Sinha](), academic liason

