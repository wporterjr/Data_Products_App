## Coursera Data Products Class Project
## Beef gas mileage adjuster
## server.R


# Read in the overly simplistic meal data
beefdata <- read.csv("beefdata.csv", stringsAsFactors=TRUE, header=TRUE)
beefdata$Meal <- as.character(beefdata$Meal)
beefdata$Gas <- as.numeric(beefdata$Gas)

# Calculates how much gas used to get to a restaurant and back home
gallonsUsed <- function(mpg, dist) {
    # 1 pound of beef = 1 gallon of gas
    gallonsUsed <- dist / mpg
    return(gallonsUsed)
}

# Calculates how much gas is used to produce the beef in your meal
adjustedGas <- function(Beef, burger, mpg, dist) {
    beefGas <- beefdata[beefdata$Meal==Beef, 2]
    gallonsUsed <- dist / mpg
    adjustedGas <- gallonsUsed + (beefGas * burger)
    return(adjustedGas)
}

# Calculates your adjusted mileage based on all factors
adjustedmpg <- function(Beef, burger, mpg, dist) {
    beefGas <- beefdata[beefdata$Meal==Beef, 2]
    gallonsUsed <- dist / mpg
    adjustedGas <- gallonsUsed + (beefGas * burger)
    totalmpg <- round(dist / adjustedGas)
    return(totalmpg)
}

shinyServer(
    function(input,output) {
        output$mpg <- renderText(paste({input$mpg},"mpg"))
        output$dist <- renderText(paste({input$dist}, "miles"))
        output$gallonsUsed <- renderText({gallonsUsed(input$mpg, input$dist)})
        output$burger <- renderText(paste({input$burger}))
        output$Beef <- renderText(paste({input$Beef}))
        output$totalGas <- renderText({adjustedGas(input$Beef, input$burger, input$mpg, input$dist)})
        output$totalmpg <- renderText({adjustedmpg(input$Beef, input$burger, input$mpg, input$dist)})
    }
)
