# XCPretty

__XCPretty is a fast and flexible formatter for `xcodebuild`__.<br/>
It does one thing, and it should do it well.

## Installation

    $ gem install xcpretty

## Usage

XCPretty is designed to be piped with `xcodebuild` and thus keeping 100% compatibility with it.
This means, when `xcodebuild` works, `xcpretty` works.
It's even a bit faster than `xcodebuild` only, since it saves your terminal some prints.

```
$ make test | xcpretty
....................................................................................

Executed 84 tests, with 0 failures (0 unexpected) in 0.071 (0.093) seconds
```
```
$ make test | xcpretty
...................................................F.F..............................

Iterators, -upto iterates inclusively, expected subject to equal 8, got 4
/Users/mneorr/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:30

Iterators, tests plural date inflections, expected subject to equal 51840, got 5184000
/Users/mneorr/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:78


Executed 84 tests, with 4 failures (4 unexpected) in 0.071 (0.095) seconds
** TEST FAILED **

make: *** [test] Error 65
```

## Formats

- Simple (default)
- Dots (RSpec style, shown above)

## XCPretty isn't

Unlike [xctool](https://github.com/facebook/xctool), `xcpretty` isn't a build tool.
It relies on `xcodebuild` to do the build process, and it formats the output.


## Benchmark

A smaller project ([ObjectiveSugar](https://github.com/mneorr/objectivesugar)) with a fast suite

#### XCPretty
```
....................................................................................

Executed 84 tests, with 0 failures (0 unexpected) in 0.071 (0.094) seconds
        4.28 real         6.15 user         2.22 sys
```
#### xcodebuild
```
... ommitted output ...
Executed 84 tests, with 0 failures (0 unexpected) in 0.103 (0.129) seconds
** TEST SUCCEEDED **

        4.35 real         6.07 user         2.21 sys
```
#### XCtool
```
... ommitted output ...
** TEST SUCCEEDED: 84 passed, 0 failed, 0 errored, 84 total ** (26964 ms)

28.05 real         6.59 user         2.24 sys
```
