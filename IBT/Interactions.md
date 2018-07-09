## Interactions
----

> ## Is an Interaction Just a Regular Method Invocation?
> Not quite. While an interaction looks similar to a regular method invocation, it is simply a way to express which method invocations are expected to occur. A good way to think of an interaction is as a regular expression that all incoming invocations on mock objects are matched against. Depending on the circumstances, the interaction may match zero, one, or multiple invocations.

Let’s take a closer look at the `then`: block. It contains *two interactions*, each of which has four distinct parts: a *cardinality, a target constraint, a method constraint, and an argument constraint*:

```groovy
1 * subscriber.receive("hello")
|   |          |       |
|   |          |       argument constraint
|   |          method constraint
|   target constraint
cardinality
```
