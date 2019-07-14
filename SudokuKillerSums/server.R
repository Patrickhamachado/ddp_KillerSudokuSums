
library(shiny)
library(shinymaterial)

# Function posibles --------------------------------------------------------

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
        # print( "No hay opciones posibles!" )
        return( "None" )
    }
    
    
    # Incluir
    # Filtrar por lo recibido en incluir
    incluye = apply(ret, 1, function( fila )
    { all( incluir %in% fila ) } )
    
    ret = matrix( ret[ incluye,  ], nrow = sum( incluye ) )
    
    # Si no hay resultados, salir
    if ( nrow( ret ) == 0 ) {
        # print( "No hay opciones posibles!" )
        return( "None" )
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
        # print( "No hay opciones posibles!" )
        return( "None" )
    }
    
    # Imprimir opciones
    return( ret )
    
}



# Shiny server ------------------------------------------------------------

shinyServer(function(input, output, session) {
    
    excluir.m <- reactive({
        excluir <- c(input$exclude_1, input$exclude_2,
                     input$exclude_3, input$exclude_4,
                     input$exclude_5, input$exclude_6,
                     input$exclude_7, input$exclude_8,
                     input$exclude_9)
        excluir <- (1:9)[excluir]
        excluir <- as.character(excluir)
        
        if(length(excluir) == 0 ) {
            update_material_button(
                session,
                input_id = "clear_exclude",
                # value = "",
                icon = "stop",
                enable = TRUE
            ) 
        }
        else {
            update_material_button(
                session,
                input_id = "clear_exclude",
                # value = "",
                icon = "stop",
                enable = FALSE
            )
        }
        return(excluir)
    })
    
    incluir.m <- reactive({
        incluir <- c(input$include_1, input$include_2,
                     input$include_3, input$include_4,
                     input$include_5, input$include_6,
                     input$include_7, input$include_8,
                     input$include_9)
        incluir <- (1:9)[incluir]
        incluir <- as.character(incluir)
        
        if(length(incluir) == 0 ) {
            update_material_button(
                session,
                input_id = "clear_include",
                # value = "",
                icon = "stop",
                enable = TRUE
            ) 
        }
        else {
            update_material_button(
                session,
                input_id = "clear_include",
                # value = "",
                icon = "stop",
                enable = FALSE
            )
        }
        return(incluir)
    })
    
    output$posible.sums <- renderTable(
        {
            posibles(input$sums,
                     input$digits, 
                     excluir = excluir.m(),
                     incluir = incluir.m())
        },
        colnames = FALSE,
        digits = 0
    )
    
    # clear_exclude button
    observe({
        input$clear_exclude
        
        for(i in 1:9) {
            update_material_checkbox(session, 
                                     input_id = paste('exclude', i, sep = '_'),
                                     value = FALSE)
        }
    })
    
    # clear_include button
    observe({
        input$clear_include
        
        for(i in 1:9) {
            update_material_checkbox(session, 
                                     input_id = paste('include', i, sep = '_'),
                                     value = FALSE)
        }
        
    })
    
})
