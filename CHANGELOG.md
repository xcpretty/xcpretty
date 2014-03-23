# Changelog

## 0.1.4

###### Enhancements

* New logo
* New output format: tap
* New output format: knock
* Updated parser to support Specta 0.2.1
  | [Josh Vickery](https://github.com/vickeryj)
  | [#64](https://github.com/supermarin/xcpretty/pull/64)
* Support additional file extensions
  | [Boris Bügling](https://github.com/neonichu)
  | [#64](https://github.com/supermarin/xcpretty/pull/59)

## 0.1.3

###### Enhancements

* Indented test runs by suite
* Added HTML reporter

###### Misc

* removed the faux exit statuts hangling. use `exit ${PIPESTATUS[0]}`


## 0.1.2

###### Enhancements

* More consistent error output (add some spacing before and after)
* Parsed clang errors
* Parsed ld: errors


## 0.1.1

###### Enhancements

* Parse more fatal errors, and CodeSign errors that were printed to STDOUT |
  [#51](https://github.com/mneorr/XCPretty/issues/51)


## 0.1.0

###### Enhancements

* Color semi-slow tests in yellow, slow tests in red |
  [#46](https://github.com/mneorr/xcpretty/pull/46)
* Add option to specify a custom location for report generation |
  [#43](https://github.com/mneorr/XCPretty/pull/43)


## 0.0.9

###### Enhancements

* major performance fix, it's faster than `cat` by 2-3 times on big inputs.
  Thanks [@kviksilver](https://github.com/kviksilver) for providing debug log and helping to reproduce


## 0.0.8

###### Bug Fixes

* show version if not piped |
  [#39](https://github.com/mneorr/XCPretty/issues/39)

###### Enhancements

* format linker failures (Undefined symbols for arch...)


## 0.0.7

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

* Prettier `--simple` output |
  [Preview](https://travis-ci.org/allending/Kiwi/builds/15190533)
* Removed Paint dependency
* Better test failure formatting (added indentation, grouped by suite)
* Added example of running tests continuously
* Support for not using Unicode (`--no-utf`)

###### Bug Fixes

* Fixed multi-suite summary output (when tests are run on many devices)


## 0.0.3

* add Ruby 1.8 support

## 0.0.2

* add Ruby 1.9 support

## 0.0.1

* initial version

