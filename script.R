install.packages("devtools")
devtools::install_github("jhudsl/collegeIncome")
library(collegeIncome)
data(college)

devtools::install_github("jhudsl/matahari")
library(matahari)

dance_start(value = FALSE, contents = FALSE)

head(college)
summary(college)
sum(college$total)
sum(college$perc_employed)
college$major_category <- as.factor(college$major_category)
library(dplyr)
income <- college %>%
        select(major_category, median) %>%
                group_by(major_category) %>%
                        summarise(median = mean(median))
plot(income$major_category, income$median)

dance_save("college_major_analysis.rds")
