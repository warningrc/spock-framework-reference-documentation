
## Data Variable Assignment

A data variable can be directly assigned a value:


    ...
    where:
    a = 3
    b = Math.random() * 100
    c = a > b ? a : b


Assignments are re-evaluated for every iteration. As already shown above, the right-hand side of an assignment may refer to other data variables:

    ...
    where:
    row << sql.rows("select * from maxdata")
    // pick apart columns
    a = row.a
    b = row.b
    c = row.c
