Williams Audit Analysis
================
Garland Williams
4/27/2020

  - [Audits Data Analysis: Part I](#audits-data-analysis-part-i)
      - [GWP Audits Variables](#gwp-audits-variables)
      - [CSQA Audits Variables](#csqa-audits-variables)
  - [WorkSheet Analysis: Part II](#worksheet-analysis-part-ii)
      - [GWP: Part II](#gwp-part-ii)
      - [CSQA: Part II](#csqa-part-ii)
  - [WorkSheet Analysis: Part III](#worksheet-analysis-part-iii)
  - [Conclusion](#conclusion)

## Audits Data Analysis: Part I

This is the output of G. Holt Williams’ Audits Data Analyst project.
This was created using R Markdown, and can be navigated using the tabs
below. Each dataset is within its own tab set, and the variables are
split into further tabs under each dataset.

``` r
##Read Data
#Computerized System Quality Assurance
CSQA<- read_excel("CSQA_Audit_Data.xlsx")

#Good Workign Practice
GWP<- read_excel("GXP_Audit_Data.xlsx")
```

### GWP Audits Variables

Here begins the analysis for the “Good Working Practices” Dataset: GWP

1.  Audit Status
2.  In USA or OUS
3.  GxP Area
4.  Audit Type
5.  Audit Method
6.  Proposed Quarter

#### Audit Status

    ##           vars  n       perc
    ## 1    Cancelled  4 0.04166667
    ## 2       Closed 19 0.19791667
    ## 3    Completed  4 0.04166667
    ## 4  In Progress 18 0.18750000
    ## 5 Not In Scope 26 0.27083333
    ## 6      Pending 14 0.14583333
    ## 7    Scheduled 11 0.11458333

![](Williams-Audits-Project_files/figure-gfm/GWPAudit%20Status-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/GWPAudit%20Status-2.png)<!-- -->

Audit Status is a useful variabel as it informs the reader about the
possible status of the 96 Audits. Looking at the values we can see that
only 4 of the 96 Audits have been completed. This can be useful to
managers, for example a business leader might look at the 26 “Not in
Scope” Audits and say this might be a good indicator that the people who
ask for audits need a training to identify what the scope of an audit
is.

#### In USA or OUS

    ##   vars  n    perc
    ## 1  OUS 45 0.46875
    ## 2  USA 51 0.53125

![](Williams-Audits-Project_files/figure-gfm/GWPin%20USA%20or%20OUS-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/GWPin%20USA%20or%20OUS-2.png)<!-- -->

This analyses shows that audits are evenly split betweeen the USA and
out of the USA. This suggests that the company has roughly even amounts
of clients from the US versus outside of the US. In a business this
variabel can be useful in conjucntion with others, such as the Audit
Status, to show the diffrences in US Clients versus foreign clients.

#### GxP Area

    ##      vars  n       perc
    ## 1     GCP 34 0.35416667
    ## 2     GDP  7 0.07291667
    ## 3     GLP 14 0.14583333
    ## 4     GMP 33 0.34375000
    ## 5 GMP/GDP  2 0.02083333
    ## 6     GVP  6 0.06250000

![](Williams-Audits-Project_files/figure-gfm/GWPGxP%20Area-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/GWPGxP%20Area-2.png)<!-- -->

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
While technically possible, the distirbution here may also just show the
ratio of the diffrent types of audits that are performed (i.e. GDP
Audits just aren’t performed on a regular basis)

#### Audit Type

    ##                vars  n       perc
    ## 1         (Unknown)  5 0.05208333
    ## 2     Qualification 38 0.39583333
    ## 3   Requalification 50 0.52083333
    ## 4 Requalification/Q  3 0.03125000

![](Williams-Audits-Project_files/figure-gfm/GWPAudit%20Type-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/GWPAudit%20Type-2.png)<!-- -->

Audit type is the first variable that has data that may be considerred
“out of range.” The unknown category lets managers know that data is
being added without a category in audit types, but should likely not be
included in the percentage analysis for this variable. It is fine to
include it in the counts analysis as alerts managers to their existence.

#### Audit Type: Clean

    ##                vars  n       perc
    ## 1     Qualification 38 0.41758242
    ## 2   Requalification 50 0.54945055
    ## 3 Requalification/Q  3 0.03296703

![](Williams-Audits-Project_files/figure-gfm/GWPClean%20Audit%20Type-1.png)<!-- -->

The above is the same Audit Type analysis without the existence of the
(Unknown) label. The percentages do not change much, but give a clearer
picture to the different type sof audits being performed. This
particular variable looks to be tracking New qualifications versus
requalification of previous audits, which may indicate repeat versus new
customers or customer areas.

#### Audit Method

    ##                                    vars  n       perc
    ## 1                             (Unknown)  4 0.04166667
    ## 2                                  None 24 0.25000000
    ## 3                               On Site 52 0.54166667
    ## 4 On Site \r\n*CSQA did not participate  1 0.01041667
    ## 5                             Q in 2016  1 0.01041667
    ## 6                         Questionnaire 10 0.10416667
    ## 7                                Remote  2 0.02083333
    ## 8                                   TBD  2 0.02083333

![](Williams-Audits-Project_files/figure-gfm/GWPAudit%20Method-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/GWPAudit%20Method-2.png)<!-- -->

Audit Method can help decision makers decide how to appropiately staff
auditers and to see what capabilties they can invest into the future.
This variable can also be helped by performing some cleaning actions to
it.

#### Audit Method: Clean

    ##                                    vars  n       perc
    ## 1                               On Site 52 0.76470588
    ## 2 On Site \r\n*CSQA did not participate  1 0.01470588
    ## 3                             Q in 2016  1 0.01470588
    ## 4                         Questionnaire 10 0.14705882
    ## 5                                Remote  2 0.02941176
    ## 6                                   TBD  2 0.02941176

![](Williams-Audits-Project_files/figure-gfm/GWPAudit%20Method%20Clean-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/GWPAudit%20Method%20Clean-2.png)<!-- -->

In the above graphs we removed values where Audit Methods equaled
“(Unknown)” and “None,” as they do not show what actual methods were
used and are caused by audits that were not performed or whose
label.status was “Not in Scope.” By removing those values we see a truer
picture which shows just over 75% of audits are performed on Site. “TBD”
values look to be audits that have not been performed and could
similarly be removed, but due to the low value here is likely
unnecessary.

#### Proposed Quarter

    ##        vars  n       perc
    ## 1 (Unknown)  5 0.05208333
    ## 2        Q1 23 0.23958333
    ## 3        Q2 27 0.28125000
    ## 4        Q3 21 0.21875000
    ## 5   Q3 - Q4  3 0.03125000
    ## 6        Q4 17 0.17708333

![](Williams-Audits-Project_files/figure-gfm/GWPProposed%20Quarter-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/GWPProposed%20Quarter-2.png)<!-- -->

While the data dictionary for this varibale is light on what information
is being conveyed, intuitevely it looks to be dates of when audits were
performed or are going to be performed. The graphs show a pretty even
spread with a high in Q2 and a low in Q4. Depending on which quarter
system this relies on, the seasonal variatiosn are likely due to
regualtion on when and how audits are performed. To decision makers this
can be useful as they know to staff audters higher in Q1-Q2 and can
refocus workers in Q3 or train new workers during Q4. This variable can
also use some cleaning.

#### Proposed Quarter: Clean

    ##      vars  n       perc
    ## 1      Q1 23 0.25274725
    ## 2      Q2 27 0.29670330
    ## 3      Q3 21 0.23076923
    ## 4 Q3 - Q4  3 0.03296703
    ## 5      Q4 17 0.18681319

![](Williams-Audits-Project_files/figure-gfm/GWPProposed%20Quarter:clean-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/GWPProposed%20Quarter:clean-2.png)<!-- -->

### CSQA Audits Variables

Here begins the analysis for the “Computerized Systems Quality
Assurance” Dataset: CSQA

1.  Audit Status
2.  In USA or OUS
3.  GxP Area
4.  Audit Type
5.  Audit Method
6.  Proposed Quarter

#### Audit Status

    ##        vars n perc
    ## 1    Closed 3 0.25
    ## 2 Completed 9 0.75

![](Williams-Audits-Project_files/figure-gfm/Audit%20Status-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/Audit%20Status-2.png)<!-- -->

Audit Status is a useful variabel as it informs the reader about the
possible status of the 12 Audits. Looking at the values we can see that
9 of the 12 Audits have been completed. This is sueful to managers so
they can understadn the current work demands on their team

#### In USA or OUS

    ##   vars n perc
    ## 1  OUS 3 0.25
    ## 2  USA 9 0.75

![](Williams-Audits-Project_files/figure-gfm/in%20USA%20or%20OUS-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/in%20USA%20or%20OUS-2.png)<!-- -->

This analyses shows that CSQA audits are not evenly split betweeen the
USA and out of the USA. This suggests that the company has more CSQA
audits in the US versus outside of the US. In a business this variabel
can be useful in conjucntion with others, such as the Audit Status, to
show the diffrences in US Clients versus foreign clients.

#### GxP Area

    ##   vars  n       perc
    ## 1  GCP  1 0.08333333
    ## 2  GIS 10 0.83333333
    ## 3  GMP  1 0.08333333

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
majority of the audits (83.3%) are in “GIS” which is not listed in the
data dictionary which makes it difficult to understand what is shown.
This would be a good reason to go back to the client to better
understand their data.

#### Audit Type

    ##              vars n       perc
    ## 1        Internal 1 0.08333333
    ## 2   Qualification 2 0.16666667
    ## 3 Requalification 9 0.75000000

![](Williams-Audits-Project_files/figure-gfm/Audit%20Type-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/Audit%20Type-2.png)<!-- -->

This particular variable looks to be tracking New qualifications versus
requalification of previous audits, which may indicate repeat versus new
customers or customer areas.

#### Audit Method

\*Audit Type and Audit Method variables are mislabelled as each other in
the CSQA dataset. This is fixed in this analysis

    ##            vars  n      perc
    ## 1       On Site 10 0.8333333
    ## 2 Questionnaire  2 0.1666667

![](Williams-Audits-Project_files/figure-gfm/Audit%20Method-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/Audit%20Method-2.png)<!-- -->

Audit Method can help decision makers decide how to appropiately staff
auditers and to see what capabilties they can invest into the future.

#### Proposed Quarter

    ##   vars n       perc
    ## 1   Q1 4 0.33333333
    ## 2   Q2 1 0.08333333
    ## 3   Q3 7 0.58333333

![](Williams-Audits-Project_files/figure-gfm/Proposed%20Quarter-1.png)<!-- -->![](Williams-Audits-Project_files/figure-gfm/Proposed%20Quarter-2.png)<!-- -->

While the data dictionary for this varibale is light on what information
is being conveyed, intuitevely it looks to be dates of when audits were
performed or are going to be performed. Depending on which quarter
system this relies on, the seasonal variatiosn are likely due to
regualtion on when and how audits are performed. Q4 is missign which may
suggest this is a newer dataset that hasn’t existed durign a Q4 yet. To
decision makers this can be useful as they know to staff audters higher
in Q1 and Q3 and can refocus workers in Q4 or train new workers during
Q4.

## WorkSheet Analysis: Part II

### GWP: Part II

Here begins the analysis for the “Good Working Practices” Part II
Dataset: GWP

``` r
df<-read.csv("GXP_Audit_Data.csv")
df<- df[1:96,]
df$Days_Intake_QSent<-as.numeric(as.Date(df$Date.Q.sent, format='%m/%d/%y') - 
                          as.Date(df$Date.of.Intake, optional=TRUE, format='%m/%d/%y'))
output<-df[24]

output$Days_QSent_QReceived<-as.numeric(as.Date(df$Date.Q.Rcvd, format='%m/%d/%y') - 
                                          as.Date(df$Date.Q.sent, format='%m/%d/%y'))

output$Days_OnSiteScheduled_AuditStartDate<-as.numeric(as.Date(df$Audit.Start.Date, format='%m/%d/%y')-                                                   as.Date(df$Date.On.Site.Scheduled,format='%m/%d/%y'))

output$Days_StartDate_EndDate<-as.numeric(as.Date(df$Audit.Start.Date, format='%m/%d/%y')-
                              as.Date(df$Date.On.Site.Scheduled, format='%m/%d/%y'))

output$Days_AuditEnd_FinalReportDue<-as.numeric(as.Date(df$Date.Final..Report.Due, format='%m/%d/%y')-
                                                  as.Date(df$Audit.End.Date, format='%m/%d/%y'))

output$Days_FinalReportDue_CompletionDate<-as.numeric(as.Date(df$Date.of..Completion,format='%m/%d/%y') - as.Date(df$Date.Final..Report.Due, format='%m/%d/%y') )

output%>%summary()
```

    ##  Days_Intake_QSent Days_QSent_QReceived
    ##  Min.   : 1.00     Min.   :11.00       
    ##  1st Qu.: 1.00     1st Qu.:14.25       
    ##  Median : 2.00     Median :33.50       
    ##  Mean   :17.55     Mean   :29.70       
    ##  3rd Qu.: 9.50     3rd Qu.:40.50       
    ##  Max.   :89.00     Max.   :57.00       
    ##  NA's   :85        NA's   :86          
    ##  Days_OnSiteScheduled_AuditStartDate Days_StartDate_EndDate
    ##  Min.   :  0.00                      Min.   :  0.00        
    ##  1st Qu.: 28.00                      1st Qu.: 28.00        
    ##  Median : 47.00                      Median : 47.00        
    ##  Mean   : 54.49                      Mean   : 54.49        
    ##  3rd Qu.: 68.00                      3rd Qu.: 68.00        
    ##  Max.   :153.00                      Max.   :153.00        
    ##  NA's   :51                          NA's   :51            
    ##  Days_AuditEnd_FinalReportDue Days_FinalReportDue_CompletionDate
    ##  Min.   :28.00                Min.   :-15.00                    
    ##  1st Qu.:30.00                1st Qu.: -1.00                    
    ##  Median :30.00                Median :  0.00                    
    ##  Mean   :30.04                Mean   : -0.16                    
    ##  3rd Qu.:30.00                3rd Qu.:  1.00                    
    ##  Max.   :31.00                Max.   : 20.00                    
    ##  NA's   :46                   NA's   :71

  - Days\_QSent\_QReceived is likely the diffrence between the day the
    audit was sent and the audit was received by the customer. It does
    not apply to all audits because not all audits that are sent have
    been received by the customer.

  - Days\_StartDate\_EndDate does not apply to all audits as there are
    audits currently being done which would not have an end date

### CSQA: Part II

Here begins the analysis for the “Computerized Systems Quality
Assurance” Part II Dataset: CSQA

``` r
df<-read.csv("CSQA_Audit_Data.csv")

df$Days_Intake_QSent<-as.numeric(as.Date(df$Date.Q.sent, format='%m/%d/%y') - 
                                   as.Date(df$Date.of.Intake, optional=TRUE, format='%m/%d/%y'))
output<-df[25]

output$Days_QSent_QReceived<-as.numeric(as.Date(df$Date.Q.Rcvd, format='%m/%d/%y') - 
                                          as.Date(df$Date.Q.sent, format='%m/%d/%y'))
output$Days_OnSiteScheduled_AuditStartDate<-as.numeric(as.Date(df$Audit.Start.Date, format='%m/%d/%y') - 
                                                         as.Date(df$Date.On.Site..Scheduled, format='%m/%d/%y') )
output$Days_StartDate_EndDate<-as.numeric(as.Date(df$Audit.Start.Date, format='%m/%d/%y')-
                                            as.Date(df$Date.On.Site..Scheduled, format='%m/%d/%y'))
output$Days_AuditEnd_FinalReportDue<-as.numeric(as.Date(df$Date.Final...Report.Due, format='%m/%d/%y')-
                                                  as.Date(df$Audit.End.Date, format='%m/%d/%y'))
output$Days_FinalReportDue_CompletionDate<-as.numeric(as.Date(df$Date.of...Completion, format='%m/%d/%y') - as.Date(df$Date.Final...Report.Due, format='%m/%d/%y') )
#Then, compute the mean and median for each of the 6 Variables
output%>%summary()
```

    ##  Days_Intake_QSent Days_QSent_QReceived
    ##  Min.   :27.00     Min.   :14          
    ##  1st Qu.:38.75     1st Qu.:16          
    ##  Median :50.50     Median :18          
    ##  Mean   :50.50     Mean   :18          
    ##  3rd Qu.:62.25     3rd Qu.:20          
    ##  Max.   :74.00     Max.   :22          
    ##  NA's   :10        NA's   :10          
    ##  Days_OnSiteScheduled_AuditStartDate Days_StartDate_EndDate
    ##  Min.   :14.00                       Min.   :14.00         
    ##  1st Qu.:36.00                       1st Qu.:36.00         
    ##  Median :48.00                       Median :48.00         
    ##  Mean   :45.56                       Mean   :45.56         
    ##  3rd Qu.:55.00                       3rd Qu.:55.00         
    ##  Max.   :63.00                       Max.   :63.00         
    ##  NA's   :3                           NA's   :3             
    ##  Days_AuditEnd_FinalReportDue Days_FinalReportDue_CompletionDate
    ##  Min.   :30                   Min.   :-1.000                    
    ##  1st Qu.:30                   1st Qu.: 0.000                    
    ##  Median :30                   Median : 0.000                    
    ##  Mean   :30                   Mean   : 6.909                    
    ##  3rd Qu.:30                   3rd Qu.:10.000                    
    ##  Max.   :30                   Max.   :40.000                    
    ##  NA's   :3                    NA's   :1

  - Days\_QSent\_QReceived is likely the diffrence between the day the
    audit was sent and the audit was received by the customer. It does
    not apply to all audits because not all audits that are sent have
    been received by the customer.

  - Days\_StartDate\_EndDate does not apply to all audits as there are
    audits currently being done which would not have an end date

## WorkSheet Analysis: Part III

Without further information on the origin of the two datasets, I would
recommend to not merge the two datasets. One reason is size diffrence of
the two files. The GWP dataset has 96 rows versus the CSQA has 12 rows,
which would mean the merged dataset would be overly influenced by the
GWP dataset. Other reasons is the diffrence in the means for the
diffrent variables. Along the similar idea, the means and medians of
several of the variables are not close, and therefore the GWP dataset
woudl also have a large influence on a merged dataset.

While the above are reasons to not merge the datasets, it might be
useful to merge them for the ease of data analysis. If the merged
datasets contain an extra column with a variable indicating its origin,
automated analysis would likely be easier as a simple filter can choose
which data set to depict. When merging it would be prudent to make sure
all variables are labelled correctly in both data sets. For example the
Audit Method and Audit Type are mislabelled in CSQA.

## Conclusion

This project was made for ALY6000 as part of the Audit Analysis Project.

Code can be found at
<https://github.com/Holt-Williams/AuditAnalysisProject>

Librairies Utilized: tidyverse, rmarkdown, scales, stringr, ggrepel,
readxl, ggthemes

Thanks for reading\! -G. Holt Williams
