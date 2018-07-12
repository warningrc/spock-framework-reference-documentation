## Mocking All Instances of a Type
-----
(Think twice before using this feature. It might be better to change the design of the code under specification.)

Usually, Groovy mocks need to be injected into the code under specification just like regular mocks. However, when a Groovy mock is created as *global*, it automagically replaces all real instances of the mocked type for the duration of the feature method:


```groovy
def publisher = new Publisher()
publisher << new RealSubscriber() << new RealSubscriber()

def anySubscriber = GroovyMock(RealSubscriber, global: true)

when:
publisher.publish("message")

then:
2 * anySubscriber.receive("message")
```

Here, we set up the publisher with two instances of a real subscriber implementation. Then we create a global mock of the same type. This reroutes all method calls on the real subscribers to the mock object. The mock object’s instance isn’t ever passed to the publisher; it is only used to describe the interaction.

>NOTE
>>A global mock can only be created for a class type. It effectively replaces all instances of that type for the duration of the feature method.

Since global mocks have a somewhat, well, global effect, it’s often convenient to use them together with GroovySpy. This leads to the real code getting executed unless an interaction matches, allowing you to selectively listen in on objects and change their behavior just where needed.

> ## How Are Global Groovy Mocks Implemented?
> Global Groovy mocks get their super powers from Groovy meta-programming. To be more precise, every globally mocked type is assigned a custom meta class for the duration of the feature method. Since a global Groovy mock is still based on a CGLIB proxy, it will retain its general mocking capabilities (but not its super powers) when called from Java code.
