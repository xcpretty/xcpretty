# XCPretty

__XCPretty is a fast and flexible formatter for `xcodebuild`__.<br/>
It does one thing, and it should do it well.

## Installation

    $ gem install xcpretty

## Usage

XCPretty is designed to be piped with `xcodebuild` and thus keeping 100% compatibility with it.
This means, when `xcodebuild` works, `xcpretty` works.
It's even a bit faster than `xcodebuild` only, since it saves your terminal some prints.

## Formats

- --color, -c (you can add it to any format)
- --simple, -s (default)
![xcpretty --simple](http://i.imgur.com/SMx0gUD.gif)

- --test, -t (RSpec style)
![xcpretty alpha](http://i.imgur.com/VeTQQub.gif)

- tun / tap (not yet implemented. possible solution for most CI servers)

## Have you just cloned xctool?

Unlike [xctool](https://github.com/facebook/xctool), `xcpretty` isn't a build tool.
It relies on `xcodebuild` to do the build process, and it formats the output.

By the time when [xctool](https://github.com/facebook/xctool) was made, `xcodebuild`
wasn't aware of the `test` command. That means, running tests in general via CLI was a pain.
At this point, `xcodebuild` has got improved a lot, and it's ready to be used directly.

## Why?

There are many usages of this tool. Let me give you some ideas:
- Xcode's test tools are close to useless. Failures in a sidebar, non-dettachable console,... You can use `xcpretty` to build your next Xcode test runner plugin
- Run tests each time you hit save. The output is minimal, so go and wire it up with [Kicker](https://github.com/alloy/kicker) or [Guard](https://github.com/guard/guard) and be a real hipster!
- Mine Bitcoins. You can't with this tool, but you'll be so productive that you can earn all the money and buy them!!!1!

## Roadmap
- Improve test reporting, group tests semantically
- Write original xcodebuild output with -o flag

## Benchmark

A smaller project ([ObjectiveSugar](https://github.com/mneorr/objectivesugar)) with a fast suite

#### XCPretty
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
#### XCtool
```
$ time xctool -workspace ObjectiveSugar.xcworkspace -scheme ObjectiveSugar -sdk iphonesimulator test
... ommitted output ...
** TEST SUCCEEDED: 84 passed, 0 failed, 0 errored, 84 total ** (26964 ms)

28.05 real         6.59 user         2.24 sys
```

A bit bigger project, without CocoaPods ([ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa))

#### XCPretty
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
#### XCtool
```
$ time xctool -project ReactiveCocoa.xcodeproj -scheme ReactiveCocoa test
... ommitted output ...
** TEST SUCCEEDED: 922 passed, 0 failed, 0 errored, 922 total ** (9584 ms)

       10.80 real         6.72 user         0.76 sys
```


## Thanks

- [Delisa Mason](http://github.com/kattrali) - for being a part of this
- [Fred Potter](http://github.com/fpotter) for making xctool and inspiring us
