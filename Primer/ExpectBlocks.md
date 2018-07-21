
### 预期代码块(`Expect Blocks`)

`expect`类似于`when-then`的结合，比如以下代码：

>An `expect` block is more limited than a `then` block in that it may only contain conditions and variable definitions. It is useful in situations where it is more natural to describe stimulus and expected response in a single expression. For example, compare the following two attempts to describe the `Math.max()` method:

```groovy
when:
def x = Math.max(1, 2)

then:
x == 2
```

```groovy
expect:
Math.max(1, 2) == 2
```

虽然两段代码在语义上是一样的，后者是更简洁/可取。一般情况下，`when-then`用于有副作用的方法，`expect`用于纯粹的功能性方法。

>Although both snippets are semantically equivalent, the second one is clearly preferable. As a guideline, use `when-then` to describe methods with side effects, and `expect` to describe purely functional methods.

>> Leverage [Groovy JDK](http://docs.groovy-lang.org/docs/latest/html/groovy-jdk/) methods like `any()` and `every()` to create more expressive and succinct conditions.
