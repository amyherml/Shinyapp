
        
library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Steps Calculator"),
        sidebarPanel(
                textInput(inputId="Weight", label = "Input Weight in kilograms"),
                textInput(inputId="Hight", label = "Input Hight in meters"),
                actionButton("goButton", "Calculate BMI"),
                selectInput("aim", "What is your aim?",
                                   c("loss weight" = "loss weight",
                                     "maintain current weight" = "maintain current weight",
                                     "gain weight" = "gain weight"))
                
        ),
        mainPanel(
                h3('Weight in kg'),
                textOutput('Weight'),
                h3('Hight in m'),
                textOutput('Hight'),
                h3('BMI'),
                textOutput('bmi'),
                h3('This weight is in a region of '),
                textOutput('region'),
                h3('My aim is to'),
                textOutput('aim'),
                h3('Daily steps recommended based on your aim'),
                textOutput('steps')
                
        )
))