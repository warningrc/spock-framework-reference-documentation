<style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}
</style>

##Fixture Methods
	def setup() {}          // run before every feature method
	def cleanup() {}        // run after every feature method
	def setupSpec() {}     // run before the first feature method
	def cleanupSpec() {}   // run after the last feature method

`Fixture methods`负责在`feature methods`方法执行前后配置和清理环境.通常会为每个`feature method`增加`setup()`和`cleanup()`两个`Fixture Methods`.有时候需要为`feature methods`增加共享的`fixture`,可以通过结合共享字段和`setupSpec()`,`cleanupSpec()` 方法来实现.所有的`fixture methods`都是可选的.
>Fixture methods are responsible for setting up and cleaning up the environment in which feature methods are run. Usually it’s a good idea to use a fresh fixture for every feature method, which is what the `setup()` and `cleanup()` methods are for. Occasionally it makes sense for feature methods to share a fixture, which is achieved by using shared fields together with the `setupSpec()` and `cleanupSpec()` methods. All fixture methods are optional.

在`setupSpec()`和`cleanupSpec()`方法中不可以访问实例字段,只可以访问静态字段和通过`@Share`注解标识的字段.
>Note: The `setupSpec()` and `cleanupSpec()` methods may not reference instance fields.
