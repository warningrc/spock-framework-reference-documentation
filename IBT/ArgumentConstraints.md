## Argument Constraints

---

The argument constraints of an interaction describe which method arguments are expected:

```groovy
1 * subscriber.receive("hello")     // an argument that is equal to the String "hello"
1 * subscriber.receive(!"hello")    // an argument that is unequal to the String "hello"
1 * subscriber.receive()            // the empty argument list (would never match in our example)
1 * subscriber.receive(_)           // any single argument (including null)
1 * subscriber.receive(*_)          // any argument list (including the empty argument list)
1 * subscriber.receive(!null)       // any non-null argument
1 * subscriber.receive(_ as String) // any non-null argument that is-a String
1 * subscriber.receive({ it.size() > 3 }) // an argument that satisfies the given predicate
                                          // (here: message length is greater than 3)
```

Argument constraints work as expected for methods with multiple arguments:

```groovy
1 * process.invoke("ls", "-a", _, !null, { ["abcdefghiklmnopqrstuwx1"].contains(it) })
```

When dealing with vararg methods, vararg syntax can also be used in the corresponding interactions:


```groovy
interface VarArgSubscriber {
    void receive(String... messages)
}

...

subscriber.receive("hello", "goodbye")
```

> ## Spock Deep Dive: Groovy Varargs
> Groovy allows any method whose last parameter has an array type to be called in vararg style. Consequently, vararg syntax can also be used in interactions matching such methods.
