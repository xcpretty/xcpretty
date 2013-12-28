# Changelog

## master

###### Enhancements

* exit(1) if xcodebuild failure detected

* Print compile errors nicely. Currently we support compiler erorrs,
  and Pods-not-installed errors. Missing mach-o-linker failures

* Added support for loading arbitrary custom printers (experimental) |
  [Eloy Durán](https://github.com/alloy) |
  [#29](https://github.com/mneorr/xcpretty/pulls/29)

* Show help banner in case no data is piped in |
  [Eloy Durán](https://github.com/alloy) |
  [#29](https://github.com/mneorr/xcpretty/pulls/29)

## 0.0.6

###### Enhancements

* Added support for reporters
* Added JUnit reporter

## 0.0.5

###### Bug Fixes

* `--no-utf` was set incorrectly. now it works as expected.


## 0.0.4

###### Enhancements

* Prettier `--simple` output
  [Preview](https://travis-ci.org/allending/Kiwi/builds/15190533)

* Removed Paint dependency

* Better test failure formatting (added indentation, grouped by suite)

* Added example of running tests continuously

* Support for not using Unicode (`--no-utf`)

###### Bug Fixes

* Fixed multi-suite summary output (when tests are run on many devices)


## 0.0.3

- add Ruby 1.8 support

## 0.0.2

- add Ruby 1.9 support

## 0.0.1

- initial version
