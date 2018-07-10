## Chaining Method Responses
---

Method responses can be chained:

```groovy
subscriber.receive(_) >>> ["ok", "fail", "ok"] >> { throw new InternalError() } >> "ok"
```

This will return "`ok`", "`fail`", "`ok`" for the first three invocations, throw InternalError for the fourth invocations, and return ok for any further invocation.
