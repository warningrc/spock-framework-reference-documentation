## Returning Fixed Values
----

We have already seen the use of the right-shift (`>>`) operator to return a fixed value:

```groovy
subscriber.receive(_) >> "ok"
```

To return different values for different invocations, use multiple interactions:

```groovy
subscriber.receive("message1") >> "ok"
subscriber.receive("message2") >> "fail"
```

This will return "`ok`" whenever "`message1`" is received, and "`fail`" whenever "`message2`" is received. There is no limit as to which values can be returned, provided they are compatible with the method’s declared return type.
