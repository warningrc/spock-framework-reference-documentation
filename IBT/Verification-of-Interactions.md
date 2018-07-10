## Verification of Interactions
---

There are two main ways in which a mock-based test can fail: An interaction can match more invocations than allowed, or it can match fewer invocations than required. The former case is detected right when the invocation happens, and causes a `TooManyInvocationsError`:

```groovy
Too many invocations for:

2 * subscriber.receive(_) (3 invocations)
```

To make it easier to diagnose why too many invocations matched, Spock will show all invocations matching the interaction in question (new in Spock 0.7):

```groovy
Matching invocations (ordered by last occurrence):

2 * subscriber.receive("hello")   <-- this triggered the error
1 * subscriber.receive("goodbye")
```

According to this output, one of the `receive("hello")` calls triggered the `TooManyInvocationsError`. Note that because indistinguishable calls like the two invocations of `subscriber.receive("hello")` are aggregated into a single line of output, the first `receive("hello")` may well have occurred before the `receive("goodbye")`.

The second case (fewer invocations than required) can only be detected once execution of the when block has completed. (Until then, further invocations may still occur.) It causes a `TooFewInvocationsError`:

```groovy
Too few invocations for:

1 * subscriber.receive("hello") (0 invocations)
```

Note that it doesn’t matter whether the method was not called at all, the same method was called with different arguments, the same method was called on a different mock object, or a different method was called "instead" of this one; in either case, a `TooFewInvocationsError` error will occur.

To make it easier to diagnose what happened "instead" of a missing invocation, Spock will show all invocations that didn’t match any interaction, ordered by their similarity with the interaction in question (new in Spock 0.7). In particular, invocations that match everything but the interaction’s arguments will be shown first:

```groovy
Unmatched invocations (ordered by similarity):

1 * subscriber.receive("goodbye")
1 * subscriber2.receive("hello")
```
