## Include and Exclude
----

Spock is capable of including and excluding specifications according to their classes, super-classes and interfaces and according to annotations that are applied to the specification. Spock is also capable of including and excluding individual features according to annotations that are applied to the feature method. The configuration for what to include or exclude is done according to the [Spock Configuration File](./SpockConfigurationFile.md) section.

**Include / Exclude Configuration**

```groovy
import some.pkg.Fast
import some.pkg.IntegrationSpec

runner {
  include Fast // could be either an annotation or a (base) class
  exclude {
    annotation some.pkg.Slow
    baseClass IntegrationSpec
  }
}
```
