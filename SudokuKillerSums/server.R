
library(shiny)

# Funcion posibles --------------------------------------------------------

posibles <- function( suma, digitos, excluir = NULL,
                      incluir = NULL ) {

    nueve = 1:9

    # Excluir
    # Los recibidos en excluir
    nueve = nueve[ !(nueve %in% excluir) ]

    # Calcular
    ret = caTools::combs( nueve, digitos)
    sumas = rowSums( ret ) == suma
    ret = matrix( ret[ sumas,  ], nrow = sum( sumas ) )
    # ret = ret[ sumas,  ]

    # Si no hay resultados, salir
    if ( nrow( ret ) == 0 ) {
        print( "No hay opciones posibles!" )
        return( ret )
    }


    # Incluir
    # Filtrar por lo recibido en incluir
    incluye = apply(ret, 1, function( fila )
    { all( incluir %in% fila ) } )

    ret = matrix( ret[ incluye,  ], nrow = sum( incluye ) )

    # Si no hay resultados, salir
    if ( nrow( ret ) == 0 ) {
        print( "No hay opciones posibles!" )
        return( ret )
    } else {
        return( ret )
    }


    # Imprimir !


    # No hay opciones
    if( length( ret ) > 1 ) {
        if( !is.null(nrow( ret ))  ) {
            apply( ret, FUN = paste0, MARGIN = 1 , collapse = "",
                   sep = '')
        } else {
            paste0( ret, collapse = "")
        }


    } else {
        print( "No hay opciones posibles" )
    }

    # Imprimir opciones
    return( ret )

}


# Shiny server ------------------------------------------------------------

shinyServer(function(input, output) {

    output$posible.sums <- renderTable(
        posibles(input$sums,
                 input$digits,
                 excluir = input$excluded,
                 incluir = input$included),
        colnames = FALSE,
        digits = 0)

})
