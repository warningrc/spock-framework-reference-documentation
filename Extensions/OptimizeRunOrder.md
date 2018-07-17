## Optimize Run Order
----

Spock can remember which features last failed and how often successively and also how long a feature needed to be tested. For successive runs Spock will then first run features that failed at last run and first features that failed more often successively. Within the previously failed or non-failed features Spock will run the fastest tests first. This behaviour can be enabled according to the [Spock Configuration File](./SpockConfigurationFile.md) section. The default value is false.

**Optimize Run Order Configuration**

```groovy
runner {
  optimizeRunOrder true
}
```
