<style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}
</style>



##Helper Methods

Sometimes feature methods grow large and/or contain lots of duplicated code. In such cases it can make sense to introduce one or more helper methods. Two good candidates for helper methods are setup/cleanup logic and complex conditions. Factoring out the former is straightforward, so let’s have a look at conditions:

	def "offered PC matches preferred configuration"() {
	  when:
	  def pc = shop.buyPc()
	
	  then:
	  pc.vendor == "Sunny"
	  pc.clockRate >= 2333
	  pc.ram >= 4096
	  pc.os == "Linux"
	}

If you happen to be a computer geek, your preferred PC configuration might be very detailed, or you might want to compare offers from many different shops. Therefore, let’s factor out the conditions:

	def "offered PC matches preferred configuration"() {
	  when:
	  def pc = shop.buyPc()
	
	  then:
	  matchesPreferredConfiguration(pc)
	}
	
	def matchesPreferredConfiguration(pc) {
	  pc.vendor == "Sunny"
	  && pc.clockRate >= 2333
	  && pc.ram >= 4096
	  && pc.os == "Linux"
	}

The new helper method `matchesPreferredConfiguration()` consists of a single boolean expression whose result is returned. (The `return` keyword is optional in Groovy.) This is fine except for the way that an inadequate offer is now presented:

	Condition not satisfied:
	
	matchesPreferredConfiguration(pc)
	|                             |
	false                         ...

Not very helpful. Fortunately, we can do better:

	void matchesPreferredConfiguration(pc) {
	  assert pc.vendor == "Sunny"
	  assert pc.clockRate >= 2333
	  assert pc.ram >= 4096
	  assert pc.os == "Linux"
	}

When factoring out conditions into a helper method, two points need to be considered: First, implicit conditions must be turned into explicit conditions with the `assert` keyword. Second, the helper method must have return type `void`. Otherwise, Spock might interpret the return value as a failing condition, which is not what we want.

As expected, the improved helper method tells us exactly what’s wrong:

	
	Condition not satisfied:
	
	assert pc.clockRate >= 2333
	       |  |         |
	       |  1666      false
	       ...

A final advice: Although code reuse is generally a good thing, don’t take it too far. Be aware that the use of fixture and helper methods can increase the coupling between feature methods. If you reuse too much or the wrong code, you will end up with specifications that are fragile and hard to evolve.

