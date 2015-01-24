
        
        

library(shiny)
shinyServer(
        x <- 
        function(input, output) {
                output$Weight <- renderText({input$Weight})
                output$Hight <- renderText({input$Hight})
                
                x <- reactive(as.numeric(input$Weight)/(as.numeric(input$Hight)^2))
                
                output$bmi <- renderText({
                        if (input$goButton==0) "Input needed."
                        else {
                        input$goButton
                        isolate( x() ) }
                        })
                output$region <- renderText({
                        if (input$goButton==0) "Input needed."
                        else {
                        input$goButton
                        if (x()< 18.5) "Underweight"
                        else if (x()>=18.5&x()<25) "Healthy Weight"
                        else if (x()>=25 & x()<30) "Overweight"
                        else if (x()>=30) "Obese"
                        }
                        
                })
                output$aim <- renderText({input$aim})
                output$steps <- renderText({
                        if (length(input$aim)==0 | (input$goButton==0)) "Input needed."
                        else {
                                
                                if (input$aim=="loss weight") as.character(8000*1.25)
                                else if (input$aim=="maintain current weight") as.character(8000)
                                else if (input$aim=="gain weight") as.character(8000*0.75)
                                
                        }
                        
                })
        }
)