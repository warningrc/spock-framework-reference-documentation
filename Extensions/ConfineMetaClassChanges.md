## ConfineMetaClassChanges
------

To confine meta class changes to the scope of a feature method or spec class, use `spock.util.mop.ConfineMetaClassChanges`:

```groovy
@Stepwise
class FooSpec extends Specification {
  @ConfineMetaClassChanges([String])
  def "I run first"() {
    when:
    String.metaClass.someMethod = { delegate }

    then:
    String.metaClass.hasMetaMethod('someMethod')
  }

  def "I run second"() {
    when:
    "Foo".someMethod()

    then:
    thrown(MissingMethodException)
  }
}
```

When applied to a spec class, the meta classes are restored to the state that they were in before `setupSpec` was executed, after `cleanupSpec` is executed.

When applied to a feature method, the meta classes are restored to as they were after `setup` was executed, before `cleanup` is executed.

> CAUTION
>> Temporarily changing the meta classes is only safe when specs are run in a single thread per JVM. Even though many execution environments do limit themselves to one thread per JVM, keep in mind that Spock cannot enforce this.
