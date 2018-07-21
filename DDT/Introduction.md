
## Introduction

Suppose we want to specify the behavior of the Math.max method:

    class MathSpec extends Specification {
        def "maximum of two numbers"() {
            expect:
            // exercise math method for a few different inputs
            Math.max(1, 3) == 3
            Math.max(7, 4) == 7
            Math.max(0, 0) == 0
        }
    }

Although this approach is fine in simple cases like this one, it has some potential drawbacks:

* Code and data are mixed and cannot easily be changed independently
* Data cannot easily be auto-generated or fetched from external sources
* In order to exercise the same code multiple times, it either has to be duplicated or extracted into a separate method
* In case of a failure, it may not be immediately clear which inputs caused the failure
* Exercising the same code multiple times does not benefit from the same isolation as executing separate methods does

Spock’s data-driven testing support tries to address these concerns. To get started, let’s refactor above code into a data-driven feature method. First, we introduce three method parameters (called data variables) that replace the hard-coded integer values:

    class MathSpec extends Specification {
        def "maximum of two numbers"(int a, int b, int c) {
            expect:
            Math.max(a, b) == c

            ...
        }
    }

We have finished the test logic, but still need to supply the data values to be used. This is done in a where: block, which always comes at the end of the method. In the simplest (and most common) case, the where: block holds a *data table*.
