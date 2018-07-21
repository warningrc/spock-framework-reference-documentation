
### When and Then Blocks
	when:   // stimulus
	then:   // response

`when` 和 `then`代码块总是一起出现。它们描述了一个`刺激源`(`stimulus`)和预期的效果(当`...`时候，则会出现`...`的效果)。`when`块可以包含任意的代码，`then`块则由`限制条件`/`异常判断`/`交互代码`/`变量定义`组成。一个`feature method`可以包含多个 `when-then` 代码块。
>The `when` and `then` blocks always occur together. They describe a stimulus and the expected response. Whereas `when` blocks may contain arbitrary code, `then` blocks are restricted to conditions, exception conditions, interactions, and variable definitions. A feature method may contain multiple pairs of `when-then` blocks.

#### 条件(Conditions)

条件(`Conditions`)描述了一个预期的状态，类似于`junit`的断言。不过，条件(`Conditions`)可以只写一个布尔表达式，不需要断言的`api`(确切的说，一个条件通常返回一个非布尔值的数据，然后会使用`Groovy truth`推断出结果)。接下来我们看一些例子：

>Conditions describe an expected state, much like JUnit’s assertions. However, conditions are written as plain boolean expressions, eliminating the need for an assertion API. (More precisely, a condition may also produce a non-boolean value, which will then be evaluated according to Groovy truth.) Let’s see some conditions in action:

	when:
	stack.push(elem)

	then:
	!stack.empty
	stack.size() == 1
	stack.peek() == elem

> 尽量保证`feature method`中拥有最少量的条件。一到五个为最佳。如果有多个条件，检查一下是不是描述了多个不相关的功能，如果答案是肯定的，则可以将`feature method`拆分的更细一点。如果你的条件(`Conditions`)有多个不同的值，可以考虑使用[data table](../DDT/DataTables.md)

>> Try to keep the number of conditions per feature method small. One to five conditions is a good guideline. If you have more than that, ask yourself if you are specifying multiple unrelated features at once. If the answer is yes, break up the feature method in several smaller ones. If your conditions only differ in their values, consider using a [data table](../DDT/DataTables.md).

如果条件不成立`spock`将会有什么样的反馈呢？我们将条件修改为`stack.size() == 2`.执行单元测试后，将会得到如下提示：

>What kind of feedback does Spock provide if a condition is violated? Let’s try and change the second condition to `stack.size() == 2`. Here is what we get:



	Condition not satisfied:

	stack.size() == 2
	|     |      |
	|     1      false
	[push me]

如你所看的，`spock`以一个很容易理解的形式展现了条件执行过程中产生的所有中间数据。

>As you can see, Spock captures all values produced during the evaluation of a condition, and presents them in an easily digestible form. Nice, isn’t it?

#### 显式和隐式条件(Implicit and explicit conditions)

条件是`then`和`expect`块最基本的组成部分。除了没有返回值的方法和表达式被认作是一种交互以外，这些块中的其他顶级表达式都被隐式的认定为条件。如果在其他地方使用条件，需要使用Groovy中的断言关键字`assert`:

>Conditions are an essential ingredient of `then` blocks and `expect` blocks. Except for calls to `void` methods and expressions classified as interactions, all top-level expressions in these blocks are implicitly treated as conditions. To use conditions in other places, you need to designate them with Groovy’s assert keyword:

	def setup() {
	  stack = new Stack()
	  assert stack.empty
	}

如果一个显式的条件不成立，将展现出同隐式条件一样的提示信息。
>If an explicit condition is violated, it will produce the same nice diagnostic message as an implicit condition.

#### 异常判断(Exception Conditions)

异常判断描述`when`代码库必须抛出一个指定的异常。使用`thrown()`方法捕获异常，并判断异常的类型。例如，描述从一个空的堆栈中`pop`数据需要抛出一个`EmptyStackException`异常，你需要这么写：

>Exception conditions are used to describe that a `when` block should throw an exception. They are defined using the `thrown()` method, passing along the expected exception type. For example, to describe that popping from an empty stack should throw an `EmptyStackException`, you could write the following:

	when:
	stack.pop()

	then:
	thrown(EmptyStackException)
	stack.empty

正如你看到的那样，异常判断后面还可以跟着其他条件判断(或者其他代码块)。这对于预言一个异常的内容特别有用。要访问异常信息，需要绑定到一个变量上：

>As you can see, exception conditions may be followed by other conditions (and even other blocks). This is particularly useful for specifying the expected content of an exception. To access the exception, first bind it to a variable:


	when:
	stack.pop()

	then:
	def e = thrown(EmptyStackException)
	e.cause == null

当然你也可以对上面的语法做一些变动：
>Alternatively, you may use a slight variation of the above syntax:

	when:
	stack.pop()

	then:
	EmptyStackException e = thrown()
	e.cause == null

这种语法有两个小优点：第一，此异常是强类型的，可以有效的利用IDE提供的语法推断。第二，这种条件读起来有点像一个句子(然后将会抛出一个`EmptyStackException`异常)。注意，如果没有为`thrown()`方法传递异常的类型，它将从左侧的变量类型进行推断。

>This syntax has two small advantages: First, the exception variable is strongly typed, making it easier for IDEs to offer code completion. Second, the condition reads a bit more like a sentence ("then an EmptyStackException is thrown"). Note that if no exception type is passed to the `thrown()` method, it is inferred from the variable type on the left-hand side.

有时候，我们需要描述出不能抛出异常的状态。例如，我们尝试着预言`HashMap`应该能接收一个`null`的key：

>Sometimes we need to convey that an exception should **not** be thrown. For example, let’s try to express that a HashMap should accept a `null` key:

```groovy
def "HashMap accepts null key"() {
  setup:
  def map = new HashMap()
  map.put(null, "elem")
}
```

代码可以运行但是没有描述出真实意图。最优的方式如下代码：

>This works but doesn’t reveal the intention of the code. Did someone just leave the building before he had finished implementing this method? After all, where are the conditions? Fortunately, we can do better:

```groovy
def "HashMap accepts null key"() {
  setup:
  def map = new HashMap()

  when:
  map.put(null, "elem")

  then:
  notThrown(NullPointerException)
}
```
使用`notThrown()`判定逻辑中不可以抛出`NullPointerException`。如果抛出其他异常方法将执行失败。

>By using `notThrown()`, we make it clear that in particular a `NullPointerException` should not be thrown. (As per the contract of `Map.put()`, this would be the right thing to do for a map that doesn’t support `null` keys.) However, the method will also fail if any other exception is thrown.

#### Interactions

`Conditions`描述对象的状态，而`Interactions`描述对象之间如何通信。`Interactions`会[单独起一章](../IBT/README.md)进行讲解，此处只给出一个简单的例子。假设我们想要描述一个从发布者到其订阅者的事件流。代码如下：

>Whereas conditions describe an object’s state, interactions describe how objects communicate with each other. Interactions are devoted a whole [chapter](../IBT/README.md), and so we only give a quick example here. Suppose we want to describe the flow of events from a publisher to its subscribers. Here is the code:

```groovy
def "events are published to all subscribers"() {
  def subscriber1 = Mock(Subscriber)
  def subscriber2 = Mock(Subscriber)
  def publisher = new Publisher()
  publisher.add(subscriber1)
  publisher.add(subscriber2)

  when:
  publisher.fire("event")

  then:
  1 * subscriber1.receive("event")
  1 * subscriber2.receive("event")
}

```
