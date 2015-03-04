![logo](http://i.imgur.com/i2fElxx.png)

__`xcpretty` is a fast and flexible formatter for `xcodebuild`__.<br/>
It does one thing, and it should do it well.

[![Gem version](http://img.shields.io/gem/v/xcpretty.svg)](http://rubygems.org/gems/xcpretty)
[![Build Status](https://travis-ci.org/supermarin/xcpretty.svg?branch=master)](https://travis-ci.org/supermarin/xcpretty)
[![Code Climate](http://img.shields.io/codeclimate/github/supermarin/xcpretty.svg)](https://codeclimate.com/github/supermarin/xcpretty)

## Installation
``` bash
$ gem install xcpretty
```

## Usage
``` bash
$ xcodebuild [flags] | xcpretty -c
```
`xcpretty` is designed to be piped with `xcodebuild` and thus keeping 100% compatibility with it.
It's even a bit faster than `xcodebuild` only, since it saves your terminal some prints.

__Important:__ If you're running `xcpretty` on a CI like Travis or Jenkins, you may want to exit with same status code as `xcodebuild`.
CI uses the status code to determine if build has failed.

``` bash
$ set -o pipefail && xcodebuild [flags] | xcpretty -c
#
# OR
#
$ xcodebuild [flags] | xcpretty -c && exit ${PIPESTATUS[0]}
```

## Formats

- `--color`, `-c` (you can add it to `--simple` or `--test` format)
- `--no-utf` (use only ASCII characters in output)

- `--simple`, `-s` (default)
![xcpretty --simple](http://i.imgur.com/LdmozBS.gif)

- `--test`, `-t` (RSpec style)
![xcpretty alpha](http://i.imgur.com/VeTQQub.gif)
- `--tap` ([Test Anything Protocol](http://testanything.org)-compatible output)
- `--knock`, `-k` (a [simplified version](https://github.com/chneukirchen/knock) of the Test Anything Protocol)


## Reporters

- `--report junit`, `-r junit`: Creates a JUnit-style XML report at `build/reports/junit.xml`, compatible with Jenkins and TeamCity CI.

- `--report html`, `-r html`: Creates a simple HTML report at `build/reports/tests.html`.
![xcpretty html](http://i.imgur.com/0Rnux3v.gif)

- `--report json-compilation-database`, `-r json-compilation-database`: Creates a [JSON compilation database](http://clang.llvm.org/docs/JSONCompilationDatabase.html) at `build/reports/compilation.json`. This is a format to replay single compilations independently of the build system.

Writing a report to a custom path can be specified using `--output PATH`.

## Extensions

`xcpretty` supports custom formatters through the use of the
`--formatter` flag, which takes a path to a file as an argument. The
file must contain a Ruby subclass of `XCPretty::Formatter`, and
return that class at the end of te file. The class
can override the `format_*` methods to hook into output parsing
events.

### Known extensions

* [xcpretty-travis-formatter](https://github.com/kattrali/xcpretty-travis-formatter): support for cleaner output in TravisCI using code folding

The recommended format is a gem containing the formatter and named
with an `xcpretty-` prefix, for easier discovery.

## Did you just clone xctool?

Unlike [xctool](https://github.com/facebook/xctool), `xcpretty` isn't a build tool.
It relies on `xcodebuild` to do the build process, and it formats the output.

By the time when [xctool](https://github.com/facebook/xctool) was made, `xcodebuild`
wasn't aware of the `test` command, thus running tests in general via CLI was a pain.
At this point `xcodebuild` has been improved significantly, and is ready to be used directly.


## Benchmark

A smaller project ([ObjectiveSugar](https://github.com/supermarin/objectivesugar)) with a fast suite

#### xcpretty
```
$ time xcodebuild -workspace ObjectiveSugar.xcworkspace -scheme ObjectiveSugar -sdk iphonesimulator test | xcpretty -tc
....................................................................................

Executed 84 tests, with 0 failures (0 unexpected) in 0.070 (0.094) seconds
        4.08 real         5.82 user         2.08 sys
```
#### xcodebuild
```
$ time xcodebuild -workspace ObjectiveSugar.xcworkspace -scheme ObjectiveSugar -sdk iphonesimulator test
... ommitted output ...
Executed 84 tests, with 0 failures (0 unexpected) in 0.103 (0.129) seconds
** TEST SUCCEEDED **

        4.35 real         6.07 user         2.21 sys
```
#### xctool
```
$ time xctool -workspace ObjectiveSugar.xcworkspace -scheme ObjectiveSugar -sdk iphonesimulator test
... ommitted output ...
** TEST SUCCEEDED: 84 passed, 0 failed, 0 errored, 84 total ** (26964 ms)

28.05 real         6.59 user         2.24 sys
```

A bit bigger project, without CocoaPods ([ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa))

#### xcpretty
```
$ time xcodebuild -project ReactiveCocoa.xcodeproj -scheme ReactiveCocoa test | xcpretty -tc
..........................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................

Executed 922 tests, with 0 failures (0 unexpected) in 6.437 (6.761) seconds
        8.72 real         5.73 user         0.81 sys
```
#### xcodebuild
```
$ time xcodebuild -project ReactiveCocoa.xcodeproj -scheme ReactiveCocoa test
... ommitted output ...
Executed 922 tests, with 0 failures (0 unexpected) in 6.542 (6.913) seconds
** TEST SUCCEEDED **

        8.82 real         5.65 user         0.75 sys
```
#### xctool
```
$ time xctool -project ReactiveCocoa.xcodeproj -scheme ReactiveCocoa test
... ommitted output ...
** TEST SUCCEEDED: 922 passed, 0 failed, 0 errored, 922 total ** (9584 ms)

       10.80 real         6.72 user         0.76 sys
```


## Thanks

- [Delisa Mason](http://github.com/kattrali) - for being a part of this
- [Fred Potter](http://github.com/fpotter) for making xctool and inspiring us
