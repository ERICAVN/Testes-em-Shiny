
library(shiny)
sales<- readr::read_csv("sales_data_sample.csv")
sales<- sales[c(
  "TERRITORY", "ORDERDATE", "ORDERNUMBER", "PRODUCTCODE", "QUANTITYORDERED", "PRICEEACH"
)]

# 
ui <- fluidPage(
  selectInput(
    "territorio", "Território", choices = unique(sales$TERRITORY)),
  tableOutput("selected")
)

# 
server <- function(input, output) {

    selected<- reactive(
      if (input$territorio=="NA"){
        subset(sales,is.na(TERRITORY))
      }else{
        subset(sales, TERRITORY==input$territorio)
      }
         )
    output$selected<- renderTable(head(selected(),10))
}

# 
shinyApp(ui = ui, server = server)
