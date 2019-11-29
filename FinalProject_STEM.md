---
title: "BIOS 512 Data Visualization- Women In STEM"
author: "Liz Zarzar"
date: "11/20/2019"
output:
  html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

```

## Data: College Majors by Gender

For this data visualization, a dataset containing information about the gender distribution of different college majors and major areas was obtained from the FiveThirtyEight Github. The dataset (women-stem.csv) contains a list of college majors with their more generalized associated major categories (Engineering, Physical Sciences, Computers & Mathematics, Health, Biology & Life Science), which are from Carnevale et al, "What's It Worth?: The Economic Value of College Majors." Georgetown University Center on Education and the Workforce, 2011. http://cew.georgetown.edu/whatsitworth. The dataset also contains information from the American Community Survey 2010-2012 Public Use Microdata Series regarding the total number of men and women in each major during this time frame, as well as a column indicating the proportion of women in each major (ShareWomen). A preview of this dataset is shown below:

```{r}
df = read.csv('https://raw.githubusercontent.com/fivethirtyeight/data/master/college-majors/women-stem.csv')
head(df)
```


## Data Cleaning (Visualization #1)

To further analyze the gender distribution of different collge major categories, it was necessary to create a column containing the proportion of men in each major (ShareMen). In addition, the dataset was grouped by major category and the average proportion of men and women in each major category was calculated, creating the Total_Men and Total_Women columns, labled as "Female Students" and "Male Students". The final dataset used for the visualization contained only the Major_Category, Total_Women, and Total_Men columns, as shown below. 

```{r}
library(htmlwidgets)
library('tidyverse')
library('plotly')
library(ggthemes)
library(forcats)

#Create ShareMen Column (Proportion of Men by Major)
df$ShareMen <- with(df,(Men / Total))

#DATA CLEANING: MAJOR CATEGORY BY GENDER (AVERAGE PROPORTION OF MEN vs. WOMEN by MAJOR CATEGORY)
df = df %>% group_by(Major_category)  %>% summarise(Total_Women = (mean(ShareWomen)*100), Total_Men = (mean(ShareMen)*100))


names(df)[2] <- "Female Students"
names(df)[3] <- "Male Students"
```


## Which Major Categories Have the Most Women?

As shown below, women tend to dominate the health field while the the fields of engineering and computer science & mathematics are largely dominanted by male students.

```{r}
#PLOT OF MAJOR CATEGORY BY GENDER (AVERAGE PROPORTION OF MEN vs. WOMEN)
knitr::opts_chunk$set(fig.width=10, fig.height=8) 
p2 = ggplot(data = df %>% gather(Variable, value, -Major_category), 
       aes(x = reorder(Major_category, value), y = value, fill = Variable, some_dummy_mapping = value[Variable])) + geom_bar(stat = 'identity', position = 'stack')
p2 = p2 +  theme(panel.border = element_blank(),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank()) 
p2 = p2 + xlab("Major Category") + ylab("Percent") + ggtitle("Major Category by Gender") +  geom_text(aes(label=sprintf("%0.2f", round(value, digits = 2))), position= position_stack(vjust = 0.85), size=3.5) + scale_fill_brewer(palette="Blues") + theme_minimal()+ theme(axis.text.x = element_text(angle = 15, hjust = 1)) + theme(plot.title = element_text(hjust = 0.5)) + theme(legend.title = element_blank())

p2 = p2 + theme(plot.title = element_text(size=14, face="bold.italic"), axis.title.x = element_text(face="bold"),
axis.title.y = element_text(face="bold")) 
p2
```


## Data Cleaning (Visualization #2)

Each of these major categories consists of many majors. To further examine which specific college majors are most popular amongst female students and male students, I subsetted the data to only contain the top 10 college majors with the highest proportion of female students as well as the top 10 college majors with the highest proportion of male students. These datasets (named mostwomen and mostmen) as well as their respective barplots showing the gender distributions for these majors are shown below. 

```{r}

