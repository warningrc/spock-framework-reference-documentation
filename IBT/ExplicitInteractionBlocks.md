## Explicit Interaction Blocks
----

Internally, Spock must have full information about expected interactions *before* they take place. So how is it possible for interactions to be declared in a `then:` block? The answer is that under the hood, Spock moves interactions declared in a then: block to immediately before the preceding `when:` block. In most cases this works out just fine, but sometimes it can lead to problems:

```groovy
when:
publisher.send("hello")

then:
def message = "hello"
1 * subscriber.receive(message)
```
Here we have introduced a variable for the expected argument. (Likewise, we could have introduced a variable for the cardinality.) However, Spock isn’t smart enough (huh?) to tell that the interaction is intrinsically linked to the variable declaration. Hence it will just move the interaction, which will cause a `MissingPropertyException` at runtime.


One way to solve this problem is to move (at least) the variable declaration to before the when: block. (Fans of [Data Driven Testing](../DDT/README.md) might move the variable into a `where:` block.) In our example, this would have the added benefit that we could use the same variable for sending the message.

Another solution is to be explicit about the fact that variable declaration and interaction belong together:

```groovy
when:
publisher.send("hello")

then:
interaction {
  def message = "hello"
  1 * subscriber.receive(message)
}
```

Since an `MockingApi.interaction` block is always moved in its entirety, the code now works as intended.
