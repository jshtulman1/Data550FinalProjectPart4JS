library(here)
library(ggplot2)
library(Hmisc)

here::i_am("Code/Figure1.R")

Clean_Data_Figure <- readRDS(here::here("Clean_Data", "Clean_Data.RDS"))

Fig1 <- ggplot(Clean_Data_Figure, aes(
  x = Weather_Conditions,
  fill = factor(Seat_Belt_Status,
                levels = c("Belted", "Not Belted", "Unknown")))) +
  geom_bar(position = position_fill(reverse = TRUE)) +  
  scale_y_continuous(breaks = seq(0, 1, by = 0.25)) +    
  labs(x = "Weather Condition", y = "Proportion", fill = "Belt Status") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

saveRDS(Fig1, here::here("Tables_Figures/Seatbelt_Weather_Figure.rds"))
