## Declaring Interactions at Mock Creation Time (New in 0.7)
---

If a mock has a set of "base" interactions that don’t vary, they can be declared right at mock creation time:

```groovy
def subscriber = Mock(Subscriber) {
   1 * receive("hello")
   1 * receive("goodbye")
}
```

This feature is particularly attractive for [Stubbing](./Stubbing.md) and with dedicated [Stubs](./Stubs.md). Note that the interactions don’t (and cannot [2]) have a target constraint; it’s clear from the context which mock object they belong to.

Interactions can also be declared when initializing an instance field with a mock:

```groovy
class MySpec extends Specification {
    Subscriber subscriber = Mock {
        1 * receive("hello")
        1 * receive("goodbye")
    }
}
```
