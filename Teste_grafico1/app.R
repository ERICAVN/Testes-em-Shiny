## Exemplo Simples
library(tidyverse)
library(shiny)

# Define UI que ira plotar o histograma
ui <- fluidPage(

    # Titulo do app
    titlePanel("Histograma Interativo"),

    # input: Slider com o numero de caixas
    sidebarLayout(
        sidebarPanel(
            sliderInput("caixas",
                        "Numero de caixas:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        mainPanel( # conteudo da pagina principal
          # aqui ira gerar um grafico
           plotOutput(outputId = "grafico")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$grafico <- renderPlot({# coloca os resultados no output
        
        # extrai caixas do input
        hist(log(islands), breaks = input$caixas, 
             col = "blue", border = "purple",
             xlab = "Area das Ilhas",
             ylab="Frequencia", main = "")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
