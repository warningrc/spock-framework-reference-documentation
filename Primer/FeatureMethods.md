
##Feature Methods
	def "pushing an element on the stack"() {
	  // blocks go here
	}

`Feature methods`是`specification`的核心.它们描述了你期望的系统特征(代码实现的业务功能).一般情况下,`Feature methods`以一个字符串来命名.可以使用你喜欢的任意字符来为它们起一个最适合的名字.
>Feature methods are the heart of a specification. They describe the features (properties, aspects) that you expect to find in the system under specification. By convention, feature methods are named with String literals. Try to choose good names for your feature methods, and feel free to use any characters you like!

Conceptually, a feature method consists of four phases:

1. Set up the feature’s fixture
2. Provide a stimulus to the system under specification
3. Describe the response expected from the system
4. Clean up the feature’s fixture

第一和最后一个阶段是可选的,二三阶段(the stimulus and response)总是存在(except in interacting feature methods),并且有可能存在多次.
>Whereas the first and last phases are optional, the stimulus and response phases are always present (except in interacting feature methods), and may occur more than once.
