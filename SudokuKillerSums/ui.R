
library(shiny)
library(shinymaterial)

shinyUI(
    material_page(
        title = "Sums of killer Sudoku",
        nav_bar_color = "red darken-4",
        background_color = "grey lighten-4",
        
        # Define tabs
        material_tabs(
            tabs = c(
                "App" = "tab_app",
                "Help" = "tab_help"
            ),
            color = "red" # "deep-orange" #  "pink"  # "blue-grey" #
        ),
        
        # Define tab 1 content
        material_tab_content(
            tab_id = "tab_app",
            
            material_card(
                title = "Inputs:",
                depth = 5,
                
                material_row(
                    material_column(
                        
                        material_number_box("sums",
                                            "Sum needed:",
                                            min_value = 3, max_value = 45,
                                            initial_value = 3,
                                            step_size = 1,
                                            color = "#b71c1c"),
                        width = 6),
                    
                    material_column(
                        material_number_box("digits",
                                            "Number of positions:",
                                            min_value = 2, max_value = 9,
                                            initial_value = 2,
                                            step_size = 1, 
                                            color = "#b71c1c"
                        ),
                        width = 6
                    )
                ),
                
                p("Numbers to exclude:"),
                material_row(
                    material_column(
                        material_checkbox(
                            input_id = "exclude_1",
                            label = "1",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1,
                        offset = 0
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "exclude_2",
                            label = "2",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "exclude_3",
                            label = "3",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "exclude_4",
                            label = "4",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "exclude_5",
                            label = "5",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "exclude_6",
                            label = "6",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "exclude_7",
                            label = "7",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "exclude_8",
                            label = "8",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "exclude_9",
                            label = "9",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_button(
                            input_id = "clear_exclude",
                            label = "",
                            icon = "check_box_outline_blank",
                            depth = 3,
                            color = "red lighten-1"
                        ),
                        width = 1
                    )
                ),
                
                p("Mandatory numbers:"),
                material_row(
                    material_column(
                        material_checkbox(
                            input_id = "include_1",
                            label = "1",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1,
                        offset = 0
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "include_2",
                            label = "2",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "include_3",
                            label = "3",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "include_4",
                            label = "4",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "include_5",
                            label = "5",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "include_6",
                            label = "6",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "include_7",
                            label = "7",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "include_8",
                            label = "8",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_checkbox(
                            input_id = "include_9",
                            label = "9",
                            initial_value = FALSE,
                            color = "#b71c1c"),
                        width = 1
                    ),
                    material_column(
                        material_button(
                            input_id = "clear_include",
                            label = "",
                            icon = "check_box_outline_blank",
                            depth = 3, 
                            color = "red lighten-1" # "#f05545" # 
                        ),
                        width = 1
                    )
                )
                
            ), 
            
            material_card(
                title = "Posible combinations:",
                depth = 5,
                
                tableOutput("posible.sums")
                
            ),
            
            material_card(
                title = "",
                HTML("<a href='http://www.sudokumania.com.ar/juegos/killer' target='_blank'>Play Killer Sudoku!</a>")
            )
            
            
        ),
        
        # Define tab 2 content
        material_tab_content(
            tab_id = "tab_help" ,
            includeCSS("help_css.css"),
            includeMarkdown("help.Rmd")
        )
    )
)
