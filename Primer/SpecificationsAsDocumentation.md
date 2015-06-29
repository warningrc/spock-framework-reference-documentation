<style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}
</style>


##Specifications as Documentation
Well-written specifications are a valuable source of information. Especially for higher-level specifications targeting a wider audience than just developers (architects, domain experts, customers, etc.), it makes sense to provide more information in natural language than just the names of specifications and features. Therefore, Spock provides a way to attach textual descriptions to blocks:
	
	setup: "open a database connection"
	// code goes here
Individual parts of a block can be described with `and:`:

	
	setup: "open a database connection"
	// code goes here
	
	and: "seed the customer table"
	// code goes here
	
	and: "seed the product table"
	// code goes here

An `and:` label followed by a description can be inserted at any (top-level) position of a feature method, without altering the method’s semantics.

In Behavior Driven Development, customer-facing features (called stories) are described in a given-when-then format. Spock directly supports this style of specification with the `given:` label:
	
	given: "an empty bank account"
	// ...
	
	when: "the account is credited $10"
	// ...
	
	then: "the account's balance is $10"
	// ...



As noted before, `given:` is just an alias for `setup:`.

Block descriptions are not only present in source code, but are also available to the Spock runtime. Planned usages of block descriptions are enhanced diagnostic messages, and textual reports that are equally understood by all stakeholders.