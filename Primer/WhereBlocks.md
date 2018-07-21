
#### Where Blocks
A `where` block always comes last in a method, and may not be repeated. It is used to write data-driven feature methods. To give you an idea how this is done, have a look at the following example:

	def "computing the maximum of two numbers"() {
	  expect:
	  Math.max(a, b) == c

	  where:
	  a << [5, 3]
	  b << [1, 9]
	  c << [5, 9]
	}

This `where` block effectively creates two "versions" of the feature method: One where `a` is `5`, `b` is `1`, and `c` is `5`, and another one where `a` is `3`, `b` is `9`, and `c` is `9`.

The `where` block will be further explained in the [Data Driven Testing](../DDT/README.md) chapter.
