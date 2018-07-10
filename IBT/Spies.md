## Spies
----
(Think twice before using this feature. It might be better to change the design of the code under specification.)

A spy is created with the `MockingApi.Spy` factory method:

```groovy
def subscriber = Spy(SubscriberImpl, constructorArgs: ["Fred"])
```

A spy is always based on a real object. Hence you must provide a class type rather than an interface type, along with any constructor arguments for the type. If no constructor arguments are provided, the type’s default constructor will be used.

You may also create a spy from an instantiated object. This may be useful in cases where you do not have full control over the instatiation of types you are interested in spying. (For example when testing within a Dependency Injection framework such as Spring or Guice.)

Method calls on a spy are automatically delegated to the real object. Likewise, values returned from the real object’s methods are passed back to the caller via the spy.

After creating a spy, you can listen in on the conversation between the caller and the real object underlying the spy:

```groovy
1 * subscriber.receive(_)
```

Apart from making sure that receive gets called exactly once, the conversation between the publisher and the SubscriberImpl instance underlying the spy remains unaltered.

When stubbing a method on a spy, the real method no longer gets called:

```groovy
subscriber.receive(_) >> "ok"
```

Instead of calling `SubscriberImpl.receive`, the `receive` method will now simply return "ok".

Sometimes, it is desirable to both execute some code and delegate to the real method:

```groovy
subscriber.receive(_) >> { String message -> callRealMethod(); message.size() > 3 ? "ok" : "fail" }
```

Here we use `callRealMethod()` to delegate the method invocation to the real object. Note that we don’t have to pass the message argument along; this is taken care of automatically. callRealMethod() returns the real invocation’s result, but in this example we opted to return our own result instead. If we had wanted to pass a different message to the real method, we could have used `callRealMethodWithArgs("changed message")`.
