
library(gtsummary)
library(here)
library(dplyr) 

here::i_am("Code/TableOne.R")

clean_data <- readRDS(here::here("Clean Data", "Clean_Data.RDS"))

table_one <- clean_data %>%
  select(Seat_Belt_Status, Driver_Sex, Vehicle_Type, Race_Ethnicity, Age_Reduced, Type) %>%
  tbl_summary(
    by = Seat_Belt_Status,
    percent = "row",
    label = list(
      Driver_Sex = "Sex",
      Vehicle_Type = "Vehicle Type",
      Race_Ethnicity = "Ethnicity",
      Age_Reduced = "Age Group",
      Type = "Road Type"
  ) )%>%
  as_gt()
table_one

saveRDS(table_one, here::here("Tables & Figures/table_one.RDS"))
