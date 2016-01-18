<style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}

.sidebarblock{border-style:solid;border-width:1px;border-color:#e0e0dc;margin-bottom:1.25em;padding:1.25em;background:#f8f8f7;-webkit-border-radius:4px;border-radius:4px}
.sidebarblock>:first-child{margin-top:0}
.sidebarblock>:last-child{margin-bottom:0}
.sidebarblock>.content>.title{color:#7a2518;margin-top:0;text-align:center}
</style>

## Method Unrolling

A method annotated with `@Unroll` will have its iterations reported independently:

    @Unroll
    def "maximum of two numbers"() { ... }


<br>

<div class="sidebarblock">
<div class="content">
<div class="title">Why isn’t <code>@Unroll</code> the default?</div>
<div class="paragraph">
<p>One reason why <code>@Unroll</code> isn’t the default is that some execution environments (in particular IDEs) expect to be
told the number of test methods in advance, and have certain problems if the actual number varies. Another reason
is that <code>@Unroll</code> can drastically change the number of reported tests, which may not always be desirable.</p>
</div>
</div>
</div>


Note that unrolling has no effect on how the method gets executed; it is only an alternation in reporting. Depending on the execution environment, the output will look something like:

    maximum of two numbers[0]   PASSED
    maximum of two numbers[1]   FAILED
    
    Math.max(a, b) == c
        |    |  |  |  |
        |    7  0  |  7
        42         false
    
    maximum of two numbers[2]   PASSED


This tells us that the second iteration (with index 1) failed. With a bit of effort, we can do even better:

    
    @Unroll
    def "maximum of #a and #b is #c"() { ... }



This method name uses placeholders, denoted by a leading hash sign (`#`), to refer to data variables `a`, `b`, and `c`. In the output, the placeholders will be replaced with concrete values:


    maximum of 3 and 5 is 5   PASSED
    maximum of 7 and 0 is 7   FAILED
    
    Math.max(a, b) == c
        |    |  |  |  |
        |    7  0  |  7
        42         false
    
    maximum of 0 and 0 is 0   PASSED


Now we can tell at a glance that the max method failed for inputs 7 and 0. See [More on Unrolled Method Names](MoreOnUnrolledMethodNames.md) for further details on this topic.

The `@Unroll` annotation can also be placed on a spec. This has the same effect as placing it on each data-driven feature method of the spec.

