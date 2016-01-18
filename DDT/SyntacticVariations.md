<style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}
</style>

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