# library(shiny)
# x <<- 0
# x <<- x + 1
# y <<- 0
# 
# shinyServer(
#    function(input, output) {
#        y <<- y + 1
#        output$text1 <- renderText({input$text1})
#        output$text2 <- renderText({input$text2})
#        output$text3 <- renderText({as.numeric(input$text1)+1})
#        output$text4 <- renderText(y)
#        output$text5 <- renderText(x)
#    }
# )

# shinyServer(
#    function(input, output) {
#        x <- reactive({as.numeric(input$text1)+100})
#        output$text1 <- renderText({x() })
#        output$text2 <- renderText({x() + as.numeric(input$text2)})
#    }
# )

# shinyServer(
#     function(input, output) {
#         output$text1 <- renderText({as.numeric(input$text1)+100 })
#         output$text2 <- renderText({as.numeric(input$text1)+100 +
#                 as.numeric(input$text2)})
#     }
# )

library(manipulate)
myHist <- function(mu){
    hist(galton$child,col="blue", breaks=100)
    lines(c(mu, mu), c(0, 150), col = "red", lwd=5)
    mse <- mean((galton$child - mu)^2)
    text(63, 150, paste("mu = ", mu))
    text(63,140, paste("MSE = ", round(mse, 2)))
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))