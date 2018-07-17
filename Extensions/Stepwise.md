## Stepwise
----
To execute features in the order that they are declared, annotate a spec class with `spock.lang.Stepwise`:

```groovy
@Stepwise
class RunInOrderSpec extends Specification {
  def "I run first"()  { ... }
  def "I run second"() { ... }
}
```

`Stepwise` only affects the class carrying the annotation; not sub or super classes. Features after the first failure are skipped.

`Stepwise` does not override the behaviour of annotations such as `Ignore`, `IgnoreRest`, and `IgnoreIf`, so care should be taken when ignoring feature methods in spec classes annotated with `Stepwise`.
