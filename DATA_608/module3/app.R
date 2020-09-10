library(shiny)
library(tidyverse)


# DATA
df<- 
  read.csv("https://raw.githubusercontent.com/Shampjeff/CUNY_DATA_608/master/module3/data/cleaned-cdc-mortality-1999-2010-2.csv")

# Clean up diseases for drop down and data prep
df<- 
  df %>%
  mutate(
    ICD.Chapter = str_remove_all(ICD.Chapter,
                                 pattern = "Diseases of the ")) %>%
  mutate(
    ICD.Chapter = case_when(
      str_detect(ICD.Chapter, 
                 "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified") ~
                 "Unclassified findings",
      str_detect(ICD.Chapter, 
                 "blood and blood-forming organs and certain disorders involving the immune mechanism") ~
                 "Blood disorder from immune system",
      str_detect(ICD.Chapter, 
                 "Endocrine, nutritional and metabolic diseases") ~
                 "Endocrine, nutritional and metabolic",
      str_detect(ICD.Chapter, 
                 "musculoskeletal system and connective tissue") ~
                 "Musculoskeletal", 
      str_detect(ICD.Chapter, 
                 "Congenital malformations, deformations and chromosomal abnormalities") ~
                 "Congenital or chromosomal abnormalities",
      str_detect(ICD.Chapter, 
                 "Certain conditions originating in the perinatal period") ~
                 "Conditions of the perinatal period", 
      str_detect(ICD.Chapter, 
                 "Certain infectious and parasitic diseases") ~ 
                 "Infectious and parasitic", 
      str_detect(ICD.Chapter, 
                 "Pregnancy, childbirth and the puerperium") ~
                 "Pregnancy, childbirth", 
      str_detect(ICD.Chapter, 
                 "External causes of morbidity and mortality") ~
                 "External causes of mortality",
      TRUE ~ ICD.Chapter
    ), 
    ICD.Chapter = str_to_title(ICD.Chapter)
  ) 

# cleaned list of CODs ans states
disease_list<- df %>% rename(Disease = ICD.Chapter) %>% select(Disease) %>% unique()
disease_list<- disease_list[disease_list != c("Ear And Mastoid Process",
                                              "Codes For Special Purposes" )]

state_list<- df %>% select(State) %>% unique()

# Question 1 data
df_1<- df %>% filter(Year == 2010, 
                     Crude.Rate != 0) 

## SHINY Template Structure

ui <- fluidPage(
  tabsetPanel(
    tabPanel("Crude Rate by State",
      titlePanel("2010 Crude Mortality Rate by State"),
  
      selectInput(inputId="disease", 
              label="Choose a disease", 
              choices=c(disease_list), 
              selected = "Infectious And Parasitic"),
  
      mainPanel(
        plotOutput("disease_by_state",
                  width = "100%"))), 
    
    tabPanel("National Average Comparison", 
      titlePanel("State Comparison to National Average"), 
      fluidRow(
        column(width = 6,
          selectInput(inputId="disease_1", 
                      label="Choose a disease", 
                      choices=c(disease_list), 
                      selected = "Infectious And Parasitic")),
        column(width=6,
          selectInput(inputId="state", 
                      label="Choose a state", 
                      choices=c(state_list), 
                      selected = "AL"))
        ),
      mainPanel(
        plotOutput("state_v_nation",
                   width = "100%"))
                  )
              )
          )
      


server <- function(input, output) {
  output$disease_by_state<- renderPlot({
    
    df_1 %>%
      filter(ICD.Chapter == input$disease) %>%
      ggplot(aes(x=reorder(State, Crude.Rate),
                 y=Crude.Rate)) +
      geom_col(fill="aquamarine4") +
      geom_text(aes(label=Crude.Rate), hjust=-0.2) +
      labs(x="State",
           y = "Rate") +
      coord_flip() +
      theme_classic() + 
      theme(axis.title=element_text(size=12), 
            axis.text=element_text(size=13))
  }, height = 625, width = 600)
  
 
  output$state_v_nation<- renderPlot({
    
    df %>%
      filter(Crude.Rate != 0) %>%
      group_by(Year, ICD.Chapter) %>%
      mutate(nation_rate = round( sum(Deaths) / sum(Population) * 100000, 3 )) %>%
      group_by(Year, ICD.Chapter, State) %>%
      filter(State == input$state, 
             ICD.Chapter == input$disease_1) %>%
      ggplot() +
      geom_line(aes(Year, Crude.Rate, color = "State"),
                alpha = 1, size=1.5) +
      geom_line(aes(Year, nation_rate, color = "National Average"), 
                alpha = 0.8, size=1.5) + 
      scale_color_manual(name = NULL, 
                         values=c("State" = "aquamarine4",
                                  "National Average" = "red")) +
      labs(x="Year", y="Rates") + 
      theme_classic() +
      theme(legend.position=c(0.90,0.98), 
            legend.text = element_text(colour="black", size =12),
            axis.title=element_text(size=12), 
            axis.text=element_text(size=13))
    
  }, height = 500, width = 700)
  
  
}

shinyApp(ui = ui, server = server)


