

## Data Pipes

Data tables aren’t the only way to supply values to data variables. In fact, a data table is just syntactic sugar for one or more *data pipes*:

    ...
    where:
    a << [3, 7, 0]
    b << [5, 0, 0]
    c << [5, 7, 0]


A data pipe, indicated by the left-shift (`<<`) operator, connects a data variable to a data provider. The data provider holds all values for the variable, one per iteration. Any object that Groovy knows how to iterate over can be used as a data provider. This includes objects of type `Collection`, `String`, `Iterable`, and objects implementing the `Iterable` contract. Data providers don’t necessarily have to be the data (as in the case of a `Collection`); they can fetch data from external sources like text files, databases and spreadsheets, or generate data randomly. Data providers are queried for their next value only when needed (before the next iteration).
