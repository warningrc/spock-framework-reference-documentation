# Groovy Mocks (New in 0.7)
---
So far, all the mocking features we have seen work the same no matter if the calling code is written in Java or Groovy. By leveraging Groovy’s dynamic capabilities, Groovy mocks offer some additional features specifically for testing Groovy code. They are created with the `MockingApi.GroovyMock()`, `MockingApi.GroovyStub(),` and `MockingApi.GroovySpy()` factory methods.


>TIP
>> When Should Groovy Mocks be Favored over Regular Mocks? Groovy mocks should be used when the code under specification is written in Groovy and some of the unique Groovy mock features are needed. When called from Java code, Groovy mocks will behave like regular mocks. Note that it isn’t necessary to use a Groovy mock merely because the code under specification and/or mocked type is written in Groovy. Unless you have a concrete reason to use a Groovy mock, prefer a regular mock.
