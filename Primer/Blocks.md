
## 代码块(Blocks)
Spock对`feature method`的各个概念阶段(conceptual phases)有内置的支持。为此,`feature method`被结构化为一个一个的代码块。代码块以一个标签开始，一直延伸到下一个代码块或者到`feature method`的结束。Spock内置了六个代码块:`setup`, `when`, `then`, `expect`, `cleanup`, 和 `where`。从方法的开始到第一个显式的代码块中间的代码都是隐式的`setup`代码块。

>Spock has built-in support for implementing each of the conceptual phases of a feature method. To this end, feature methods are structured into so-called blocks. Blocks start with a label, and extend to the beginning of the next block, or the end of the method. There are six kinds of blocks: `setup`, `when`, `then`, `expect`, `cleanup`, and `where` blocks. Any statements between the beginning of the method and the first explicit block belong to an implicit `setup` block.

一个`feature method`必须至少有一个被标记的显式的代码块(`Blocks`)- 实际上，存在明确的代码块(`Blocks`)才使得一个方法变为`feature method`。代码块将一个方法分割为不同的部分，同时代码块不可嵌套。

>A feature method must have at least one explicit (i.e. labelled) block - in fact, the presence of an explicit block is what makes a method a feature method. Blocks divide a method into distinct sections, and cannot be nested.

下面的图片展示了代码块(`Blocks`)与`feature method`各个概念阶段(conceptual phases)的映射关系。`where`块有个很特殊的用途，之后我们再具体了解，首先我们先看一下其他的代码块。
>The picture on the right shows how blocks map to the conceptual phases of a feature method. The `where` block has a special role, which will be revealed shortly. But first, let’s have a closer look at the other blocks.

![](images/Blocks2Phases.png)
