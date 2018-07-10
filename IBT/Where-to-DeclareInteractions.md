## Where to Declare Interactions
---

So far, we declared all our interactions in a `then:` block. This often results in a spec that reads naturally. However, it is also permissible to put interactions anywhere *before* the `when:` block that is supposed to satisfy them. In particular, this means that interactions can be declared in a `setup` method. Interactions can also be declared in any "helper" instance method of the same specification class.

When an invocation on a mock object occurs, it is matched against interactions in the interactions' declared order. If an invocation matches multiple interactions, the earliest declared interaction that hasn’t reached its upper invocation limit will win. There is one exception to this rule: Interactions declared in a `then:` block are matched against before any other interactions. This allows to override interactions declared in, say, a `setup` method with interactions declared in a `then:` block.

> ## Spock Deep Dive: How Are Interactions Recognized?
> In other words, what makes an expression an interaction declaration, rather than, say, a regular method call? Spock uses a simple syntactic rule to recognize interactions: If an expression is in statement position and is either a multiplication (`*`) or a right-shift (`>>`, `>>>`) operation, then it is considered an interaction and will be parsed accordingly. Such an expression would have little to no value in statement position, so changing its meaning works out fine. Note how the operations correspond to the syntax for declaring a cardinality (when mocking) or a response generator (when stubbing). Either of them must always be present; foo.bar() alone will never be considered an interaction.
