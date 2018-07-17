## Rule
----

Spock understands `@org.junit.Rule` annotations on non-`@Shared` instance fields. The according rules are run at the iteration interception point in the Spock lifecycle. This means that the rules before-actions are done before the execution of `setup` methods and the after-actions are done after the execution of `cleanup` methods.

## ClassRule
----

Spock understands `@org.junit.ClassRule` annotations on `@Shared` fields. The according rules are run at the specification interception point in the Spock lifecycle. This means that the rules before-actions are done before the execution of `setupSpec` methods and the after-actions are done after the execution of `cleanupSpec` methods.
