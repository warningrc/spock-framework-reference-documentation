## AutoCleanup
----

Automatically clean up a field or property at the end of its lifetime by using `spock.lang.AutoCleanup`.

By default, an object is cleaned up by invoking its parameterless `close()` method. If some other method should be called instead, override the annotation’s value attribute:

```groovy
// invoke foo.dispose()
@AutoCleanup("dispose")
def foo
```


If multiple fields or properties are annotated with `AutoCleanup`, their objects are cleaned up sequentially, in reverse field/property declaration order, starting from the most derived class class and walking up the inheritance chain.

If a cleanup operation fails with an exception, the exception is reported by default, and cleanup proceeds with the next annotated object. To prevent cleanup exceptions from being reported, override the annotation’s `quiet` attribute:

```groovy
@AutoCleanup(quiet = true)
def ignoreMyExceptions
```
