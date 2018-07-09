# Mocking

----

Mocking is the act of describing (mandatory) interactions between the object under specification and its collaborators. Here is an example:

```groovy
def "should send messages to all subscribers"() {
  when:
  publisher.send("hello")

  then:
  1 * subscriber.receive("hello")
  1 * subscriber2.receive("hello")
}
```

Read out aloud: "When the publisher sends a 'hello' message, then both subscribers should receive that message exactly once."

When this feature method gets run, all invocations on mock objects that occur while executing the `when` block will be matched against the interactions described in the `then`: block. If one of the interactions isn’t satisfied, a (subclass of) `InteractionNotSatisfiedError` will be thrown. This verification happens automatically and does not require any additional code.
