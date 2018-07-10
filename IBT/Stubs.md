## Stubs
----
A stub is created with the `MockingApi.Stub` factory method:

```groovy
def subscriber = Stub(Subscriber)
```

Whereas a mock can be used both for stubbing and mocking, a stub can only be used for stubbing. Limiting a collaborator to a stub communicates its role to the readers of the specification.


>NOTE
>>If a stub invocation matches a mandatory interaction (like `1 * foo.bar()`), an `InvalidSpecException` is thrown.

Like a mock, a stub allows unexpected invocations. However, the values returned by a stub in such cases are more ambitious:

* For primitive types, the primitive type’s default value is returned.
* For non-primitive numerical values (such as BigDecimal), zero is returned.
* For non-numerical values, an "empty" or "dummy" object is returned. This could mean an empty String, an empty collection, an object constructed from its default constructor, or another stub returning default values. See class `org.spockframework.mock.EmptyOrDummyResponse` for the details.

>NOTE
>>If the response type of the method is a final class or if it requires a class-mocking library and cglib or ByteBuddy are not available, then the "dummy" object creation will fail with a `CannotCreateMockException`.

A stub often has a fixed set of interactions, which makes [declaring interactions at mock creation time](./DeclaringInteractions-at-MockCreationTime.md) particularly attractive:

```groovy
def subscriber = Stub(Subscriber) {
    receive("message1") >> "ok"
    receive("message2") >> "fail"
}
```
