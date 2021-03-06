##Audit Analysis

##Read Data

#Computerized System Quality Assurance
CSQA<- read_excel("CSQA_Audit_Data.xlsx")

#Good Workign Practice
GWP<- read_excel("GXP_Audit_Data.xlsx")

#Audit Status
#In USA or OUS
#GxP Area
#Audit Type 
#Audit Method
#Proposed Quart

# 1. A table that provides the frequency and percent of each value 
# 2. A graphic representation of the count of each value 
# 3. A graphic representation of the percent of each value 
# 4. What business question do your descriptive analyses answer? 


#GWP Audit Status
label<-"Audit Status"
counts<- count(GWP,vars=Audit.Status)
percent<-prop.table(counts$n)
df<-as.data.frame(counts)
df$perc<-percent
df
df$dummy<-1

# df%>%ggplot(aes(x=reorder(vars,-n),n,label=c(n),fill=vars))+
#   geom_col()+
#   geom_text(nudge_y=1)+
#   scale_y_continuous(sec.axis=)
#   coord_flip(ylim=c())+
#   labs(title="Audit Status",
#        subtitle="GWP DataSet",
#        y= "Counts",
#        x=NULL)+scale_y_continuous(label=comma)
#   
# GWP%>%ggplot(aes(Audit.Status))+geom_bar()+theme_economist()
#   
  df%>%ggplot(aes(x=dummy, y=-n,fill=vars))+
    geom_bar(stat="identity")+
    geom_text(aes(label=n),position=position_stack(vjust=0.5))+
    coord_flip()+
    labs(title=label,
         subtitle=paste("GWP DataSet:","Counts of",label, sep=" "),
         x=NULL)+
    theme_fivethirtyeight()+
    theme( axis.text.x = element_blank(),
           axis.text.y = element_blank(),
           axis.ticks = element_blank())
  
  df%>%ggplot(aes(x=dummy, y=-percent*100,fill=vars))+
    geom_bar(stat="identity")+
    geom_text(aes(label=scales::percent(percent)),position=position_stack(vjust=0.55))+
    coord_flip()+
    labs(title="Audit Status",
         subtitle=paste("GWP DataSet:",label, "Percentages", sep=" "),
         x=NULL)+
    theme_fivethirtyeight()+
    theme( axis.text.x = element_blank(),
           axis.text.y = element_blank(),
           axis.ticks = element_blank())
  
#ggrepel_test
  
  label<-"Audit Method"
  counts<- count(GWP,vars=Audit.Method)
  percent<-prop.table(counts$n)
  df<-as.data.frame(counts)
  df$perc<-percent
  df
  df$dummy<-1
  df%>%ggplot(aes(x=dummy, y=-n,fill=vars))+
    geom_bar(stat="identity")+
    geom_text(aes(label=n),position=position_stack(vjust=0.5))+
    coord_flip()+
    labs(title=label,
         subtitle=paste("GWP DataSet:","Counts of",label, sep=" "),
         x=NULL)+
    theme_fivethirtyeight()+
    theme( axis.text.x = element_blank(),
           axis.text.y = element_blank(),
           axis.ticks = element_blank())
  
  df%>%ggplot(aes(x=dummy, y=-percent*100,fill=vars))+
    geom_bar(stat="identity")+
    geom_text_repel(aes(label=scales::percent(percent)),position=position_stack(vjust=0.55),box.padding = unit(0.5, "lines"))+
    coord_flip()+
    labs(title=label,
         subtitle=paste("GWP DataSet:",label, "Percentages", sep=" "),
         x=NULL)+
    theme_fivethirtyeight()+
    theme( axis.text.x = element_blank(),
           axis.text.y = element_blank(),
           axis.ticks = element_blank())
  
  #test
  count(GWP%>%filter(Audit.Method != "(Unknown)",Audit.Method != "None"),vars=Audit.Method)
  
  
  namesCSQA<-colnames(CSQA)
  
  counts<- count(CSQA,vars=CSQA[[3]])
  
  
  
  
  ###Part II
  

df<-read.csv("GXP_Audit_Data.csv")
df<- df[1:96,]

# 1. “Date of Intake” and “Date Q Sent”. Name that variable “Days_Intake_QSent” 
df$Days_Intake_QSent<-as.numeric(as.Date(df$Date.Q.sent, format='%m/%d/%y') - 
                          as.Date(df$Date.of.Intake, optional=TRUE, format='%m/%d/%y'))
