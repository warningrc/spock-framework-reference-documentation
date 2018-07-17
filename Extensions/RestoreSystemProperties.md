## RestoreSystemProperties
------

Saves system properties before the annotated feature method (including any setup and cleanup methods) gets run, and restores them afterwards.

Applying this annotation to a spec class has the same effect as applying it to all its feature methods.

```groovy
@RestoreSystemProperties
def "determines family based on os.name system property"() {
  given:
  System.setProperty('os.name', 'Windows 7')

  expect:
  OperatingSystem.current.family == OperatingSystem.Family.WINDOWS
}
```

> CAUTION
>> Temporarily changing the values of system properties is only safe when specs are run in a single thread per JVM. Even though many execution environments do limit themselves to one thread per JVM, keep in mind that Spock cannot enforce this.
