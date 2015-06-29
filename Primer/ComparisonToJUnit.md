<style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}
</style>

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