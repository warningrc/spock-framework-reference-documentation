# Creating Mock Objects
----

Mock objects are created with the `MockingApi.Mock()` method.[1] Let’s create two mock subscribers:

```java
def subscriber = Mock(Subscriber)
def subscriber2 = Mock(Subscriber)
```

Alternatively, the following Java-like syntax is supported, which may give better IDE support:

```java
Subscriber subscriber = Mock()
Subscriber subscriber2 = Mock()
```
Here, the mock’s type is inferred from the variable type on the left-hand side of the assignment.

> If the mock’s type is given on the left-hand side of the assignment, it’s permissible (though not required) to omit it on the right-hand side.

Mock objects literally implement (or, in the case of a class, extend) the type they stand in for. In other words, in our example `subscriber` is-a `Subscriber`. Hence it can be passed to statically typed (Java) code that expects this type.

-----

1. For additional ways to create mock objects, see Other Kinds of Mock Objects (New in 0.7) and A la Carte Mocks.
