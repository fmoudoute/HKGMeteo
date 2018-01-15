HKMeteoProject
========================================================
author: Frantz
date: 2018-01-15
autosize: true

Analysis of Hong Kong Air Pollutants
========================================================

This presentation contains documentation for the HK Meteo Project application. The aplication is available via the following link:  (https://fmoudoute.shinyapps.io/HKGMeteo/)

This application will build a  linear regression model dynamicall based on the pollutants selected by the user and provide a chart with a trend line indicating the relationship between the two variables.


Data For the HK Meteo Project
========================================================

Our Data are the historical hour by hour level of pollutant observed in Central Hong Kong between 1990 and 2017.
Several days have been removed as some the data source was showing incomplete rows ("NAs")


```
    DATE HOUR         STATION FSP NO2 NOX O3 RSP SO2
1 8/1/11    1 CENTRAL/WESTERN  12  45 104  4  15  20
2 8/1/11    2 CENTRAL/WESTERN  15  48 160  3  24  24
3 8/1/11    3 CENTRAL/WESTERN  16  44 132  3  15  26
4 8/1/11    4 CENTRAL/WESTERN  11  34  86  6  16  23
5 8/1/11    5 CENTRAL/WESTERN  15  39 130  4  20  34
6 8/1/11    6 CENTRAL/WESTERN  21  41 171  3  24  52
```

```
[1] "Number of rows: 20006"
```

```
[1] "Number of variables: 10"
```


Files
========================================================

2-file based application:
- `ui.R`
- `server.R`

Files are available at : https://github.com/fmoudoute/HKGMeteo


Application - How to use
========================================================
- The user selects the pollutant for which he/she would like to see the relationship using "selectInput".
- The selected pollutants will be passed on to R as variables.
- The Chart will automatically update according to the pollutants which were selected (axis, and title).
- The user can also have a quick look at the mean of the variables on the sidepanel.
- As an option, the axis means and the linear regression line can be added to the chart using "checkboxInput".
- We also offer a preview of the dataset just for educational purpose. 
- The main panel indicate the location of which the data are being analyse using leaflet package.
