

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
