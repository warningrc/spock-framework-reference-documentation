## Mocking Static Methods
------

(Think twice before using this feature. It might be better to change the design of the code under specification.)

Global mocks support mocking and stubbing of static methods:

```groovy
def anySubscriber = GroovySpy(RealSubscriber, global: true)

1 * RealSubscriber.someStaticMethod("hello") >> 42
```

The same works for dynamic static methods.


When a global mock is used solely for mocking constructors and static methods, the mock’s instance isn’t really needed. In such a case one can just write:

```groovy
GroovySpy(RealSubscriber, global: true)
```
