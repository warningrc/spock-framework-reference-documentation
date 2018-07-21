

# Interaction Based Testing
##### Peter Niederwieser, The Spock Framework Team Version 1.1
----

Interaction-based testing is a design and testing technique that emerged in the Extreme Programming (XP) community in the early 2000’s. Focusing on the behavior of objects rather than their state, it explores how the object(s) under specification interact, by way of method calls, with their collaborators.

For example, suppose we have a `Publisher` that sends messages to its `Subscriber`s:

```java
class Publisher {
  List<Subscriber> subscribers = []
  int messageCount = 0
  void send(String message){
    subscribers*.receive(message)
    messageCount++
  }
}

interface Subscriber {
  void receive(String message)
}

class PublisherSpec extends Specification {
  Publisher publisher = new Publisher()
}
```

How are we going to test `Publisher`? With state-based testing, we can verify that the publisher keeps track of its subscribers. The more interesting question, though, is whether a message sent by the publisher is received by the subscribers. To answer this question, we need a special implementation of `Subscriber` that listens in on the conversation between the publisher and its subscribers. Such an implementation is called a *mock object*.

While we could certainly create a mock implementation of `Subscriber` by hand, writing and maintaining this code can get unpleasant as the number of methods and complexity of interactions increases. This is where mocking frameworks come in: They provide a way to describe the expected interactions between an object under specification and its collaborators, and can generate mock implementations of collaborators that verify these expectations.

> ## How Are Mock Implementations Generated?
> Like most Java mocking frameworks, Spock uses [JDK dynamic proxies](http://docs.oracle.com/javase/7/docs/api/java/lang/reflect/Proxy.html) (when mocking interfaces) and [CGLIB](https://github.com/cglib/cglib) proxies (when mocking classes) to generate mock implementations at runtime. Compared to implementations based on Groovy meta-programming, this has the advantage that it also works for testing Java code.

The Java world has no shortage of popular and mature mocking frameworks: [JMock](http://www.jmock.org/), [EasyMock](http://www.easymock.org/), [Mockito](http://mockito.org/), to name just a few. Although each of these tools can be used together with Spock, we decided to roll our own mocking framework, tightly integrated with Spock’s specification language. This decision was driven by the desire to leverage all of Groovy’s capabilities to make interaction-based tests easier to write, more readable, and ultimately more fun. We hope that by the end of this chapter, you will agree that we have achieved these goals.

Except where indicated, all features of Spock’s mocking framework work both for testing Java and Groovy code.