output<-df[24]
# 2. “Date Q Sent” and “Date Q Received”. Name that variable “Days_QSent_QReceived. 
#   Based on the name of the variables, what do you think that variable means? Does it apply to all audits? Why? 
output$Days_QSent_QReceived<-as.numeric(as.Date(df$Date.Q.Rcvd, format='%m/%d/%y') - 
                                          as.Date(df$Date.Q.sent, format='%m/%d/%y'))

# 3. “Date On Site Scheduled” and “Audit Start Date”. Name that variable “Days_OnSiteScheduled_AuditStartDate. Does this variable apply to all audits? Why? 
output$Days_OnSiteScheduled_AuditStartDate<-as.numeric(as.Date(df$Audit.Start.Date, format='%m/%d/%y') - 
                                                         as.Date(df$Date.On.Site.Scheduled, format='%m/%d/%y') )

# 4. “Audit Start Date and “Audit End Date”. Name that variable “Days_StartDate_EndDate”. 
output$Days_StartDate_EndDate<-as.numeric(as.Date(df$Audit.Start.Date, format='%m/%d/%y')-
                              as.Date(df$Date.On.Site.Scheduled, format='%m/%d/%y'))

# 5. “Audit End Date” and “Date Final Report Due”. Name that variable “Days_AuditEnd_FinalReportDue” 
output$Days_AuditEnd_FinalReportDue<-as.numeric(as.Date(df$Date.Final..Report.Due, format='%m/%d/%y')-
                                                  as.Date(df$Audit.End.Date, format='%m/%d/%y'))

# 6. “Date Final Report Due” and “Date of Completion”. Name that variable “Days_FinalReportDue_CompletionDate” 
output$Days_FinalReportDue_CompletionDate<-as.numeric(as.Date(df$Date.of..Completion, format='%m/%d/%y') - 
                      as.Date(df$Date.Final..Report.Due, format='%m/%d/%y') )

#Then, compute the mean and median for each of the 6 Variables

output%>%summary()

##CSQA DatSAet
df<-read.csv("CSQA_Audit_Data.csv")


# 1. “Date of Intake” and “Date Q Sent”. Name that variable “Days_Intake_QSent” 
df$Days_Intake_QSent<-as.numeric(as.Date(df$Date.Q.sent, format='%m/%d/%y') - 
                                   as.Date(df$Date.of.Intake, optional=TRUE, format='%m/%d/%y'))
output<-df[25]
# 2. “Date Q Sent” and “Date Q Received”. Name that variable “Days_QSent_QReceived. 
#   Based on the name of the variables, what do you think that variable means? Does it apply to all audits? Why? 
output$Days_QSent_QReceived<-as.numeric(as.Date(df$Date.Q.Rcvd, format='%m/%d/%y') - 
                                          as.Date(df$Date.Q.sent, format='%m/%d/%y'))

# 3. “Date On Site Scheduled” and “Audit Start Date”. Name that variable “Days_OnSiteScheduled_AuditStartDate. Does this variable apply to all audits? Why? 
output$Days_OnSiteScheduled_AuditStartDate<-as.numeric(as.Date(df$Audit.Start.Date, format='%m/%d/%y') - 
                                                         as.Date(df$Date.On.Site..Scheduled, format='%m/%d/%y') )

# 4. “Audit Start Date and “Audit End Date”. Name that variable “Days_StartDate_EndDate”. 
output$Days_StartDate_EndDate<-as.numeric(as.Date(df$Audit.Start.Date, format='%m/%d/%y')-
                                            as.Date(df$Date.On.Site..Scheduled, format='%m/%d/%y'))

# 5. “Audit End Date” and “Date Final Report Due”. Name that variable “Days_AuditEnd_FinalReportDue” 
output$Days_AuditEnd_FinalReportDue<-as.numeric(as.Date(df$Date.Final...Report.Due, format='%m/%d/%y')-
                                                  as.Date(df$Audit.End.Date, format='%m/%d/%y'))

# 6. “Date Final Report Due” and “Date of Completion”. Name that variable “Days_FinalReportDue_CompletionDate” 
output$Days_FinalReportDue_CompletionDate<-as.numeric(as.Date(df$Date.of...Completion, format='%m/%d/%y') - 
                                                        as.Date(df$Date.Final...Report.Due, format='%m/%d/%y') )

#Then, compute the mean and median for each of the 6 Variables

output%>%summary()
