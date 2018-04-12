library(shiny)
library(datasets)

data <- mtcars
data$am <- factor(data$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste("mpg ~", input$variable)
    })
    
    formulaTextPoint <- reactive({
        paste("mpg ~", "as.integer(", input$variable, ")")
    })
    
    fit <- reactive({
        lm(as.formula(formulaTextPoint()), data=data)
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$mpgBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = data,
                outline = input$outliers)
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$mpgPlot <- renderPlot({
        with(data, {
            plot(as.formula(formulaTextPoint()))
            abline(fit(), col=2)
        })
    doc <- renderText("This app allows you to model the mpg as a function of different explanatory variables you can select below. You can see the boxplot in one tab and the model summary in the other one.")
    })
    
})