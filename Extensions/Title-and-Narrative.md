### Title and Narrative

To attach a natural-language name to a spec, use `spock.lang.Title`:

```groovy
@Title("This is easy to read")
class ThisIsHarderToReadSpec extends Specification {
  ...
}
```

Similarly, to attach a natural-language description to a spec, use `spock.lang.Narrative`:

```groovy
@Narrative("""
As a user
I want foo
So that bar
""")
class GiveTheUserFooSpec() { ... }
```
