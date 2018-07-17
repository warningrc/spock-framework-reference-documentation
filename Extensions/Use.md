## Use
----

To activate one or more Groovy categories within the scope of a feature method or spec, use `spock.util.mop.Use`:

```groovy
class ListExtensions {
  static avg(List list) { list.sum() / list.size() }
}

class MySpec extends Specification {
  @Use(listExtensions)
  def "can use avg() method"() {
    expect:
    [1, 2, 3].avg() == 2
  }
}
```

This can be useful for stubbing of dynamic methods, which are usually provided by the runtime environment (e.g. Grails). It has no effect when applied to a helper method. However, when applied to a spec class, it will also affect its helper methods.
