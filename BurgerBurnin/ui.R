## Coursera Data Products Class Project
## Beef miliage adjuster
## ui.R

shinyUI(fluidPage(
    titlePanel("Beef Miliage Adjuster"),
    sidebarLayout(
        sidebarPanel(
            p("This application will adjust your cars miliage based on your beef consumption
              to demonstrate how much gasoline that you use during a trip to a restaurant.  It 
              uses the widely accepted fact that it takes one gallon of gas to produce one 
              pound of grain fed beef."),
            br(),
            h4("Enter Your Cars Miliage, Distance to Restaurant, and Your Beef Consumption Here"),
            numericInput('mpg', "Input your Cars Average MPG", 25, min=10, max=50, step=1),
            numericInput('dist', "Input the distance to the Restaurant in Miles", 10, min=1, max=100, step=1),
            numericInput('burger', "Portions Consumed", 1, min=1, max=10, step=1),
            selectInput('Beef', "Type of Beef Consumed:",
                        list("nothing",
                             "1/8 pound Burger",
                             "1/4 pound Burger",
                             "1/2 pound Burger",
                             "1 pound Burger",
                             "4 ounce Steak",
                             "8 ounce Steak",
                             "12 ounce Steak",
                             "16 ounce Steak",
                             "4 ounce Beef Dish",
                             "8 ounce Beef Dish",
                             "12 ounce Beef Dish",
                             "16 ounce Beef Dish",
                             "Non-Beef Dish",
                             "I had a salad!")),
            submitButton('Submit')
            ),
        mainPanel("",
                  h3('Base Miliage'),
                  h4('Your Cars Miliage:'),
                  verbatimTextOutput("mpg"),
                  h4('The distance you traveled to restaurant'),
                  verbatimTextOutput("dist"),
                  h4('You used this much gas traveling for your meal'),
                  verbatimTextOutput("gallonsUsed"),
                  h4('You consumed'),
                  verbatimTextOutput("burger"),
                  h5('x'),
                  verbatimTextOutput("Beef"),
                  h3('Adjusted Miliage'),
                  h4('Total number of gallons of gasoline used to produce the beef in your meal and to drive to the restaurant'),
                  verbatimTextOutput("totalGas"),
                  h4('Adjusted MPG'),
                  verbatimTextOutput("totalmpg"),
                  br(),
                  img(src="cowdriving.png", height = 200, width = 400),
                  p("Sources:"),
                  p("1) http://en.wikipedia.org/wiki/Environmental_impact_of_meat_production"),
                  p("2) https://alumni.stanford.edu/get/page/magazine/article/?article_id=29892"),
                  p("3) http://ajcn.nutrition.org/content/78/3/660S.full"),
                  p("4) http://www.globalissues.org/article/240/beef"),
                  p("5) http://www.worldwatch.org/node/549")
        ))))