
## More on Unrolled Method Names

An unrolled method name is similar to a Groovy `GString`, except for the following differences:

* Expressions are denoted with `#` instead of `$` [1], and there is no equivalent for the `${…​}` syntax.
* Expressions only support property access and zero-arg method calls.

Given a class `Person` with properties `name` and `age`, and a data variable `person` of type `Person`, the following are valid method names:


    def "#person is #person.age years old"() { ... } // property access
    def "#person.name.toUpperCase()"() { ... } // zero-arg method call

Non-string values (like `#person` above) are converted to Strings according to Groovy semantics.

The following are invalid method names:


    def "#person.name.split(' ')[1]" { ... } // cannot have method arguments
    def "#person.age / 2" { ... } // cannot use operators


If necessary, additional data variables can be introduced to hold more complex expression:

    def "#lastName"() {
        ...
        where:
        person << ...
        lastName = person.name.split(' ')[1]
    }


------

> 1. Groovy syntax does not allow dollar signs in method names.
