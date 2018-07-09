# Default Behavior of Mock Objects
----

> ## Lenient vs. Strict Mocking Frameworks
> Like Mockito, we firmly believe that a mocking framework should be lenient by default. This means that unexpected method calls on mock objects (or, in other words, interactions that aren’t relevant for the test at hand) are allowed and answered with a default response. Conversely, mocking frameworks like EasyMock and JMock are strict by default, and throw an exception for every unexpected method call. While strictness enforces rigor, it can also lead to over-specification, resulting in brittle tests that fail with every other internal code change. Spock’s mocking framework makes it easy to describe only what’s relevant about an interaction, avoiding the over-specification trap.

Initially, mock objects have no behavior. Calling methods on them is allowed but has no effect other than returning the default value for the method’s return type (`false`, 0, or `null`). An exception are the `Object.equals`, `Object.hashCode`, and `Object.toString` methods, which have the following default behavior: A mock object is only equal to itself, has a unique hash code, and a string representation that includes the name of the type it represents. This default behavior is overridable by stubbing the methods, which we will learn about in the [Stubbing](./Stubbing.md) section.
