library(shiny)
shinyUI(pageWithSidebar(
    headerPanel('Summary statistics calculator'),
    sidebarPanel(
        width = 5,
        h3('This is a calculator for some of the basic summary statistics'),
        textInput(inputId='num',label='Enter your number(s):'),
        actionButton(inputId='addnum',label='Input number'),
        actionButton(inputId='calc',label='Calculate!'),
        helpText('Note: You could enter a single number at a time or enter a vector',
                 'of numbers with individual numbers separated by a comma.',
                 'Press the "Input number" button to confirm to input your number(s),',
                 'and you may input new numbers afterwards.',
                 'All your inputted numbers will be concatenated into a single vector',
                 'and will show up on the main panel on the right.',
                 'Press the "Calculate!" button to obtain basic summary statistics of the inserted numbers.',
                 'Inputs that are not numbers will show up as NA and will not be taken into calculations.')
    ),
    mainPanel(
        width = 6,
        h3('You have entered:'),
        verbatimTextOutput('inputVector'),
        h3('The mean is:'),
        verbatimTextOutput('mean'),
        h3('The quartiles are:'),
        verbatimTextOutput('quart'),
        h3('The variance is:'),
        h6('At least 2 inputs are required for this'),
        verbatimTextOutput('var')
    )
))
