## Detecting Mock Objects

----

To find out whether a particular object is a Spock mock object, use a org.spockframework.mock.MockDetector:

```groovy
def detector = new MockDetector()
def list1 = []
def list2 = Mock(List)

expect:
!detector.isMock(list1)
detector.isMock(list2)

```

A detector can also be used to get more information about a mock object:

```groovy
def mock = detector.asMock(list2)

expect:
mock.name == "list2"
mock.type == List
mock.nature == MockNature.MOCK
```
