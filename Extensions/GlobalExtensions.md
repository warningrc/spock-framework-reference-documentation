## Global Extensions

To create a global extension you need to create a class that implements the interface `IGlobalExtension` and put its fully-qualified class name in a file `META-INF/services/org.spockframework.runtime.extension.IGlobalExtension` in the class path. As soon as these two conditions are satisfied, the extension is automatically loaded and used when Spock is running. For convenience there is also the class `AbstractGlobalExtension`, which provides empty implementations for all methods in the interface, so that only the needed ones need to be overridden.

`IGlobalExtension` has the following three methods:

`start()`

This is called once at the very start of the Spock execution.

`visitSpec(SpecInfo spec)`

This is called once for each specification. In this method you can prepare a specification with your extension magic, like attaching interceptors to various interception points as described in the chapter [Interceptors](./Interceptors.md).

`stop()`

This is called once at the very end of the Spock execution.
