## Annotation Driven Local Extensions
----

To create an annotation driven local extension you need to create a class that implements the interface `IAnnotationDrivenExtension`. As type argument to the interface you need to supply an annotation class that has `@Retention` set to `RUNTIME`, `@Target` set to one or more of `FIELD`, `METHOD` and `TYPE` - depending on where you want your annotation to be applicable - and `@ExtensionAnnotation` applied, with the `IAnnotationDrivenExtension` class as argument. Of course the annotation class can have some attributes with which the user can further configure the behaviour of the extension for each annotation application. For convenience there is also the class `AbstractAnnotationDrivenExtension`, which provides empty implementations for all methods in the interface, so that only the needed ones need to be overridden.

Your annotation can be applied to a specification, a feature method, a fixture method or a field. On all other places like helper methods or other places if the `@Target` is set accordingly, the annotation will be ignored and has no effect other than being visible in the source code.

`IAnnotationDrivenExtension` has the following five methods, where in each you can prepare a specification with your extension magic, like attaching interceptors to various interception points as described in the chapter [Interceptors](./Interceptors.md):

`visitSpecAnnotation(T annotation, SpecInfo spec)`

This is called once for each specification where the annotation is applied with the annotation instance as first parameter and the specification info object as second parameter.

`visitFeatureAnnotation(T annotation, FeatureInfo feature)`

This is called once for each feature method where the annotation is applied with the annotation instance as first parameter and the feature info object as second parameter.

`visitFixtureAnnotation(T annotation, MethodInfo fixtureMethod)`

This is called once for each fixture method where the annotation is applied with the annotation instance as first parameter and the fixture method info object as second parameter.

`visitFieldAnnotation(T annotation, FieldInfo field)`

This is called once for each field where the annotation is applied with the annotation instance as first parameter and the field info object as second parameter.

`visitSpec(SpecInfo spec)`

This is called once for each specification within which the annotation is applied to at least one of the supported places like defined above. It gets the specification info object as sole parameter. This method is called after all other methods of this interface for each applied annotation are processed.
