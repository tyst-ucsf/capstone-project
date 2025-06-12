# Table 1 for capstone
library(readr)
library(dplyr)
library(gtsummary)
library(gt)
library(forcats)


setwd('/Users/tylerstepaniak/Desktop/Jupyter Area/capstone-project/capstone-project-subfolder/Table 1')
df_main <- read_csv("df_main_normalized.csv")

df_main <- df_main %>%
  select(`TB Status`, Age, BMI, `HIV Status`) %>%
  mutate(across(everything(), ~ ifelse(. == -1, NA, .))) %>%
  mutate(
    `TB Status` = factor(`TB Status`, levels = c(0, 1),
                         labels = c("TB Negative", "TB Positive")),
    `HIV Status` = factor(`HIV Status`, levels = c(0, 1),
                          labels = c("HIV Negative", "HIV Positive"))
  )

table1_gt <- df_main %>%
  tbl_summary(
    by = `TB Status`,
    statistic = list(
      all_continuous() ~ "{median} [{p25}, {p75}]",
      all_categorical() ~ "{n} ({p}%)"
    ),
    missing = "no"
  ) %>%
  add_overall(last = TRUE) %>%
  add_p() %>%
  bold_labels()

table1_gt
