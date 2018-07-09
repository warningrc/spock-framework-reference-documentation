## Method Constraint

----

The method constraint of an interaction describes which method is expected to be called:

```java
1 * subscriber.receive("hello") // a method named 'receive'
1 * subscriber./r.*e/("hello")  // a method whose name matches the given regular expression
                                // (here: method name starts with 'r' and ends in 'e')
```

When expecting a call to a getter method, Groovy property syntax can be used instead of method syntax:


```java
1 * subscriber.status // same as: 1 * subscriber.getStatus()
```

When expecting a call to a setter method, only method syntax can be used:

```java
1 * subscriber.setStatus("ok") // NOT: 1 * subscriber.status = "ok"
```
