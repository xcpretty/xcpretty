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

