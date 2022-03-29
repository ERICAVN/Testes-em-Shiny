library(shinydashboard)
library(shiny)
# bootStrap 3 biblioteca padrao para icones

ui <- dashboardPage(skin = "purple",
                    dashboardHeader(
                      title = "Minha Empresa"

                    ),
                    dashboardSidebar(
                      sidebarMenu(
                        sliderInput("orders","Orders", min=1, max=2000, value = 500),
                        menuItem(
                          "Git Location",
                          icon = icon("file-code-o"),
                          href = "https://github.com/ERICAVN"),
                        menuItem(
                          "Figures",
                          tabName = "Figures",
                          icon = icon("tachometer-alt")),
                        menuItem(
                          "Data",
                          tabName = "data",
                          icon = icon("th"))
                      )
                    ),
                    dashboardBody(
                      tabItems(
                        tabItem(
                          tabName = "Figures", h2("My figures"),
                          fluidRow(
                            box(
                              title = "Summary",
                              background = "blue",
                              width = 3,
                              textOutput("status")),
                            valueBox(
                              uiOutput("orders1"),
                              subtitle ="Orders",
                              icon = icon("adress-card"),
                              href = "https://fontawesome.com/v4/icons/"),
                            infoBox(
                              title = "Orders",
                              value = uiOutput("orders2"),
                              icon = icon("adress-card")),
                            box(
                              title = "Data Plot ",
                              status= "primary",
                              solidHeader = TRUE,
                              collapsible = TRUE,
                              width = 500,
                              plotOutput("histplot", height = "300")),
                            box(
                              title = "Data Plot 2 ",
                              status= "success",
                              solidHeader = TRUE,
                              collapsible = TRUE,
                              width = 500,
                              plotOutput("histplot2", click="histplot2_click"))
                          ),
                          ),
                        tabItem(
                          tabName = "data", h2("Raw data"))
                      )
                    )
                    
)

##########
server <- function(input, output) { 
  output$status<- renderText({
    paste0(
      "We currently have ",
      prettyNum(input$orders, big.mark = "."),
      " orders in progress."
      )
  })
  output$orders1<- renderText({
    prettyNum(input$orders, big.mark = ".")
  })
  output$orders2<- renderText({
    prettyNum(input$orders, big.mark = ".")
  })
  output$histplot<- renderPlot({
    hist(rnorm(input$orders), main="", xlab="Orders")
  })
  output$histplot2<- renderPlot({
    plot(mtcars$wt, mtcars$mpg, xlab = "WT", ylab = "MPG")
  })
  output$info<- renderText({
    paste0("x=",input$histplot2_click$x, "\ny=", input$histplot2_click$y)
  })
  }

# Run the application 
shinyApp(ui = ui, server = server)
