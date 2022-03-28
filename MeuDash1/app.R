library(shinydashboard)
library(shiny)
#library(dashboard)
#library(htmltools)
#library(devtools)
#library(shinydashboardPlus)
help("htmlDependencies")
# bootStrap 3 biblioteca padrao para icones

ui <- dashboardPage(skin = "yellow",
  dashboardHeader(
    title = "Minha Empresa",
    dropdownMenu(type = "messages",
                 messageItem(
                   from = "New User ",
                   message = "How do I register?",
                   icon = icon("question"),
                   time = "13:43"),
                 messageItem(
                   from = "Suport ",
                   message = "Servidor is read",
                   icon = icon("life-ring"),
                   time = "18:19")
    ),
    dropdownMenu(type = "tasks",
                 taskItem(
                   value = 90,color = "green", "documentation"),
                 taskItem(
                   value = 17, color = "aqua", "X project"),
                 taskItem(
                   value = 90, color = "red", "Y project")
                 ),
    dropdownMenu(type = "notifications",
                 notificationItem(
                   text = "5 new registered users ",
                   icon = icon("users"),
                   status = "info"),
                 notificationItem(
                   text = "12 items delivered",
                   icon = icon("truck"),
                   status = "danger")
                 )
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "Git Location",
        icon = icon("file-code-o"),
        href = "https://github.com/ERICAVN"),
      menuItem(
        "Figures",
        tabName = "Figures",
        icon = icon("dashboard")),
      menuItem(
        "Quartil",
        icon = icon("calendar")),
      menuSubItem(
        "First Quartile",
        tabName = "1Q"),
      menuSubItem(
        "Second Quartile",
        tabName = "2Q"),
      menuSubItem(
        "Third Quartile",
        tabName = "3Q"),
      menuSubItem(
        "Fourth Quartile",
        tabName = "4Q"),
      menuItem(
        "Data",
        tabName = "data",
        icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "Figures", h2("My figures")),
      tabItem(
        tabName = "1Q", h2("First Quartile")),
      tabItem(
        tabName = "2Q", h2("Second Quartile")),
      tabItem(
        tabName = "3Q", h2("Third Quartile")),
      tabItem(
        tabName = "4Q", h2("Fourth Quartile")),
      tabItem(
        tabName = "data", h2("Raw data"))
    )
  )

)

##########
server <- function(input, output) { }

# Run the application 
shinyApp(ui = ui, server = server)
