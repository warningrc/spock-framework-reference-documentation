## A la Carte Mocks
----

At the end of the day, the `Mock()`, `Stub()`, and `Spy()` factory methods are just canned ways to create mock objects with a certain configuration. If you want more fine-grained control over a mock’s configuration, have a look at the `org.spockframework.mock.IMockConfiguration` interface. All properties of this interface  can be passed as named arguments to the `Mock()` method. For example:

```groovy
def person = Mock(name: "Fred", type: Person, defaultResponse: ZeroOrNullResponse, verified: false)
```
Here, we create a mock whose default return values match those of a `Mock()`, but whose invocations aren’t verified (as for a `Stub()`). Instead of passing `ZeroOrNullResponse`, we could have supplied our own custom `org.spockframework.mock.IDefaultResponse` for responding to unexpected method invocations.
