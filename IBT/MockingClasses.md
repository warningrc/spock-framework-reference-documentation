## Mocking Classes
---

Besides interfaces, Spock also supports mocking of classes. Mocking classes works just like mocking interfaces; the only additional requirement is to put `cglib-nodep-2.2` or higher and `objenesis-1.2` or higher on the class path. If either of these libraries is missing from the class path, Spock will gently let you know.

>NOTE
>> Java 8 is only supported from CGLIB 3.2.0 onwards.
