## Mixing Interactions and Conditions
---

A `then:` block may contain both interactions and conditions. Although not strictly required, it is customary to declare interactions before conditions:

```groovy
when:
publisher.send("hello")

then:
1 * subscriber.receive("hello")
publisher.messageCount == 1

```

Read out aloud: "When the publisher sends a 'hello' message, then the subscriber should receive the message exactly once, and the publisher’s message count should be one."
