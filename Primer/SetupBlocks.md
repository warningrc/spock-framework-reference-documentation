### Setup Blocks
	setup:
	def stack = new Stack()
	def elem = "push me"

`setup`块的作用是为当前的测试做一些准备工作。它必须为第一个块(前面不能有其他代码块(`Blocks`)),并且不能重复。`setup`块不能有特殊的语义(`????此处翻译感觉不太恰当。。。`),`setup:`标签是可选的，可以省略的，所以就会形成一个隐式的`setup`块。`setup`块有个别名：`given`,有时候`given`可能更具可读性。(参见 [Specifications as Documentation](SpecificationsAsDocumentation.md))

>The `setup` block is where you do any setup work for the feature that you are describing. It may not be preceded by other blocks, and may not be repeated. A `setup` block doesn’t have any special semantics. The `setup`: label is optional and may be omitted, resulting in an implicit `setup` block. The `given`: label is an alias for `setup`:, and sometimes leads to a more readable feature method description (see [Specifications as Documentation](SpecificationsAsDocumentation.md)).
