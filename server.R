library(shiny)
shinyServer(
    function(input,output){
        v <- numeric()
        vtemp <- reactive({
            input$addnum
            v <<- isolate(c(v,as.numeric(sapply(strsplit(input$num,split=','),as.numeric))))
            v <- v[-is.na(v)]
        })
        output$inputVector <- renderText({
            as.character(vtemp())
        })
        output$mean <- renderText({
            input$calc
            isolate(as.character(mean(vtemp(),na.rm=T)))
        })
        output$quart <- renderText({
            input$calc
            isolate(as.character(quantile(vtemp(),na.rm=T)))
        })
        output$var <- renderText({
            input$calc
            isolate(as.character(var(vtemp(),na.rm=T)))
        })
    }
)

