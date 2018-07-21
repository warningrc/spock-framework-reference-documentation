
## Syntactic Variations

The previous code can be tweaked in a few ways. First, since the `where:` block already declares all data variables, the method parameters can be omitted.[1] Second, inputs and expected outputs can be separated with a double pipe symbol (`||`) to visually set them apart. With this, the code becomes:

    class DataDriven extends Specification {
        def "maximum of two numbers"() {
            expect:
            Math.max(a, b) == c

            where:
            a | b || c
            3 | 5 || 5
            7 | 0 || 7
            0 | 0 || 0
        }
    }

---
>1. The idea behind allowing method parameters is to enable better IDE support. However, recent versions of IntelliJ IDEA recognize data variables automatically, and even infer their types from the values contained in the data table.
