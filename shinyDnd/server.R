library(shiny)


shinyServer(function(input, output) {
    output$plot <- renderPlot({
        set.seed(24601)
        trueMean <- mean(1:input$faces)*input$howMany
        rolls <- rep(0, 100000)
        rolls <- vapply(rolls, function(x) {
            sum(sample(input$faces, 
                            size = input$howMany, 
                            replace = TRUE))
                }, FUN.VALUE = numeric(1)
            )
        xlab <- "sum of dice rolls"
        main <- "Histogram of sum of dice rolls"
        hist(rolls, 
             xlab = xlab, 
             main = main, 
             breaks = seq(from = .5, 
                          to = input$faces*input$howMany + .50, 
                          by = 1
                          ),
             probability = TRUE
            )
            abline(v = trueMean, col = "darkblue", lwd = 2)
            legend("topright", legend = "mean", lwd = 2, col = "darkblue")
    })
})
