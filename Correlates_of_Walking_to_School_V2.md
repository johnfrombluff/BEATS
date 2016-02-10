---
title: "Correlates of Walking to School (V2)"
author: "John Williams"
output: 
  Grmd::docx_document:
    fig_caption: TRUE
    force_captions: TRUE
    toc: TRUE
    toc_depth: 5
  pdf_document:
    toc: true
    latex_engine: xelatex
    keep_tex: true
---



# Notes to the research team
This file contains a report on the re-analysis of the Walking to School Model
as dictated by John Spence. He told me to enter the variables in groups, according
to the framework in Panter et al., viz.:

1. Physical environment
    1. Neighbourhood 
    1. Destination  
    1. Attributes of route  
1. Individual factors
    1. Parental factors
        1. Parental characteristics (car, occupational status)
        1. Parental attidudes (active transport, environment, climate change)
    1. Perceptions of environment
        1. Parental Perceptions
        1. Youth Perceptions 
    1. Youth factors
        1. Youth characteristics, e.g. physical ability, ethnicity (!?!)
        1. Youth attitudes, e.g independence, motivation to walk
    1. Decision making process on mode choice
1. External factors
    1. Weather
    1. Cost of travel
    1. Government policy
    
Also age, sex and distance are treated as moderators on:

1. The decision process (2.4)
1. Youth perceptions (2.1)
1. Youth attitudes (3.2)
1. Parental attitudes (2.1)

## Data Setup
The **R** code below is just to show which data file is being used.


```r
dir <- "/home/john/Dropbox/Research/Collaboration/BEATS/John/W2S"
file <- "BEATS_SS_ForWalk2School_150507.sav"
dat <- read.spss(paste(dir, file, sep = "/"), to.data.frame = TRUE)
```




# Modeling
**Notes**:

- Because the data were collected within schools, robust standard errors were 
calculated using school as a cluster variable. 
- Following standard practice (e.g. Hosmer & Lemeshow, 2013) models with areas 
under the  ROC curve greater  than 0.9 are labelled "outstanding", and those 
with ROC areas between 0.8 and 0.9 are labelled "excellent". These adjectives
used in this context *are not superlatives*, they are merely social conventions, 
exactly the same as labelling $p$-values less than 5% as "significant".

## Univariate models
It is not possible to fit a logistic regression model with such a huge number of
parameters (one for each variable, plus three more for each possible two-way 
interaction). Hence a series of reduced models was run on each individual 
potential covariate, with the aim of "pre-screening" the full model (i.e. not
entering interation terms in the multivariate model for which there was no
significant univariate interactions).

<small>

```
Error in myHTML(s, br = br): unused argument (br = br)
```


```
Error in myHTML(s, br = br): unused argument (br = br)
```
</small>


```
Error in myHTML(s, br = br): unused argument (br = br)
```

<center>

```
Error in htmlTable(m1.gof$sf, rnames = F, align = "r", header = c("Index", : object 'm1.gof' not found
```
</center>


<center>

</center>
  


## Interpretation
The final model has absolutely outstanding predictive and discriminant validity, 
and all  effects can be interpreted *ceteris paribus*. It also has good face 
validity.
# Summary
All logistic regression modelling results are exceptionally good in terms of 
discrimination, predictive ability and face validity. 
