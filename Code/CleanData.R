here::i_am("Code/CleanData.R")

library(dplyr)
library(openxlsx)

raw_data <- read.xlsx(here::here("Raw_Data", "GA_SeatBeltSurvey_2023_Adult_Final.xlsx"))

clean_data <- raw_data %>%
  mutate(Seat_Belt_Status = case_when(
    Belted == 1 ~ "Belted",
    Not_Belted == 1 ~ "Not Belted",
    Belted_Unknown == 1 ~ "Unknown",
    TRUE ~ NA_character_  # in case none are 1
  ))

saveRDS(clean_data, here::here("Clean_Data/Clean_Data.RDS"))
