

## Reporting of Failures

Let’s assume that our implementation of the `max` method has a flaw, and one of the iterations fails:

    maximum of two numbers   FAILED

    Condition not satisfied:

    Math.max(a, b) == c
        |    |  |  |  |
        |    7  0  |  7
        42         false


The obvious question is: Which iteration failed, and what are its data values? In our example, it isn’t hard to figure out that it’s the second iteration that failed. At other times this can be more difficult or even impossible[1].  In any case, it would be nice if Spock made it loud and clear which iteration failed, rather than just reporting the failure. This is the purpose of the `@Unroll` annotation.


-----

>1. For example, a feature method could use data variables in its setup: block, but not in any conditions.
