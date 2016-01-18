 <style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}
</style>

###代码块(Blocks)
Spock对`feature method`的各个概念阶段(conceptual phases)有内置的支持。为此,`feature method`被结构化为一个一个的代码块。代码块以一个标签开始，一直延伸到下一个代码块或者到`feature method`的结束。Spock内置了六个代码块:`setup`, `when`, `then`, `expect`, `cleanup`, 和 `where`。从方法的开始到第一个显式的代码块中间的代码都是隐式的`setup`代码块。

>Spock has built-in support for implementing each of the conceptual phases of a feature method. To this end, feature methods are structured into so-called blocks. Blocks start with a label, and extend to the beginning of the next block, or the end of the method. There are six kinds of blocks: `setup`, `when`, `then`, `expect`, `cleanup`, and `where` blocks. Any statements between the beginning of the method and the first explicit block belong to an implicit `setup` block.

一个`feature method`必须至少有一个被标记的显式的代码块(`Blocks`)- 实际上，存在明确的代码块(`Blocks`)才使得一个方法变为`feature method`。代码块将一个方法分割为不同的部分，同时代码块不可嵌套。

>A feature method must have at least one explicit (i.e. labelled) block - in fact, the presence of an explicit block is what makes a method a feature method. Blocks divide a method into distinct sections, and cannot be nested.

下面的图片展示了代码块(`Blocks`)与`feature method`各个概念阶段(conceptual phases)的映射关系。`where`块有个很特殊的用途，之后我们再具体了解，首先我们先看一下其他的代码块。
>The picture on the right shows how blocks map to the conceptual phases of a feature method. The `where` block has a special role, which will be revealed shortly. But first, let’s have a closer look at the other blocks.

![](images/Blocks2Phases.png)


####Setup Blocks
	setup:
	def stack = new Stack()
	def elem = "push me"

`setup`块的作用是为当前的测试做一些准备工作。它必须为第一个块(前面不能有其他代码块(`Blocks`)),并且不能重复。`setup`块不能有特殊的语义(`????此处翻译感觉不太恰当。。。`),`setup:`标签是可选的，可以省略的，所以就会形成一个隐式的`setup`块。`setup`块有个别名：`given`,有时候`given`可能更具可读性。(参见 [Specifications as Documentation](SpecificationsAsDocumentation.md))

>The `setup` block is where you do any setup work for the feature that you are describing. It may not be preceded by other blocks, and may not be repeated. A `setup` block doesn’t have any special semantics. The `setup`: label is optional and may be omitted, resulting in an implicit `setup` block. The `given`: label is an alias for `setup`:, and sometimes leads to a more readable feature method description (see [Specifications as Documentation](SpecificationsAsDocumentation.md)).


####When and Then Blocks
	when:   // stimulus
	then:   // response

`when` 和 `then`代码块总是一起出现。它们描述了一个`刺激源`(`stimulus`)和预期的效果(当`...`时候，则会出现`...`的效果)。`when`块可以包含任意的代码，`then`块则由`限制条件`/`异常判断`/`交互代码`/`变量定义`组成。一个`feature method`可以包含多个 `when-then` 代码块。
>The `when` and `then` blocks always occur together. They describe a stimulus and the expected response. Whereas `when` blocks may contain arbitrary code, `then` blocks are restricted to conditions, exception conditions, interactions, and variable definitions. A feature method may contain multiple pairs of `when-then` blocks.

##### 条件(Conditions)

条件(`Conditions`)描述了一个预期的状态，类似于`junit`的断言。不过，条件(`Conditions`)可以只写一个布尔表达式，不需要断言的`api`(确切的说，一个条件通常返回一个非布尔值的数据，然后会使用`Groovy truth`推断出结果)。接下来我们看一些例子：

>Conditions describe an expected state, much like JUnit’s assertions. However, conditions are written as plain boolean expressions, eliminating the need for an assertion API. (More precisely, a condition may also produce a non-boolean value, which will then be evaluated according to Groovy truth.) Let’s see some conditions in action:

	when:
	stack.push(elem)
	
	then:
	!stack.empty
	stack.size() == 1
	stack.peek() == elem

