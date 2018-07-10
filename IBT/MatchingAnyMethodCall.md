## Matching Any Method Call
----

Sometimes it can be useful to match "anything", in some sense of the word:

```groovy
1 * subscriber._(*_)     // any method on subscriber, with any argument list
1 * subscriber._         // shortcut for and preferred over the above

1 * _._                  // any method call on any mock object
1 * _                    // shortcut for and preferred over the above
```
--------

> Although `(..) * .(*_) >> _` is a valid interaction declaration, it is neither good style nor particularly useful.
