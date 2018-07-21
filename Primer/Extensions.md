
##Extensions
As we have seen, Spock offers lots of functionality for writing specifications. However, there always comes a time when something else is needed. Therefore, Spock provides an interception-based extension mechanism. Extensions are activated by annotations called directives. Currently, Spock ships with the following directives:

| | |
|--|--|
|`@Timeout`|Sets a timeout for execution of a feature or fixture method.|
|`@Ignore`| Ignores a feature method.|
|`@IgnoreRest`|Ignores all feature methods not carrying this annotation. Useful for quickly running just a single method.|
|`@FailsWith`|Expects a feature method to complete abruptly. `@FailsWith` has two use cases: First, to document known bugs that cannot be resolved immediately. Second, to replace exception conditions in certain corner cases where the latter cannot be used (like specifying the behavior of exception conditions). In all other cases, exception conditions are preferable.|

To learn how to implement your own directives and extensions, go to the [Extensions](#extensions) chapter.
