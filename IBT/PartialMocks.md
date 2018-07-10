## Partial Mocks
----

(Think twice before using this feature. It might be better to change the design of the code under specification.)

Spies can also be used as partial mocks:

```groovy
// this is now the object under specification, not a collaborator
def persister = Spy(MessagePersister) {
  // stub a call on the same object
  isPersistable(_) >> true
}

when:
persister.receive("msg")

then:
// demand a call on the same object
1 * persister.persist("msg")
```
