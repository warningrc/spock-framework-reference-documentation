## See
----

To link to one or more references to external information related to a specification or feature, use `spock.lang.See`:

```groovy
@See("http://spockframework.org/spec")
class MoreInformationAvailableSpec extends Specification {
  @See(["http://en.wikipedia.org/wiki/Levenshtein_distance", "http://www.levenshtein.net/"])
  def "Even more information is available on the feature"() { ... }
}
```
