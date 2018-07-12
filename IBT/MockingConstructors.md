## Mocking Constructors
-----
(Think twice before using this feature. It might be better to change the design of the code under specification.)

Global mocks support mocking of constructors:

```groovy
def anySubscriber = GroovySpy(RealSubscriber, global: true)

1 * new RealSubscriber("Fred")
```

Since we are using a spy, the object returned from the constructor call remains unchanged. To change which object gets constructed, we can stub the constructor:

```groovy
new RealSubscriber("Fred") >> new RealSubscriber("Barney")
```

Now, whenever some code tries to construct a subscriber named Fred, we’ll construct a subscriber named Barney instead.
