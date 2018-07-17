## Requires
-----

To execute a feature method under certain conditions, annotate it with `spock.lang.Requires`, followed by a predicate:

```groovy
@Requires({ os.windows })
def "I'll only run on Windows"() { ... }
```

`Requires` works exactly like `IgnoreIf`, except that the predicate is inverted. In general, it is preferable to state the conditions under which a method gets executed, rather than the conditions under which it gets ignored.
