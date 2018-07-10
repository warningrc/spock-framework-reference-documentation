## Computing Return Values
---

To compute a return value based on the method’s argument, use the the right-shift (`>>`) operator together with a closure. If the closure declares a single untyped parameter, it gets passed the method’s argument list:

```groovy
subscriber.receive(_) >> { args -> args[0].size() > 3 ? "ok" : "fail" }
```

Here "`ok`" gets returned if the message is more than three characters long, and "`fail`" otherwise.

In most cases it would be more convenient to have direct access to the method’s arguments. If the closure declares more than one parameter or a single typed parameter, method arguments will be mapped one-by-one to closure parameters:[1]

```groovy
subscriber.receive(_) >> { String message -> message.size() > 3 ? "ok" : "fail" }
```

This response generator behaves the same as the previous one, but is arguably more readable.

If you find yourself in need of more information about a method invocation than its arguments, have a look at `org.spockframework.mock.IMockInvocation`. All methods declared in this interface are available inside the closure, without a need to prefix them. (In Groovy terminology, the closure *delegates* to an instance of `IMockInvocation`.)

------
[1]:The destructuring semantics for closure arguments come straight from Groovy.
