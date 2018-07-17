## Timeout
-----
To fail a feature method, fixture, or class that exceeds a given execution duration, use `spock.lang.Timeout`, followed by a duration, and optionally a time unit. The default time unit is seconds.

When applied to a feature method, the timeout is per execution of one iteration, excluding time spent in fixture methods:

```groovy
@Timeout(5)
def "I fail if I run for more than five seconds"() { ... }

@Timeout(value = 100, unit = TimeUnit.MILLISECONDS)
def "I better be quick" { ... }
```

Applying `Timeout` to a spec class has the same effect as applying it to each feature that is not already annotated with `Timeout`, excluding time spent in fixtures:

```groovy
@Timeout(10)
class TimedSpec extends Specification {
  def "I fail after ten seconds"() { ... }
  def "Me too"() { ... }

  @Timeout(value = 250, unit = MILLISECONDS)
  def "I fail much faster"() { ... }
}
```

When applied to a fixture method, the timeout is per execution of the fixture method.

When a timeout is reported to the user, the stack trace shown reflects the execution stack of the test framework when the timeout was exceeded.
