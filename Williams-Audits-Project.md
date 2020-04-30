Williams Audit Analysis
================
Garland Williams
4/27/2020

  - [Audits Data Analysis](#audits-data-analysis)
  - [Variables](#variables)
      - [Audit Status](#audit-status)
      - [In USA or OUS](#in-usa-or-ous)
      - [GxP Area](#gxp-area)
      - [Audit Type](#audit-type)
      - [Audit Method](#audit-method)
      - [Proposed Quarter](#proposed-quarter)

## Audits Data Analysis

This is the output of G. Holt Williams’ Audits Data Analyst project.
This was created using R Markdown, and can be navigated using the tabel
of contents

``` r
##Read Data
#Computerized System Quality Assurance
CSQA<- read_excel("CSQA_Audit_Data.xlsx")

#Good Workign Practice
GWP<- read_excel("GXP_Audit_Data.xlsx")
```

## Variables

Here begins the analysis for every variabel specefied

1.  Audit Status
2.  In USA or OUS
3.  GxP Area
4.  Audit Type
5.  Audit Method
6.  Proposed Quarter

### Audit Status

    ##           vars  n       perc
    ## 1    Cancelled  4 0.04166667
    ## 2       Closed 19 0.19791667
    ## 3    Completed  4 0.04166667
    ## 4  In Progress 18 0.18750000
    ## 5 Not In Scope 26 0.27083333
    ## 6      Pending 14 0.14583333
    ## 7    Scheduled 11 0.11458333

![](Williams-Audits-Project_files/figure-gfm/Audit%20Status-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/Audit%20Status-2.png)<!-- -->

Audit Status is a useful variabel as it informs the reader about the
possible status of the 96 Audits. Looking at the values we can see that
only 4 of the 96 Audits have been completed. This can be useful to
managers, for example a business leader might look at the 26 “Not in
Scope” Audits and say this might be a good indicator that the people who
ask for audits need a training to identify what the scope of an audit
is.

### In USA or OUS

    ##   vars  n    perc
    ## 1  OUS 45 0.46875
    ## 2  USA 51 0.53125

![](Williams-Audits-Project_files/figure-gfm/in%20USA%20or%20OUS-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/in%20USA%20or%20OUS-2.png)<!-- -->

This analyses shows that audits are evenly split betweeen the USA and
out of the USA. This suggests that the company has roughly even amounts
of clients from the US versus outside of the US. In a business this
varibael can be useful inc onjucntion with others, such as the Audit
Status, to show the diffrences in US Clients versus foreign clients.

### GxP Area

    ##      vars  n       perc
    ## 1     GCP 34 0.35416667
    ## 2     GDP  7 0.07291667
    ## 3     GLP 14 0.14583333
    ## 4     GMP 33 0.34375000
    ## 5 GMP/GDP  2 0.02083333
    ## 6     GVP  6 0.06250000

![](Williams-Audits-Project_files/figure-gfm/GxP%20Area-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/GxP%20Area-2.png)<!-- -->

GxP Area is not a straight forward variable, and is better explained by
the Data Directory:

GCP: Good Clinical Practice audits GLP: Good Laboratory Practice audit  
GMP: Good Manufacturing Practice, audits of manufacturing sites  
GDP: Good Distribution Practice, audits of distribution and logistic
partners  
GVP: Good Vigilance Practice, Audits of pharmacovigilance service
providers

Each of these values represent the type of audits being performed. The
majority of the audits (69.8%) are in “Good Clinical Practice Audits”
and “Good Manufacturing Practice.” This suggests msot audits look at
clinical practices and manufacturing practices, but may also suggest
clients do not trust this company with as many other types of audits.
While technically possible, the distirbution here may also just shopw
the ratio of the diffrent types of audits.

### Audit Type

    ##                vars  n       perc
    ## 1         (Unknown)  5 0.05208333
    ## 2     Qualification 38 0.39583333
    ## 3   Requalification 50 0.52083333
    ## 4 Requalification/Q  3 0.03125000

![](Williams-Audits-Project_files/figure-gfm/Audit%20Type-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/Audit%20Type-2.png)<!-- -->

### Audit Method

    ##                                    vars  n       perc
    ## 1                             (Unknown)  4 0.04166667
    ## 2                                  None 24 0.25000000
    ## 3                               On Site 52 0.54166667
    ## 4 On Site \r\n*CSQA did not participate  1 0.01041667
    ## 5                             Q in 2016  1 0.01041667
    ## 6                         Questionnaire 10 0.10416667
    ## 7                                Remote  2 0.02083333
    ## 8                                   TBD  2 0.02083333

![](Williams-Audits-Project_files/figure-gfm/Audit%20Method-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/Audit%20Method-2.png)<!-- -->

### Proposed Quarter

    ##        vars  n       perc
    ## 1 (Unknown)  5 0.05208333
    ## 2        Q1 23 0.23958333
    ## 3        Q2 27 0.28125000
    ## 4        Q3 21 0.21875000
    ## 5   Q3 - Q4  3 0.03125000
    ## 6        Q4 17 0.17708333

![](Williams-Audits-Project_files/figure-gfm/Proposed%20Quarter-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/Proposed%20Quarter-2.png)<!-- -->
