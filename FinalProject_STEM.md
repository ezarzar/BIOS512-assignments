Data: College Majors by Gender
------------------------------

For this data visualization, a dataset containing information about the
gender distribution of different college majors and major areas was
obtained from the FiveThirtyEight Github. The dataset (women-stem.csv)
contains a list of college majors with their more generalized associated
major categories (Engineering, Physical Sciences, Computers &
Mathematics, Health, Biology & Life Science), which are from Carnevale
et al, "What's It Worth?: The Economic Value of College Majors."
Georgetown University Center on Education and the Workforce, 2011.
<http://cew.georgetown.edu/whatsitworth>. The dataset also contains
information from the American Community Survey 2010-2012 Public Use
Microdata Series regarding the total number of men and women in each
major during this time frame, as well as a column indicating the
proportion of women in each major (ShareWomen). A preview of this
dataset is shown below:

    ##   Rank Major_code                                     Major Major_category
    ## 1    1       2419                     PETROLEUM ENGINEERING    Engineering
    ## 2    2       2416            MINING AND MINERAL ENGINEERING    Engineering
    ## 3    3       2415                 METALLURGICAL ENGINEERING    Engineering
    ## 4    4       2417 NAVAL ARCHITECTURE AND MARINE ENGINEERING    Engineering
    ## 5    5       2418                       NUCLEAR ENGINEERING    Engineering
    ## 6    6       2405                      CHEMICAL ENGINEERING    Engineering
    ##   Total   Men Women ShareWomen Median
    ## 1  2339  2057   282  0.1205643 110000
    ## 2   756   679    77  0.1018519  75000
    ## 3   856   725   131  0.1530374  73000
    ## 4  1258  1123   135  0.1073132  70000
    ## 5  2573  2200   373  0.1449670  65000
    ## 6 32260 21239 11021  0.3416305  65000

Data Cleaning (Visualization \#1)
---------------------------------

To further analyze the gender distribution of different collge major
categories, it was necessary to create a column containing the
proportion of men in each major (ShareMen). In addition, the dataset was
grouped by major category and the average proportion of men and women in
each major category was calculated, creating the Total\_Men and
Total\_Women columns, labled as "Female Students" and "Male Students".
The final dataset used for the visualization contained only the
Major\_Category, Total\_Women, and Total\_Men columns, as shown below.

    ## ── Attaching packages ───────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.2.0     ✔ purrr   0.3.2
    ## ✔ tibble  2.1.3     ✔ dplyr   0.8.1
    ## ✔ tidyr   0.8.3     ✔ stringr 1.4.0
    ## ✔ readr   1.3.1     ✔ forcats 0.4.0

    ## ── Conflicts ──────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

    ## 
    ## Attaching package: 'plotly'

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     last_plot

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

    ## The following object is masked from 'package:graphics':
    ## 
    ##     layout

Which Major Categories Have the Most Women?
-------------------------------------------

As shown below, women tend to dominate the health field while the the
fields of engineering and computer science & mathematics are largely
dominanted by male students.

![](FinalProject_STEM_files/figure-markdown_strict/unnamed-chunk-3-1.png)

Data Cleaning (Visualization \#2)
---------------------------------

Each of these major categories consists of many majors. To further
examine which specific college majors are most popular amongst female
students and male students, I subsetted the data to only contain the top
10 college majors with the highest proportion of female students as well
as the top 10 college majors with the highest proportion of male
students. These datasets (named mostwomen and mostmen) as well as their
respective barplots showing the gender distributions for these majors
are shown below.

    ##                                                         Major
    ## 1                                                     NURSING
    ## 2  NUCLEAR, INDUSTRIAL RADIOLOGY, AND BIOLOGICAL TECHNOLOGIES
    ## 3                            MEDICAL TECHNOLOGIES TECHNICIANS
    ## 4                                  MEDICAL ASSISTING SERVICES
    ## 5                    MISCELLANEOUS HEALTH MEDICAL PROFESSIONS
    ## 6                  HEALTH AND MEDICAL ADMINISTRATIVE SERVICES
    ## 7                                          NUTRITION SCIENCES
    ## 8                                 COMMUNITY AND PUBLIC HEALTH
    ## 9                         GENERAL MEDICAL AND HEALTH SERVICES
    ## 10              COMMUNICATION DISORDERS SCIENCES AND SERVICES
    ##    Female Students Male Students
    ## 1         89.60190     10.398101
    ## 2         75.04726     24.952741
    ## 3         75.39274     24.607264
    ## 4         92.78072      7.219275
    ## 5         88.12939     11.870611
    ## 6         76.44265     23.557347
    ## 7         86.44561     13.554392
    ## 8         79.20953     20.790474
    ## 9         77.45766     22.542338
    ## 10        96.79981      3.200188

    ##                                          Major Female Students
    ## 1                        PETROLEUM ENGINEERING       12.056434
    ## 2               MINING AND MINERAL ENGINEERING       10.185185
    ## 3                    METALLURGICAL ENGINEERING       15.303738
    ## 4    NAVAL ARCHITECTURE AND MARINE ENGINEERING       10.731320
    ## 5                          NUCLEAR ENGINEERING       14.496697
    ## 6                       MECHANICAL ENGINEERING       11.955890
    ## 7                        AEROSPACE ENGINEERING       13.979280
    ## 8        ENGINEERING AND INDUSTRIAL MANAGEMENT       17.412251
    ## 9             MATHEMATICS AND COMPUTER SCIENCE       17.898194
    ## 10 MECHANICAL ENGINEERING RELATED TECHNOLOGIES        7.745303
    ##    Male Students
    ## 1       87.94357
    ## 2       89.81481
    ## 3       84.69626
    ## 4       89.26868
    ## 5       85.50330
    ## 6       88.04411
    ## 7       86.02072
    ## 8       82.58775
    ## 9       82.10181
    ## 10      92.25470

![](FinalProject_STEM_files/figure-markdown_strict/unnamed-chunk-5-1.png)

![](FinalProject_STEM_files/figure-markdown_strict/unnamed-chunk-6-1.png)

Women in STEM: Conclusion
-------------------------

There has been a large societal push in recent years to encourage and
promote Women in STEM (Science, Technology, Engineering, and
Mathematics), as research has found many barriers can impede women's
progress in STEM. This includes gender stereotypes and the overall
environment of science and engineering departments in colleges and
universities. As indicated by the plots above, women make up a large
proportion of students in scientific fields related to health and
medicine. However, there is still more to be done to increase women
participation in the fields of engineering, mathematics, and computer
science, as these fields appear dominated by males according to this
data.
