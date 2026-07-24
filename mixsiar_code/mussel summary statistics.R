library(dplyr)
library(readr)

df <- read_csv('/Users/jdh/Library/CloudStorage/GoogleDrive-jakehosen@gmail.com/My Drive/Mussels Project/R Code/mussel_isotopes/food.csv')

colnames(df)

summary_stats <- df %>%
  group_by(`Site ID`, Material) %>%
  summarise(
    mean_d13C = mean(`δ13C VPDB`, na.rm = TRUE),
    sd_d13C   = sd(`δ13C VPDB`, na.rm = TRUE),
    n_d13C    = sum(!is.na(`δ13C VPDB`)),
    mean_d15N = mean(`δ15N At. Air`, na.rm = TRUE),
    sd_d15N   = sd(`δ15N At. Air`, na.rm = TRUE),
    n_d15N    = sum(!is.na(`δ15N At. Air`)),
    .groups = "drop"
  )

print(summary_stats)

write_csv(summary_stats, "/Users/jdh/Library/CloudStorage/GoogleDrive-jakehosen@gmail.com/My Drive/Mussels Project/R Code/mussel_isotopes/isotope_summary_by_site_material.csv")


library(dplyr)
library(readr)

df <- read_csv("C:/Users/alcol/AppData/Local/R/win-library/4.5/MixSIAR/mussels.csv")

colnames(df)

mussel_summary <- df %>%
  group_by(`Site ID`, `Mussel Species`, Season) %>%
  summarise(
    mean_d13C = mean(`13C VPDB`, na.rm = TRUE),
    sd_d13C   = sd(`13C VPDB`, na.rm = TRUE),
    n_d13C    = sum(!is.na(`13C VPDB`)),
    mean_d15N = mean(`15N At. Air`, na.rm = TRUE),
    sd_d15N   = sd(`15N At. Air`, na.rm = TRUE),
    n_d15N    = sum(!is.na(`15N At. Air`)),
    .groups = "drop"
  )

print(mussel_summary)

write_csv(mussel_summary, "C:/Users/alcol/AppData/Local/R/win-library/4.5/MixSIAR/mussel_isotope_summary_by_site_species_season.csv")