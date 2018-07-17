## PendingFeature
----

To indicate that the feature is not fully implemented yet and should not be reported as error, annotate it with `spock.lang.PendingFeature`.

The use case is to annotate tests that can not yet run but should already be committed. The main difference to Ignore is that the test are executed, but test failures are ignored. If the test passes without an error, then it will be reported as failure since the PendingFeature annotation should be removed. This way the tests will become part of the normal tests instead of being ignored forever.

Groovy has the `groovy.transform.NotYetImplemented` annotation which is similar but behaves a differently.

* it will mark failing tests as passed
* if at least one iteration of a data-driven test passes it will be reported as error

`PendingFeature`:

* it will mark failing tests as skipped
* if at least one iteration of a data-driven test fails it will be reported as skipped
* if every iteration of a data-driven test passes it will be reported as error

```groovy
@PendingFeature
def "not implemented yet"() { ... }
```
