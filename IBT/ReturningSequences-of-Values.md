## Returning Sequences of Values
---

To return different values on successive invocations, use the triple-right-shift (`>>>`) operator:

```groovy
subscriber.receive(_) >>> ["ok", "error", "error", "ok"]
```

This will return "`ok`" for the first invocation, "`error`" for the second and third invocation, and "`ok`" for all remaining invocations. The right-hand side must be a value that Groovy knows how to iterate over; in this example, we’ve used a plain list.
