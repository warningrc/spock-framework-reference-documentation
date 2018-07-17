## Configuration Objects
----

You can add own sections in the [Spock Configuration File](./SpockConfigurationFile.md) for your extension by creating POJOs or POGOs that are annotated with `@ConfigurationObject` and have a default constructor (either implicitly or explicitly). The argument to the annotation is the name of the top-level section that is added to the Spock configuration file syntax. The default values for the configuration options are defined in the class by initializing the fields at declaration time or in the constructor. In the Spock configuration file those values can then be edited by the user of your extension.

>NOTE
>>It is an error to have multiple configuration objects with the same name, so choose wisely if you pick one and probably prefix it with some package-like name to minimize the risk for name clashes with other extensions or the core Spock code.


To use the values of the configuration object in your extension, just define an uninitialized instance field of that type. Spock will then automatically create exactly one instance of the configuration object per Spock run, apply the settings from the configuration file to it (before the `start()` methods of global extensions are called) and inject that instance into the extension class instances.

A configuration object cannot be used exclusively in an annotation driven local extension, but it has to be used in at least one global extension to properly get initialized and populated with the settings from the configuration file. But if the configuration object is used in a global extension, you can also use it just fine in an annotation driven local extension. If the configuration object is only used in an annotation driven local extension, you will get an exception when then configuration object is to be injected into the extension and you will also get an error when the configuration file is evaluated and it contains the section, as the configuration object is not properly registered yet.
