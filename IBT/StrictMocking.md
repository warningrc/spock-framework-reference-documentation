## Strict Mocking

----

Now, when would matching any method call be useful? A good example is strict mocking, a style of mocking where no interactions other than those explicitly declared are allowed:

```groovy
when:
publisher.publish("hello")

then:
1 * subscriber.receive("hello") // demand one 'receive' call on 'subscriber'
_ * auditing._                  // allow any interaction with 'auditing'
0 * _                           // don't allow any other interaction
```


`0 *` only makes sense as the last interaction of a `then:` block or method. Note the use of `_ *` (any number of calls), which allows any interaction with the auditing component.


> `_ *` is only meaningful in the context of strict mocking. In particular, it is never necessary when [Stubbing](./Stubbing.md) an invocation. For example, `_ * auditing.record() >> "ok"` can (and should!) be simplified to `auditing.record() >> "ok"`.
