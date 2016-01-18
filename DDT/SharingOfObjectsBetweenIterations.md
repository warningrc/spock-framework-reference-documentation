<style>
h1,h2,h3,h4{font-family: "Open Sans","DejaVu Sans",sans-serif;font-weight: 300;font-style: normal; color: #ba3925;text-rendering: optimizeLegibility; margin-top: 1em; margin-bottom: .5em;}
h1{color: rgba(0,0,0,.85);}
blockquote{color: #998;font-style: italic;}
</style>

## Sharing of Objects between Iterations

In order to share an object between iterations, it has to be kept in a `@Shared` or static field.



<table>
<tbody><tr>
<td class="icon">
<div class="title">Note</div>
</td>
<td class="content">
Only <code>@Shared</code> and static variables can be accessed from within a <code>where:</code> block.
</td>
</tr>
</tbody></table>

Note that such objects will also be shared with other methods. There is currently no good way to share an object just between iterations of the same method. If you consider this a problem, consider putting each method into a separate spec, all of which can be kept in the same file. This achieves better isolation at the cost of some boilerplate code.