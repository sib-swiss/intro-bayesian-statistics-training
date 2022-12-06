[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7403204.svg)](https://doi.org/10.5281/zenodo.7403204)


# Introduction to Bayesian statistics with R

This course material is part of the "Introduction to Bayesian statistics with R" two-day course of [SIB Training](https://www.sib.swiss/training/upcoming-training-courses) and is 
 addressed to beginners wanting to become familiar with the core concepts of Bayesian statistics through lectures and applied examples. 

The practical exercises are implemented in the widely used [R](https://www.r-project.org/) programming language and the [Rstan](https://mc-stan.org/users/interfaces/rstan) and [brms](https://cran.r-project.org/web/packages/brms/index.html) libraries. They will enable participants to use standard Bayesian statistical tools and interpret their results.

This course material presumes the participant is familiar with both R and (frequentist) statistical inference.


## prerequisite installation

To follow this course, make sure you have [R](https://www.r-project.org/) and [Rstudio](https://www.rstudio.com/) installed beforehand.

Additionally, make sure to have the following R libraries installed:

 * The [Rstan](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started) package (warning, there are 2 steps to the installation: Configuring C++ toolchains, and then installation of Rstan)
 * [Rmarkdown](https://rmarkdown.rstudio.com/lesson-1.html)
 * [Shiny](https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/)
 * [tidyverse](https://www.tidyverse.org/packages/)
 * [BRMS](https://cran.r-project.org/web/packages/brms/index.html)


## course material organization

The course material is organized in 8 lectures, with corresponding exercises.

The lectures can be found in the `lectures/` folder,
where the correspond to Rmarkdown files that should be opened with Rstudio and then rendered as presentation

 * lecture 1 : T-test recap
 * lecture 2 : P-values and confidence intervals
 * lecture 3 : Monte Carlo methods
 * lecture 4 : Bayesian first steps
 * lecture 5 : Bayesian t-tests (STAN + BRMS)
 * lecture 6 : Robust t-tests and priors
 * lecture 7 : Bayesian linear regression
 * lecture 8 : Bayesian logistic regression

Each lecture is accompanied by one or two exercises which can be found in the `exercises/` folder, which contains the exercises instructions and solutions (as `.pdf` files), as well as the data files used in the exercise (in the `data/`) subfolder.

## Citation

If you re-use or mention this course material, please cite:


Jack Kuipers, & Wandrille Duchemin. (2022, December 6). Introduction to Bayesian statistics with R. Zenodo. [https://doi.org/10.5281/zenodo.7403204](https://doi.org/10.5281/zenodo.7403204)


