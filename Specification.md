<style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}
</style>


##Specification
	class MyFirstSpecification extends Specification {
	  // fields
	  // fixture methods
	  // feature methods
	  // helper methods
	}

specification必须是一个继承了`spock.lang.Specification`的`Groovy class`. specificationd通常按照它所描述的功能来命名.例如:`CustomerSpec`, `H264VideoPlayback`, `ASpaceshipAttackedFromTwoSides`都是符合规范的命名.
>A specification is represented as a Groovy class that extends from `spock.lang.Specification`. The name of a specification usually relates to the system or system operation described by the specification. For example, `CustomerSpec`, `H264VideoPlayback`, and `ASpaceshipAttackedFromTwoSides` are all reasonable names for a specification.

`Specification`类中包含了很多非常有用的方法.同时它使用`Sputnik`(`JUnit Runner`)将specification和`JUnit`进行集成.正因为有了`Sputnik`,Spock specifications才能与众多的Java IDEs和构建工具进行无缝集成.

>Class `Specification` contains a number of useful methods for writing specifications. Furthermore it instructs JUnit to run specification with Sputnik, Spock’s JUnit runner. Thanks to Sputnik, Spock specifications can be run by most modern Java IDEs and build tools.

