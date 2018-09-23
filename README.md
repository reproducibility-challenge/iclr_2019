# ICLR Reproducibility Challenge 2019

[Website](https://www.cs.mcgill.ca/~jpineau/ICLR2019-ReproducibilityChallenge.html) | [Sign-up Form](https://docs.google.com/forms/d/e/1FAIpQLSehp6-IcArs4hzWB9gkPsR_abekpZrDXCGf27I5G4vZ5h1kFQ/viewform?usp=sf_link) 

Welcome to the 2nd edition of ICLR reproducibility challenge! One of the challenges in machine learning research is to ensure that published results are reliable and reproducible. In support of this, the goal of this challenge is to investigate reproducibility of empirical results submitted to the [2019 International Conference on Learning Representations](http://iclr.cc/).
We are choosing ICLR for this challenge because the timing is right for course-based participants (see below), and because papers submitted to the conference are automatically made available publicly on [Open Review](https://openreview.net/).

## Registration & Workflow

### Select a paper and avoid duplicate work

We will be using this repository primarily to organize the challenge. Once the ICLR paper review period starts, [our form](https://docs.google.com/forms/d/e/1FAIpQLSehp6-IcArs4hzWB9gkPsR_abekpZrDXCGf27I5G4vZ5h1kFQ/viewform?usp=sf_link) will be live for participants to _claim_ a paper. Unlike last year's challenge, this year we want to encourage participants to avoid duplicate reproducibility efforts. Thus, before registering for the challenge [go through our open issues](https://github.com/reproducibility-challenge/iclr_2019/issues) to search for the papers which are already claimed by other participants. You can search by the paper name or by the OpenReview ID, which you will need to submit at the time of registration. You can also claim a paper which has been "relinquished" (more on that below).

### Submit form and note issue number

Now we are ready to submit the form. Fill the required questions, and make sure you have the following details handy:

- OpenReview paper ID
- Github login ID of the team lead

Once you submit the form, a Github issue will be created for your claim. Take note of this issue number (#xxxx). Participant details are kept anonymous from the issue, only the Team Name and Institution name should be visible for the claim. You are encouraged to contact the authors in private to clarify doubts regarding the paper but you should maintain your anonymity in the issue section before your report submission.

### Post reproducibility project

After your reproducibility project is complete, you should:

- Change the label of your issue from "in-progress" to "complete". Note this is when you make yourself public. To do that, mention the organization owner [@reproducibility-org](https://github.com/reproducibility-org) and comment the following: `@reproducibility-org complete`. Since in the form we asked your team lead's Github ID, this command can only used by him/her. We verify your ID and if you are assigned to this particular issue then we change the label of the issue to "complete".
- Post a public description of your report to the linked OpenReview forum
- Submit your paper in OpenReview
- Link your Github reproducibilty repository in your issue comment (Optional but recommended, obviously!).
- Submit a PR referring to this issue where you submit your report. 

### Leaving the competition

If you choose to leave the competition, please comment the following: `@reproducibility-org close` which will close the issue if you are the valid owner of the issue. If you want to work on another paper or work on the same paper, you will have to resubmit our form.

## Task Description

You should select a paper from the 2019 ICLR submissions, and aim to replicate the experiments described in the paper. The goal is to assess if the experiments are reproducible, and to determine if the conclusions of the paper are supported by your findings. Your results can be either positive (i.e. confirm reproducibility), or negative (i.e. explain what you were unable to reproduce, and potentially explain why).
Essentially, think of your role as an inspector verifying the validity of the experimental results and conclusions of the paper. In some instances, your role will also extend to helping the authors improve the quality of their work and paper.

You do not need to reproduce all experiments in your selected paper, for example the authors may experiment with a new method that requires more GPUs than you have access to, but also present results for a baseline method (e.g. simple logistic regression), in which case you could elect to reproduce only the baseline results. It is sometimes the case that baseline methods are not properly implemented, or hyper-parameter search is not done with the same degree of attention.

If available, the authors' code can and should be used; authors of ICLR submissions are encouraged to release their code to facilitate this challenge. The methods described can also be implemented/re-implemented according to the description in the paper. This is a higher bar for reproducibility, but may be helpful in detecting anomalies in the code, or shedding light on aspects of the implementation that affect results.

## Participating Institutions

T.B.D, contact [Joelle Pineau](jpineau@cs.mcgill.ca)

## Important dates

- Announcement of the challenge: Early September 2018
- Registration of participants: Anytime during the fall
- Final submission of reproducibility report: Sometime in December


## Contact & People

- [Genevieve Fried](mailto:genevieve.fried@mail.mcgill.ca), logistics and registration
- [Rosemary Nan Ke](mailto:rosemary.nan.ke@gmail.com), references, adverstising and technical support
- [Hugo Larochelle](mailto:hugolarochelle@google.com), corporate sponsorship
- [Koustuv Sinha](mailto:koustuv.sinha@mail.mcgill.ca), academic liason
- [Joelle Pineau](jpineau@cs.mcgill.ca), challenge coordinator

