## IgnoreRest
-----
To ignore all but a (typically) small subset of methods, annotate the latter with `spock.lang.IgnoreRest`:

```groovy
def "I'll be ignored"() { ... }

@IgnoreRest
def "I'll run"() { ... }

def "I'll also be ignored"() { ... }
```

`@IgnoreRest` is especially handy in execution environments that don’t provide an (easy) way to run a subset of methods.

Care should be taken when ignoring feature methods in a spec class annotated with `spock.lang.Stepwise` since later feature methods may depend on earlier feature methods having executed.
