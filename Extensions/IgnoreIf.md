## IgnoreIf
-----
To ignore a feature method under certain conditions, annotate it with `spock.lang.IgnoreIf`, followed by a predicate:

```groovy
@IgnoreIf({ System.getProperty("os.name").contains("windows") })
def "I'll run everywhere but on Windows"() { ... }
```

To make predicates easier to read and write, the following properties are available inside the closure:

* `sys` A map of all system properties
* `env` A map of all environment variables
* `os` Information about the operating system (see `spock.util.environment.OperatingSystem`)
* `jvm` Information about the JVM (see `spock.util.environment.Jvm`)

Using the os property, the previous example can be rewritten as:

```groovy
@IgnoreIf({ os.windows })
def "I'll run everywhere but on Windows"() { ... }
```

Care should be taken when ignoring feature methods in a spec class annotated with `spock.lang.Stepwise` since later feature methods may depend on earlier feature methods having executed.
