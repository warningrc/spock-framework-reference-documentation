
## Combining Data Tables, Data Pipes, and Variable Assignments

Data tables, data pipes, and variable assignments can be combined as needed:

    ...
    where:
    a | _
    3 | _
    7 | _
    0 | _

    b << [5, 0, 0]

    c = a > b ? a : b
