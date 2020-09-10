library(shiny)
library(tidyverse)

df<-
  read.csv("https://raw.githubusercontent.com/Shampjeff/CUNY_DATA_608/master/module3/data/cleaned-cdc-mortality-1999-2010-2.csv")

# Clean up diseases for drop down
df<- 
  df %>%
  mutate(
    ICD.Chapter = str_remove_all(ICD.Chapter,
                                 pattern = "Diseases of the ")) %>%
  mutate(
    ICD.Chapter = case_when(
      str_detect(ICD.Chapter, "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified") ~
        "Unclassified findings",
      str_detect(ICD.Chapter, "blood and blood-forming organs and certain disorders involving the immune mechanism") ~
        "Blood disorder from immune system",
      str_detect(ICD.Chapter, "Endocrine, nutritional and metabolic diseases") ~
        "Endocrine, nutritional and metabolic",
      str_detect(ICD.Chapter, "musculoskeletal system and connective tissue") ~
        "Musculoskeletal", 
      str_detect(ICD.Chapter, "Congenital malformations, deformations and chromosomal abnormalities") ~
        "Congenital or chromosomal abnormalities",
      str_detect(ICD.Chapter, "Certain conditions originating in the perinatal period") ~
        "Conditions of the perinatal period", 
      str_detect(ICD.Chapter, "Certain infectious and parasitic diseases") ~ 
        "Infectious and parasitic", 
      str_detect(ICD.Chapter, "Pregnancy, childbirth and the puerperium") ~
        "Pregnancy, childbirth", 
      str_detect(ICD.Chapter, "External causes of morbidity and mortality") ~
        "External causes of mortality",
      TRUE ~ ICD.Chapter
    ), 
    ICD.Chapter = str_to_title(ICD.Chapter)
  )

disease_list<- df %>% select(ICD.Chapter) %>% unique()
state_list<- df %>% select(State) %>% unique()

disease_list<- disease_list[disease_list != c("Ear And Mastoid Process",
                                              "Codes For Special Purposes" )]
disease_list

df %>%
  filter(Crude.Rate != 0) %>%
  group_by(Year, ICD.Chapter) %>%
  mutate(nation_rate = round( sum(Deaths) / sum(Population) * 100000, 3 )) %>%
  group_by(Year, ICD.Chapter, State) %>%
  filter(State == "AL",
         ICD.Chapter == "Infectious And Parasitic") %>%
  ggplot() +
  geom_line(aes(Year, Crude.Rate, color = "State"),
            alpha = 1, size=1.5) +
  geom_line(aes(Year, nation_rate, color = "National Average"),
            alpha = 0.8, size=1.5) +
  scale_color_manual(name = NULL,
                     values=c("State" = "aquamarine4",
                              "National Average" = "red")) +
  theme_classic() +
  theme(legend.position=c(.90,.95),
        legend.text = element_text(colour="black", size =12))


