## Report Log
----

Spock can create a report log of the executed tests in JSON format. This report contains also things like `@Title`, `@Narrative`, `@See` and `@Issue` values or block descriptors. This report can be enabled according to the [Spock Configuration File](./SpockConfigurationFile.md) section. The default is to not generate this report.

For the report to be generated, you have to enable it and set at least the `logFileDir` and `logFileName`. `enabled` can also be set via the system property `spock.logEnabled`, `logFileDir` can also be set via the system property `spock.logFileDir` and `logFileName` can also be set via the system property `spock.logFileName`.

If a `logFileSuffix` is set (or the system property `spock.logFileSuffix`), it is appended to the base filename, separated by a dash. If the suffix contains the string `#timestamp`, this is replaced by the current date and time in `UTC` automatically. If you instead want to have your local date and time, you can use the setting from the example below.

**Report Log Configuration**

```groovy
report {
    enabled true
    logFileDir '.'
    logFileName 'spock-report.json'
    logFileSuffix new Date().format('yyyy-MM-dd_HH_mm_ss')
}
```
