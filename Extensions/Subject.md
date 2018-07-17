## Subject
----

To indicate one or more subjects of a spec, use `spock.lang.Subject`:

```groovy
@Subject([Foo, Bar]) { ... }
```

Additionally, Subject can be applied to fields and local variables:

```groovy
@Subject
Foo myFoo
```

Subject currently has only informational purposes.
