## Mocking Dynamic Methods
---

All Groovy mocks implement the `GroovyObject` interface. They support the mocking and stubbing of dynamic methods as if they were physically declared methods:

```groovy
def subscriber = GroovyMock(Subscriber)

1 * subscriber.someDynamicMethod("hello")
```
