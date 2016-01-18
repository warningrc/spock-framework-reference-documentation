<style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}
</style>

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