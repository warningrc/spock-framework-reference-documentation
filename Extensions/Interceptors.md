## Interceptors
-----
For applying the magic of your extension, there are various interception points, where you can attach interceptors from the extension methods described above to hook into the Spock lifecycle. For each interception point there can of course be multiple interceptors added by arbitrary Spock extensions (shipped or 3rd party). Their order is currently depending on the order they are added, but there should not be made any order assumptions within one interception point.

![](/images/0d9ae887524fadaa5f0405ca94b3520e.png)


***Figure 1. Spock Interceptors***

An ellipsis in the figure means that the block before it can be repeated an arbitrary amount of times.

The …​ `method interceptors` are of course only run if there are actual methods of this type to be executed (the white boxes) and those can [inject parameters](./InjectingMethodParameters.md) to be given to the method that will be run.

The difference between shared initializer interceptor and shared initializer method interceptor and between initializer interceptor and initializer method interceptor - as there can be at most one of those methods each - is, that there are only the two methods if there are `@Shared`, respectively non-`@Shared`, fields that get values assigned at declaration time. The compiler will put those initializations in a generated method and call it at the proper place in the lifecycle. So if there are no such initializations, no method is generated and thus the method interceptor is never called. The non-method interceptors are always called at the proper place in the lifecycle to do work that has to be done at that time.

To create an interceptor to be attached to an interception point, you need to create a class that implements the interface `IMethodInterceptor`. This interface has the sole method `intercept(IMethodInvocation invocation)`. The invocation parameter can be used to get and modify the current state of execution. Each interceptor **must** call the method `invocation.proceed()`, which will go on in the lifecycle, except you really want to prevent further execution of the nested elements like shown in the figure above. But this should be a very rare use case.

If you write an interceptor that can be used at different interception points and should do different work at different interception points, there is also the convenience class `AbstractMethodInterceptor`, which you can extend and which provides various methods for overriding that are called for the various interception points. Most of these methods have a double meaning, like `interceptSetupMethod` which is called for the setup interceptor and the `setup method interceptor`. If you attach your interceptor to both of them and need a differentiation, you can check for `invocation.method.reflection`, which will be set in the method interceptor case and `null` otherwise. Alternatively you can of course build two different interceptors or add a parameter to your interceptor and create two instances, telling each at addition time whether it is attached to the method interceptor or the other one.


***Add All Interceptors***


```groovy
class I extends AbstractMethodInterceptor { I(def s) {} }

specInfo.addSharedInitializerInterceptor new I('shared initializer')
specInfo.sharedInitializerMethod?.addInterceptor new I('shared initializer method')
specInfo.addInterceptor new I('specification')
specInfo.addSetupSpecInterceptor new I('setup spec')
specInfo.setupSpecMethods*.addInterceptor new I('setup spec method')
specInfo.allFeatures*.addInterceptor new I('feature')
specInfo.addInitializerInterceptor new I('initializer')
specInfo.initializerMethod?.addInterceptor new I('initializer method')
specInfo.allFeatures*.addIterationInterceptor new I('iteration')
specInfo.addSetupInterceptor new I('setup')
specInfo.setupMethods*.addInterceptor new I('setup method')
specInfo.allFeatures*.featureMethod*.addInterceptor new I('feature method')
specInfo.addCleanupInterceptor new I('cleanup')
specInfo.cleanupMethods*.addInterceptor new I('cleanup method')
specInfo.addCleanupSpecInterceptor new I('cleanup spec')
specInfo.cleanupSpecMethods*.addInterceptor new I('cleanup spec method')
specInfo.allFixtureMethods*.addInterceptor new I('fixture method')
```
