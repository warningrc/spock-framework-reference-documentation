# Stubbing
---

Stubbing is the act of making collaborators respond to method calls in a certain way. When stubbing a method, you don’t care if and how many times the method is going to be called; you just want it to return some value, or perform some side effect, `whenever` it gets called.

For the sake of the following examples, let’s modify the `Subscriber`'s `receive` method to return a status code that tells if the subscriber was able to process a message:

```java
interface Subscriber {
    String receive(String message)
}
```

Now, let’s make the `receive` method return `"ok"` on every invocation:

```groovy
subscriber.receive(_) >> "ok"
```

Read out aloud: "*Whenever* the subscriber receives a message, *make* it respond with 'ok'."

Compared to a mocked interaction, a stubbed interaction has no cardinality on the left end, but adds a response generator on the right end:

```groovy
subscriber.receive(_) >> "ok"
|          |       |     |
|          |       |     response generator
|          |       argument constraint
|          method constraint
target constraint
```

A stubbed interaction can be declared in the usual places: either inside a `then:` block, or anywhere before a `when:` block. (See [Where to Declare Interactions](./Where-to-DeclareInteractions.md) for the details.) If a mock object is only used for stubbing, it’s common to declare interactions [at mock creation time](./DeclaringInteractions-at-MockCreationTime.md) or in a `setup:` block.
