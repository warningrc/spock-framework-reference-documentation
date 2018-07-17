## Writing Custom Extensions
----

There are two types of extensions that can be created for usage with Spock. These are global extensions and annotation driven local extensions. For both extension types you implement a specific interface which defines some callback methods. In your implementation of those methods you can set up the magic of your extension, for example by adding interceptors to various interception points that are described below.

Which type of annotation you create depends on your use case. If you want to do something once during the Spock run - at the start or end - or want to apply something to all executed specifications without the user of the extension having to do anything besides including your extension in the classpath, then you should opt for a global extension. If you instead want to apply your magic only by choice of the user, then you should implement an annotation driven local extension.
