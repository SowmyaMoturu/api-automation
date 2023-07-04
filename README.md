# Karate for API Testing

## Requirement
* Java Development Kit
* Maven

## Running Tests
```shell
$ mvn clean test
```

## Running Tests with a tag
```shell
$ mvn  clean test -Dkarate.options="--tags @smoke"
```

## Running a specific feature
```shell
$ mvn clean test -Dkarate.options="classpath:features/lookup/lookup.feature"
```

## Test Report
* Test report automatically generated on `target` folder after finished the test execution
* See test report from `target/cucumber-html-reports/overview-features.html` for the Cucumber report

## Perforamance tests
 * Need to explore performance test option using karate
