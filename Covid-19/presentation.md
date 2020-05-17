
Is the UK Covid curve flattening?
========================================================
author: Paul Newnes
date: 2020-05-17
autosize: true

UK Covid 19 Deaths
========================================================

The UK Government Covid-19 website has an extensive set of charts showing:

- Spread of the disease from postive tests
- Daily deaths
- Cumulative deaths

But there are some missing visualisation elements that would make the progress from lockdown more obvious.

We will use the death rather than infection rate given the greater measurement consistency and accuracy of the former over the latter.

Importing the Data
========================================================

The UK government website publishes the raw data so interested parties, such as us, can also analyse and visualise.

The data is also updated every day to the same URL making it convenient to read in and update any analyses & visualisations.


```
# A tibble: 6 x 4
  Area             Date       Daily.deaths Cumulative.deaths
  <chr>            <date>            <dbl>             <dbl>
1 Wales            2020-05-16           18              1191
2 Scotland         2020-05-16           46              2053
3 Northern Ireland 2020-05-16           15               469
4 United Kingdom   2020-05-16          468             34466
5 England          2020-05-16          389             30753
6 Wales            2020-05-15            9              1173
```

- Source: https://coronavirus.data.gov.uk/
- NB - column names changed so the preview fits neatly

Visualisation
========================================================

Conveniently, the data comes in long data format for the constituent nations of the UK.

We can easily show this in a stacked bar chart for deaths by UK Area.



```
Error in file(con, "rb") : cannot open the connection
```
