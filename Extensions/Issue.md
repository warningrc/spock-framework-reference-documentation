## Issue
-----

To indicate that a feature or spec relates to one or more issues in an external tracking system, use `spock.lang.Issue`:

```groovy
@Issue("http://my.issues.org/FOO-1")
class MySpec {
  @Issue("http://my.issues.org/FOO-2")
  def "Foo should do bar"() { ... }

  @Issue(["http://my.issues.org/FOO-3", "http://my.issues.org/FOO-4"])
  def "I have two related issues"() { ... }
}
```

If you have a common prefix URL for all issues in a project, you can use the [Spock Configuration File](./SpockConfigurationFile.md) to set it up for all at once. If it is set, it is prepended to the value of the `@Issue` annotation when building the URL.

If the `issueNamePrefix` is set, it is prepended to the value of the `@Issue` annotation when building the name for the issue.

**Issue Configuration**
```groovy
report {
    issueNamePrefix 'Bug '
    issueUrlPrefix 'http://my.issues.org/'
}
```
