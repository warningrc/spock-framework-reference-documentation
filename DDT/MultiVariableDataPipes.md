

## Multi-Variable Data Pipes

If a data provider returns multiple values per iteration (as an object that Groovy knows how to iterate over), it can be connected to multiple data variables simultaneously. The syntax is somewhat similar to Groovy multi-assignment but uses brackets instead of parentheses on the left-hand side:


    @Shared sql = Sql.newInstance("jdbc:h2:mem:", "org.h2.Driver")

    def "maximum of two numbers"() {
        ...
        where:
        [a, b, c] << sql.rows("select a, b, c from maxdata")
    }


Data values that aren’t of interest can be ignored with an underscore (`_`):

    ...
    where:
    [a, b, _, c] << sql.rows("select * from maxdata")
