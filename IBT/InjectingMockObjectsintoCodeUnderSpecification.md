# Injecting Mock Objects into Code Under Specification
----

After creating the publisher and its subscribers, we need to make the latter known to the former:

```groovy
class PublisherSpec extends Specification {
  Publisher publisher = new Publisher()
  Subscriber subscriber = Mock()
  Subscriber subscriber2 = Mock()

  def setup() {
    publisher.subscribers << subscriber // << is a Groovy shorthand for List.add()
    publisher.subscribers << subscriber2
  }
```

We are now ready to describe the expected interactions between the two parties.
