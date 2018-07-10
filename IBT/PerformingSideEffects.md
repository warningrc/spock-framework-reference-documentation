## Performing Side Effects
---

Sometimes you may want to do more than just computing a return value. A typical example is throwing an exception. Again, closures come to the rescue:

```groovy
subscriber.receive(_) >> { throw new InternalError("ouch") }
```

Of course, the closure can contain more code, for example a println statement. It will get executed every time an incoming invocation matches the interaction.
