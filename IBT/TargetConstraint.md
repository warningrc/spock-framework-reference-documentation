## Target Constraint

---

The target constraint of an interaction describes which mock object is expected to receive the method call:

```groovy
1 * subscriber.receive("hello") // a call to 'subscriber'
1 * _.receive("hello")          // a call to any mock object
```