> 尽量保证`feature method`中拥有最少量的条件。一到五个为最佳。如果有多个条件，检查一下是不是描述了多个不相关的功能，如果答案是肯定的，则可以将`feature method`拆分的更细一点。如果你的条件(`Conditions`)有多个不同的值，可以考虑使用[data table](#data-tables)

>> Try to keep the number of conditions per feature method small. One to five conditions is a good guideline. If you have more than that, ask yourself if you are specifying multiple unrelated features at once. If the answer is yes, break up the feature method in several smaller ones. If your conditions only differ in their values, consider using a [data table](#data-tables).

What kind of feedback does Spock provide if a condition is violated? Let’s try and change the second condition to `stack.size() == 2`. Here is what we get:

	Condition not satisfied:
	
	stack.size() == 2
	|     |      |
	|     1      false
	[push me]


As you can see, Spock captures all values produced during the evaluation of a condition, and presents them in an easily digestible form. Nice, isn’t it?

#####Implicit and explicit conditions

Conditions are an essential ingredient of `then` blocks and `expect` blocks. Except for calls to `void` methods and expressions classified as interactions, all top-level expressions in these blocks are implicitly treated as conditions. To use conditions in other places, you need to designate them with Groovy’s assert keyword:

	def setup() {
	  stack = new Stack()
	  assert stack.empty
	}

If an explicit condition is violated, it will produce the same nice diagnostic message as an implicit condition.

#####Exception Conditions

Exception conditions are used to describe that a `when` block should throw an exception. They are defined using the `thrown()` method, passing along the expected exception type. For example, to describe that popping from an empty stack should throw an `EmptyStackException`, you could write the following:

	when:
	stack.pop()
	
	then:
	thrown(EmptyStackException)
	stack.empty
As you can see, exception conditions may be followed by other conditions (and even other blocks). This is particularly useful for specifying the expected content of an exception. To access the exception, first bind it to a variable:


As you can see, exception conditions may be followed by other conditions (and even other blocks). This is particularly useful for specifying the expected content of an exception. To access the exception, first bind it to a variable:

	when:
	stack.pop()
	
	then:
	def e = thrown(EmptyStackException)
	e.cause == null
Alternatively, you may use a slight variation of the above syntax:

	when:
	stack.pop()
	
	then:
	EmptyStackException e = thrown()
	e.cause == null



This syntax has two small advantages: First, the exception variable is strongly typed, making it easier for IDEs to offer code completion. Second, the condition reads a bit more like a sentence ("then an EmptyStackException is thrown"). Note that if no exception type is passed to the `thrown()` method, it is inferred from the variable type on the left-hand side.

Sometimes we need to convey that an exception should **not** be thrown. For example, let’s try to express that a HashMap should accept a `null` key:

	def "HashMap accepts null key"() {
	  setup:
	  def map = new HashMap()
	  map.put(null, "elem")
	}
This works but doesn’t reveal the intention of the code. Did someone just leave the building before he had finished implementing this method? After all, where are the conditions? Fortunately, we can do better:

	def "HashMap accepts null key"() {
	  setup:
	  def map = new HashMap()
	
	  when:
	  map.put(null, "elem")
	
	  then:
	  notThrown(NullPointerException)
	}

By using `notThrown()`, we make it clear that in particular a `NullPointerException` should not be thrown. (As per the contract of `Map.put()`, this would be the right thing to do for a map that doesn’t support `null` keys.) However, the method will also fail if any other exception is thrown.

#####Interactions

Whereas conditions describe an object’s state, interactions describe how objects communicate with each other. Interactions are devoted a whole [chapter](#interaction-based-testing), and so we only give a quick example here. Suppose we want to describe the flow of events from a publisher to its subscribers. Here is the code:

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


####IExpect Blocks
An `expect` block is more limited than a `then` block in that it may only contain conditions and variable definitions. It is useful in situations where it is more natural to describe stimulus and expected response in a single expression. For example, compare the following two attempts to describe the `Math.max()` method:


	when:
	def x = Math.max(1, 2)
	
	then:
	x == 2
	expect:
	Math.max(1, 2) == 2

Although both snippets are semantically equivalent, the second one is clearly preferable. As a guideline, use `when-then` to describe methods with side effects, and `expect` to describe purely functional methods.

> Leverage [Groovy JDK](http://docs.groovy-lang.org/docs/latest/html/groovy-jdk/) methods like `any()` and `every()` to create more expressive and succinct conditions.


####Cleanup Blocks
	
	setup:
	def file = new File("/some/path")
	file.createNewFile()
	
	// ...
	
	cleanup:
	file.delete()

A `cleanup` block may only be followed by a `where` block, and may not be repeated. Like a `cleanup` method, it is used to free any resources used by a feature method, and is run even if (a previous part of) the feature method has produced an exception. As a consequence, a `cleanup` block must be coded defensively; in the worst case, it must gracefully handle the situation where the first statement in a feature method has thrown an exception, and all local variables still have their default values.

>Groovy’s safe dereference operator (`foo?.bar()`) simplifies writing defensive code.

Object-level specifications usually don’t need a `cleanup` method, as the only resource they consume is memory, which is automatically reclaimed by the garbage collector. More coarse-grained specifications, however, might use a `cleanup` block to clean up the file system, close a database connection, or shut down a network service.

>If a specification is designed in such a way that all its feature methods require the same resources, use a `cleanup()` method; otherwise, prefer `cleanup` blocks. The same trade-off applies to `setup()` methods and `setup` blocks.

####Where Blocks
A `where` block always comes last in a method, and may not be repeated. It is used to write data-driven feature methods. To give you an idea how this is done, have a look at the following example:

	def "computing the maximum of two numbers"() {
	  expect:
	  Math.max(a, b) == c
	
	  where:
	  a << [5, 3]
	  b << [1, 9]
	  c << [5, 9]
	}

This `where` block effectively creates two "versions" of the feature method: One where `a` is `5`, `b` is `1`, and `c` is `5`, and another one where `a` is `3`, `b` is `9`, and `c` is `9`.

The `where` block will be further explained in the [Data Driven Testing](#data-driven-testing) chapter.

