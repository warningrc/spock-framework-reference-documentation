## Ignore
-----

To temporarily prevent a feature method from getting executed, annotate it with `spock.lang.Ignore`:

```groovy
@Ignore
def "my feature"() { ... }
```

For documentation purposes, a reason can be provided:

```groovy
@Ignore("TODO")
def "my feature"() { ... }
```

To ignore a whole specification, annotate its class:

```groovy
@Ignore
class MySpec extends Specification { ... }
```

In most execution environments, ignored feature methods and specs will be reported as "skipped".

Care should be taken when ignoring feature methods in a spec class annotated with `spock.lang.Stepwise` since later feature methods may depend on earlier feature methods having executed.
