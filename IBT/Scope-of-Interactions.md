## Scope of Interactions
---

Interactions declared in a then: block are scoped to the preceding when: block:

```groovy
when:
publisher.send("message1")

then:
1 * subscriber.receive("message1")

when:
publisher.send("message2")

then:
1 * subscriber.receive("message2")
```

This makes sure that subscriber receives `"message1"` during execution of the first `when:` block, and `"message2"` during execution of the second `when:` block.

Interactions declared outside a `then:` block are active from their declaration until the end of the containing feature method.

Interactions are always scoped to a particular feature method. Hence they cannot be declared in a static method, `setupSpec` method, or `cleanupSpec` method. Likewise, mock objects should not be stored in static or `@Shared` fields.
