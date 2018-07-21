
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
