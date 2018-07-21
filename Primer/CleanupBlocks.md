
### 清理代码块 (`Cleanup Blocks`)

```groovy
setup:
def file = new File("/some/path")
file.createNewFile()

// ...

cleanup:
file.delete()
```

A `cleanup` block may only be followed by a `where` block, and may not be repeated. Like a `cleanup` method, it is used to free any resources used by a feature method, and is run even if (a previous part of) the feature method has produced an exception. As a consequence, a `cleanup` block must be coded defensively; in the worst case, it must gracefully handle the situation where the first statement in a feature method has thrown an exception, and all local variables still have their default values.

>Groovy’s safe dereference operator (`foo?.bar()`) simplifies writing defensive code.

Object-level specifications usually don’t need a `cleanup` method, as the only resource they consume is memory, which is automatically reclaimed by the garbage collector. More coarse-grained specifications, however, might use a `cleanup` block to clean up the file system, close a database connection, or shut down a network service.

>If a specification is designed in such a way that all its feature methods require the same resources, use a `cleanup()` method; otherwise, prefer `cleanup` blocks. The same trade-off applies to `setup()` methods and `setup` blocks.
