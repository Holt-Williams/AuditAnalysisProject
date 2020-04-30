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
  

  