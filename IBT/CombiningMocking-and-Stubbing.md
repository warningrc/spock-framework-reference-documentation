# Combining Mocking and Stubbing

Mocking and stubbing go hand-in-hand:

```groovy
1 * subscriber.receive("message1") >> "ok"
1 * subscriber.receive("message2") >> "fail"
```

When mocking and stubbing the same method call, they have to happen in the same interaction. In particular, the following Mockito-style splitting of stubbing and mocking into two separate statements will not work:

```groovy
setup:
subscriber.receive("message1") >> "ok"

when:
publisher.send("message1")

then:
1 * subscriber.receive("message1")
```

As explained in [Where to Declare Interactions](./Where-to-DeclareInteractions.md), the `receive` call will first get matched against the interaction in the `then:` block. Since that interaction doesn’t specify a response, the default value for the method’s return type (`null` in this case) will be returned. (This is just another facet of Spock’s lenient approach to mocking.). Hence, the interaction in the `setup:` block will never get a chance to match.

> NOTE
>> Mocking and stubbing of the same method call has to happen in the same interaction.
