<style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}
</style>

## Data Tables

Data tables are a convenient way to exercise a feature method with a fixed set of data values:

    class Math extends Specification {
        def "maximum of two numbers"(int a, int b, int c) {
            expect:
            Math.max(a, b) == c
    
            where:
            a | b | c
            1 | 3 | 3
            7 | 4 | 4
            0 | 0 | 0
        }
    }

The first line of the table, called the table header, declares the data variables. The subsequent lines, called table rows, hold the corresponding values. For each row, the feature method will get executed once; we call this an iteration of the method. If an iteration fails, the remaining iterations will nevertheless be executed. All failures will be reported.

Data tables must have at least two columns. A single-column table can be written as:

    where:
    a | _
    1 | _
    7 | _
    0 | _