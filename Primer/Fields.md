
##字段(Fields)
	def obj = new ClassUnderSpecification()
	def coll = new Collaborator()


>Instance fields are a good place to store objects belonging to the specification’s fixture. It is good practice to initialize them right at the point of declaration. (Semantically, this is equivalent to initializing them at the very beginning of the setup() method.) Objects stored into instance fields are not shared between feature methods. Instead, every feature method gets its own object. This helps to isolate feature methods from each other, which is often a desirable goal.

	@Shared res = new VeryExpensiveResource()
有时候你需要在功能方法之间共享一个对象.比如创建一个对象比较耗费资源,或者你希望你的功能方法之间进行交互.使用注解`@Shared`声明一个字段便可实现此功能.同时最好在declaration正确的地方初始化字段.(这相当与在`setupSpec()`方法之前初始化字段)
>Sometimes you need to share an object between feature methods. For example, the object might be very expensive to create, or you might want your feature methods to interact with each other. To achieve this, declare a `@Shared` field. Again it’s best to initialize the field right at the point of declaration. (Semantically, this is equivalent to initializing the field at the very beginning of the `setupSpec()` method.)

	static final PI = 3.141592654

静态字段仅仅用于定义常量.共享字段是最优的选择,因为他们被明确的定义为共享的.
>Static fields should only be used for constants. Otherwise shared fields are preferable, because their semantics with respect to sharing are more well-defined.
