# XCPretty

__XCPretty is a flexible formatter for `xcodebuild`__.<br/>
It does one thing, and it should do it well.

## Installation

    $ gem install xcpretty

## Usage

    $ xcodebuild -project MyProject.xcodeproj | xcpretty

XCPretty is designed to be piped with `xcodebuild` and thus keeping 100% compatibility with it.
This means, when `xcodebuild` works, `xcpretty` works.

It plays well with Makefiles and Rakefiles, and it should retain the `stderr` and status code from `xcodebuild`.


## XCPretty isn't
Unlike [xctool](https://github.com/facebook/xctool), `xcpretty` isn't a build tool.
It relies on `xcodebuild` to do the build process, and it formats the output.

