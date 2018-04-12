library(shiny)

shinyUI(
    navbarPage("Shiny Application",
               tabPanel("Regression Analysis",
                        fluidPage(
                            titlePanel("Effects on miles per gallon (MPG)"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Number of cylinders" = "cyl",
                                                  "Displacement (cu.in.)" = "disp",
                                                  "Gross horsepower" = "hp",
                                                  "Rear axle ratio" = "drat",
                                                  "Weight (lb/1000)" = "wt",
                                                  "1/4 mile time" = "qsec",
                                                  "V/S" = "vs",
                                                  "Transmission" = "am",
                                                  "Number of forward gears" = "gear",
                                                  "Number of carburetors" = "carb"
                                                )),
                                    
                                    checkboxInput("outliers", "Show boxplot's outliers", FALSE)
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                                tabPanel("Regression model", 
                                                         plotOutput("mpgPlot"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               ),
               tabPanel("Source Code",
                        hr(),
                        h3("In the link below you can find the source code of the App"),
                        a("https://github.com/alberttorello/developing-data-products")
               ),
               tabPanel("Help",
                        helpText("This app fits a linear regression model to determine the effect of a selected explanatory variable on miles per gallon. In one tab, a boxplot is created while the other shows the summary of the model. It is also possible to visualize the outliers of the boxplot.")
               )
    )
)