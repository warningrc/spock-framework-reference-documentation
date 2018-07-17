## Injecting Method Parameters
----

If your interceptor should support custom method parameters for wrapped methods, this can be done by modifying `invocation.arguments`. Two use cases for this would be a mocking framework that can inject method parameters that are annotated with a special annotation or some test helper that injects objects of a specific type that are created and prepared for usage automatically.

`invocation.arguments` may be an empty array or an array of arbitrary length, depending on what interceptors were run before that maybe also have manipulated this array for parameter injection. So if you for example investigated the method parameters with `invocation.method.reflection.parameters` and found that you want to inject the fifth parameter, you should first check whether the `arguments` array is at least five elements long. If not, you should assign it a new array that is at least five elements long and copy the contents of the old array into the new one. Then you can assign your objects to be injected.


***Inject Method Parameters***

```groovy
// create a map of all MyInjectable parameters with their parameter index
Map<Parameter, Integer> parameters = [:]
invocation.method.reflection.parameters.eachWithIndex { parameter, i ->
  parameters << [(parameter): i]
}
parameters = parameters.findAll { MyInjectable.equals it.key.type }

// enlarge arguments array if necessary
def lastMyInjectableParameterIndex = parameters*.value.max()
lastMyInjectableParameterIndex = lastMyInjectableParameterIndex == null ?
                                 0 :
                                 lastMyInjectableParameterIndex + 1
if(invocation.arguments.length < lastMyInjectableParameterIndex) {
  def newArguments = new Object[lastMyInjectableParameterIndex]
  System.arraycopy invocation.arguments, 0, newArguments, 0, invocation.arguments.length
  invocation.arguments = newArguments
}

parameters.each { parameter, i ->
  invocation.arguments[i] = new MyInjectable(parameter)
}
```

> NOTE
>> When using data driven features (methods with a `where:` block), the user of your extension has to follow some restrictions, if parameters should be injected by your extension:
>> * all data variables and all to-be-injected parameters have to be defined as method parameters
>> * all method parameters have to be assigned a value in the `where:` block
>> * the order of the method parameters has to be identical to the order of the data variables in the `where:` block
>> * the to-be-injected parameters have to be set to any value in the `where:` block, for example `null`<p>of course you can also make your extension only inject a value if none is set already, as the `where:` block assignments happen before the method interceptor is called</p><p>for this simply check whether `invocation.arguments[i]` is `null` or not</p>
>> ***Data Driven Feature with Injected Parameter***
>>```groovy
>>def 'test parameter injection'(a, b, MyInjectable myInjectable) {
>>  expect: myInjectable
>>
>>  where:
>>  a    | b
>>  'a1' | 'b1'
>>  'a2' | 'b2'
>>
>>  and:
>>  myInjectable = null
>>}
>>```
