## Invocation Order
---

Often, the exact method invocation order isn’t relevant and may change over time. To avoid over-specification, Spock defaults to allowing any invocation order, provided that the specified interactions are eventually satisfied:

```groovy
then:
2 * subscriber.receive("hello")
1 * subscriber.receive("goodbye")
```

Here, any of the invocation sequences `"hello"` `"hello"` `"goodbye"`, `"hello"` `"goodbye"` `"hello"`, and `"goodbye"` `"hello"` `"hello"` will satisfy the specified interactions.

In those cases where invocation order matters, you can impose an order by splitting up interactions into multiple `then:` blocks:

```groovy
then:
2 * subscriber.receive("hello")

then:
1 * subscriber.receive("goodbye")
```

Now Spock will verify that both `"hello"`'s are received before the `"goodbye"`. In other words, invocation order is enforced between but not within `then:` blocks.

>> Splitting up a `then:` block with `and:` does not impose any ordering, as `and:` is only meant for documentation purposes and doesn’t carry any semantics.