#COLLEGE MAJORS WITH HIGHEST PROPORTION OF WOMEN (TOP WOMEN'S COLLEGE MAJORS)
knitr::opts_chunk$set(fig.width=13, fig.height=8) 
df = read.csv('https://raw.githubusercontent.com/fivethirtyeight/data/master/college-majors/women-stem.csv')
#Create ShareMen Column (Proportion of Men by Major)

df$ShareWomen = with(df,(ShareWomen*100))
df$ShareMen = with(df,(Men/ Total)*100)

mostwomen = top_n(df, n=10,ShareWomen) 
mostwomen = mostwomen[ -c(1,2,4,5,6,7,9)]

names(mostwomen)[2] <- "Female Students"
names(mostwomen)[3] <- "Male Students"
print(mostwomen)

#COLLEGE MAJORS WITH HIGHEST PROPORTION OF MEN (TOP MEN'S COLLEGE MAJORS)
mostmen = top_n(df, n=10,ShareMen)
mostmen = mostmen[ -c(1,2,4,5,6,7,9)]

names(mostmen)[2] <- "Female Students"
names(mostmen)[3] <- "Male Students"
print(mostmen)
```
```{r}

#TOP WOMEN'S COLLEGE MAJORS PLOT
p3 = p2 = ggplot(data = mostwomen %>% gather(Variable, value, -Major), 
       aes(x = reorder(Major, value), y = value, fill = Variable, some_dummy_mapping = value[Variable])) + geom_bar(stat = 'identity', position = 'stack')
p3 = p3 +  theme(panel.border = element_blank(),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank()) 
p3 = p3 + xlab("Major Category") + ylab("Percent") + ggtitle("TOP COLLEGE MAJORS FEMALE STUDENTS") +  geom_text(aes(label=sprintf("%0.2f", round(value, digits = 2))), position= position_stack(vjust = 0.8), size=3.5) + scale_fill_brewer(palette="Blues") + theme_minimal()+ theme(plot.title = element_text(hjust = 0.5)) + theme(legend.title = element_blank()) + coord_flip()

p3 = p3 + theme(plot.title = element_text(size=14, face="bold.italic"), axis.title.x = element_text(face="bold"),
axis.title.y = element_text(face="bold")) 
p3 = ggplotly(p3, tooltip = c("value")) %>% as_widget() 
p3

#TOP MEN'S COLLEGE MAJORS PLOT

p4 = ggplot(data = mostmen %>% gather(Variable, value, -Major), 
       aes(x = reorder(Major, value), y = value, fill = Variable, some_dummy_mapping = value[Variable])) + geom_bar(stat = 'identity', position = 'stack')

p4 = p4 +  theme(panel.border = element_blank(),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank()) 
p4 = p4 + xlab("Major Category") + ylab("Percent") + ggtitle("TOP COLLEGE MAJORS MALE STUDENTS") +  geom_text(aes(label=sprintf("%0.2f", round(value, digits = 2))), position= position_stack(vjust = 0.8), size=3.5) + scale_fill_brewer(palette="Blues") + theme_minimal() + theme(plot.title = element_text(hjust = 3)) + theme(legend.title = element_blank()) + coord_flip()

p4 = p4 + theme(plot.title = element_text(size=14, face="bold.italic"), axis.title.x = element_text(face="bold"),
axis.title.y = element_text(face="bold"))
p4 = ggplotly(p4, tooltip = c("value")) %>% as_widget()
p4

```

## Women in STEM: Conclusion 

There has been a large societal push in recent years to encourage and promote Women in STEM (Science, Technology, Engineering, and Mathematics), as research has found many barriers can impede women's progress in STEM. This includes gender stereotypes and the overall environment of science and engineering departments in colleges and universities. As indicated by the plots above, women make up a large proportion of students in scientific fields related to health and medicine. However, there is still more to be done to increase women participation in the fields of engineering, mathematics, and computer science, as these fields appear dominated by males according to this data. 



