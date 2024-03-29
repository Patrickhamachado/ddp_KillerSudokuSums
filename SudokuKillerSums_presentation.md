Killer Sudoku Sums 
========================================================
author: Patrick Machado
date: 10 jul 2019
autosize: true

Killer Sudoku is a modification of the original game in which, instead of fixed numbers as the clues to solve it, groups of boxes and the sum of its respective values are given.

This is a pitch for a [Shiny application](https://patrickhamachado.shinyapps.io/SudokuKillerSums/) made for helping Killer Sudoku players.


Killer Sudoku problem
========================================================
transition: rotate

In the problem at right the groups are marqued with different colors. Every group shows, at the left-up corner, the sum of the values inside it. 

The cases in pink are five:

| Case | Groups   | Boxes | Adding |
|-----:|:--------:|:-----:|:------:|
| A | 1  | 2 | 17 |
| B | 1  | 2 | 14 |
| C | 2  | 3 | 17 |
| D | 1  | 2 | 16 |
| E | 1  | 2 | 15 |

---

![Picture from Killer Sodoku in Wikipedia](https://upload.wikimedia.org/wikipedia/commons/5/5e/Killersudoku_color.svg)


Application use
==============
transition: rotate

The purpose of the [application](https://patrickhamachado.shinyapps.io/SudokuKillerSums/) is to show the posible combinations of numbers that can add the needed sum. 

The first pink group has **2 boxes that add 17**. The  picture at right shows how the [app](https://patrickhamachado.shinyapps.io/SudokuKillerSums/)  should be used and, of course, the answer:

|Posible combinations:  | 
|:-------------:| 
|8 and 9 |

---

![](SudokuKillerSums/Ejemplo1.png)

Application description
===
transition: rotate

The [Shiny application](https://patrickhamachado.shinyapps.io/SudokuKillerSums/) make use of a function called *`posibles`*. Below there are two examples of how it is used:






```r
posibles( 17, 2)
```

```
     [,1] [,2]
[1,]    8    9
```

```r
posibles( 15, 2)
```

```
     [,1] [,2]
[1,]    6    9
[2,]    7    8
```


Useful links
===
transition: rotate

- Shiny app: [SudokuKillerSums](https://patrickhamachado.shinyapps.io/SudokuKillerSums/)

- For playing Killer Sudoku: [SudokuMania](http://www.sudokumania.com.ar/juegos/killer),  [Killer Sudoku Online](https://www.killersudokuonline.com/play.html)  

- For Killer Sudoku rules and solving tips: [SudokuMania](http://www.sudokumania.com.ar/noticias/consejos-para-resolver-sudokus), [Killer Sudoku Online](https://www.killersudokuonline.com/tips.html), [Wikipedia](https://en.wikipedia.org/wiki/Killer_sudoku)


Thanks and enjoy playing Killer Sudoku!

*[Patrick Machado](https://github.com/Patrickhamachado)*
