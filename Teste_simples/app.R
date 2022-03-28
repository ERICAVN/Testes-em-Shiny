
library(shiny)# pacote utilizado

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Meu App"),

    # Aqui colocarei as entradas 
    sidebarLayout(
        sidebarPanel(
            textInput("nome","Digite seu nome: ")
        ),

        # Mostra a saida do nome que eu digitei
        mainPanel(
           paste("Voce Digitou:"),
           textOutput("saida")
        )
    )
)

# 
server <- function(input, output) {
  output$saida <- renderText({
    paste("Bem vindo ", input$nome)
  })

}

# chamo o servidor
shinyApp(ui = ui, server = server)
