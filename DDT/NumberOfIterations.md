
## Number of Iterations

The number of iterations depends on how much data is available. Successive executions of the same method can yield different numbers of iterations. If a data provider runs out of values sooner than its peers, an exception will occur. Variable assignments don’t affect the number of iterations. A `where:` block that only contains assignments yields exactly one iteration.
