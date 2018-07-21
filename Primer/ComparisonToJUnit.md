
##Comparison to JUnit
Although Spock uses a different terminology, many of its concepts and features are inspired from JUnit. Here is a rough comparison:

|Spock|JUnit|
|--|--|
|`Specification`|`Test class`|
|`setup()`|`@Before`|
|`cleanup()`|`@After`|
|`setupSpec()`|`@BeforeClass`|
|`cleanupSpec()`|`@AfterClass`|
|`Feature`|`Test`|
|`Feature method`|`Test method`|
|`Data-driven feature`|`Theory`|
|`Condition`|`Assertion`|
|`Exception condition`|`@Test(expected=…​)`|
|`Interaction`|`Mock expectation (e.g. in Mockito)`|
