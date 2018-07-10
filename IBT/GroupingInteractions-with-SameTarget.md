## Grouping Interactions with Same Target (New in 0.7)
---

Interactions sharing the same target can be grouped in a Specification.with block. Similar to [Declaring Interactions at Mock Creation Time](./DeclaringInteractions-at-MockCreationTime.md), this makes it unnecessary to repeat the target constraint:

```groovy
with(subscriber) {
    1 * receive("hello")
    1 * receive("goodbye")
}
```

A with block can also be used for grouping conditions with the same target.
