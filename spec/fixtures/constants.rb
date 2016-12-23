# encoding: utf-8

KIWI = 'kiwi'
OCUNIT = 'ocunit'
SAMPLE_OCUNIT_TEST_RUN_BEGINNING = "Test Suite '/Users/musalj/Library/Developer/Xcode/DerivedData/ReactiveCocoa-eznxkbqvgfsnrvetemqloysuwagb/Build/Products/Test/ReactiveCocoaTests.octest(Tests)' started at 2013-12-10 07:04:33 +0000"
SAMPLE_KIWI_TEST_RUN_BEGINNING = "Test Suite 'ObjectiveRecordTests.xctest' started at 2013-12-10 06:15:39 +0000"
SAMPLE_SPECTA_TEST_RUN_BEGINNING = "    Test Suite 'KIFTests.xctest' started at 2014-02-28 15:43:42 +0000"
SAMPLE_OCUNIT_TEST_RUN_COMPLETION = "Test Suite '/Users/musalj/Library/Developer/Xcode/DerivedData/ReactiveCocoa-eznxkbqvgfsnrvetemqloysuwagb/Build/Products/Test/ReactiveCocoaTests.octest(Tests)' finished at 2013-12-10 07:03:03 +0000."
SAMPLE_OCUNIT_FAILED_TEST_RUN_COMPLETION = "Test Suite '/Users/dm/someplace/Macadamia.octest' failed at 2014-09-24 23:09:20 +0000."
SAMPLE_OCUNIT_PASSED_TEST_RUN_COMPLETION = "Test Suite 'Hazelnuts.xctest' passed at 2014-09-24 23:09:20 +0000."
SAMPLE_KIWI_TEST_RUN_COMPLETION = "Test Suite 'ObjectiveRecordTests.xctest' finished at 2013-12-10 06:15:42 +0000."
SAMPLE_SPECTA_TEST_RUN_COMPLETION = "     Test Suite 'KIFTests.xctest' finished at 2014-02-28 15:44:32 +0000."

SAMPLE_OCUNIT_SUITE_BEGINNING = "Test Suite 'RACKVOWrapperSpec' started at 2013-12-10 21:06:10 +0000"
SAMPLE_SPECTA_SUITE_BEGINNING = "   Test Suite 'All tests' started at 2014-02-28 19:07:41 +0000"
SAMPLE_KIWI_SUITE_COMPLETION = "Test Suite 'All tests' finished at 2013-12-08 04:26:49 +0000."
SAMPLE_OCUNIT_SUITE_COMPLETION = "Test Suite '/Users/musalj/Library/Developer/Xcode/DerivedData/ReactiveCocoa-eznxkbqvgfsnrvetemqloysuwagb/Build/Products/Test/ReactiveCocoaTests.octest(Tests)' finished at 2013-12-08 22:09:37 +0000."
SAMPLE_XCTEST_SUITE_COMPLETION = "Test Suite 'ObjectiveSugarTests.xctest' finished at 2013-12-09 04:42:13 +0000."

SAMPLE_KIWI_FAILURE = "/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:49: error: -[NumberAdditions Iterators_TimesIteratesTheExactNumberOfTimes] : 'Iterators, times： iterates the exact number of times' [FAILED], expected subject to equal 4, got 5"
SAMPLE_OLD_SPECTA_FAILURE = "/Users/musalj/code/OSS/ReactiveCocoa/ReactiveCocoaFramework/ReactiveCocoaTests/RACCommandSpec.m:458: error: -[RACCommandSpec enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES] : expected: 1, got: 0"
SAMPLE_SPECTA_FAILURE = "         Test Case '-[SKWelcomeViewControllerSpecSpec SKWelcomeViewController_When_a_user_opens_the_app_from_a_clean_installation_displays_the_welcome_screen]' started. \n/Users/vickeryj/Code/ipad-register/KIFTests/Specs/SKWelcomeViewControllerSpec.m:11: error: -[SKWelcomeViewControllerSpecSpec SKWelcomeViewController_When_a_user_opens_the_app_from_a_clean_installation_displays_the_welcome_screen] : The step timed out after 2.00 seconds: Failed to find accessibility element with the label \"The asimplest way to make smarter business decisions\""

SAMPLE_BUILD_TARGET           = "=== BUILD TARGET The Spacer OF PROJECT Git app WITH THE DEFAULT CONFIGURATION Debug ==="
SAMPLE_BUILD_AGGREGATE_TARGET = "=== BUILD AGGREGATE TARGET The Spacer OF PROJECT Git app WITH CONFIGURATION Debug ==="
SAMPLE_ANALYZE_TARGET   = "=== ANALYZE TARGET The Spacer OF PROJECT Git app WITH THE DEFAULT CONFIGURATION Debug ==="
SAMPLE_CLEAN_TARGET = "=== CLEAN TARGET The Spacer OF PROJECT Git app WITH CONFIGURATION Debug ==="

SAMPLE_BUILD_SUCCEEDED = "** BUILD SUCCEEDED **"
SAMPLE_CLEAN_SUCCEEDED = "** CLEAN SUCCEEDED **"
SAMPLE_CLEAN_REMOVE = %Q(
Clean.Remove clean /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugarTests.build
    builtin-rm -rf /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugarTests.build
)
SAMPLE_EXECUTED_TESTS = "Executed 4 tests, with 0 failures (0 unexpected) in 0.003 (0.004) seconds"
SAMPLE_SPECTA_EXECUTED_TESTS = "       Executed 4 tests, with 0 failures (0 unexpected) in 10.192 (10.193) seconds"
SAMPLE_OCUNIT_TEST = "Test Case '-[RACCommandSpec enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES]' passed (0.001 seconds)."
SAMPLE_SPECTA_TEST = "         Test Case '-[SKWelcomeActivationViewControllerSpecSpec SKWelcomeActivationViewController_When_a_user_enters_their_details_lets_them_enter_a_valid_manager_code]' passed (0.725 seconds)."
SAMPLE_SLOWISH_TEST = "Test Case '-[RACCommandSpec enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES]' passed (0.026 seconds)."
SAMPLE_SLOW_TEST = "Test Case '-[RACCommandSpec enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES]' passed (0.101 seconds)."
SAMPLE_KIWI_TEST = "Test Case '-[MappingsTests Mappings_SupportsCreatingAParentObjectUsingJustIDFromTheServer]' passed (0.004 seconds)."
SAMPLE_PENDING_KIWI_TEST = "Test Case '-[TAPIConversationSpec TAPIConversation_createConversation_SendsAPOSTRequestToTheConversationsEndpointPENDING]' passed (0.001 seconds)."
SAMPLE_MEASURING_TEST = "<unknown>:0: Test Case '-[SecEncodeTransformTests.SecEncodeTransformTests test_RFC4648_Decode_UsingBase32]' measured [Time, seconds] average: 0.013, relative standard deviation: 26.773%, values: [0.023838, 0.012034, 0.013512, 0.011022, 0.011203, 0.012814, 0.011131, 0.012740, 0.013646, 0.012145], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100"

SAMPLE_COMPILE = %Q(
CompileC /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Objects-normal/i386/NSMutableArray+ObjectiveSugar.o /Users/musalj/code/OSS/Objective\\ Sugar/Classes/NSMutableArray+ObjectiveSugar.m normal i386 objective-c com.apple.compilers.llvm.clang.1_0.compiler
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example/Pods
    export LANG=en_US.US-ASCII
    setenv LANG en_US.US-ASCII
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c -arch i386 -fmessage-length=178 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fmodules -fmodules-cache-path=/Users/musalj/Library/Developer/Xcode/DerivedData/ModuleCache -Wno-trigraphs -fpascal-strings -O0 -Wno-missing-field-initializers -Wno-missing-prototypes -Werror=return-type -Wno-implicit-atomic-properties -Werror=deprecated-objc-isa-usage -Werror=objc-root-class -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wshorten-64-to-32 -Wpointer-sign -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -DDEBUG=1 -DCOCOAPODS=1 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -fexceptions -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -g -Wno-sign-conversion -fobjc-abi-version=2 -fobjc-legacy-dispatch -mios-simulator-version-min=5.0 -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Pods-ObjectiveSugar-generated-files.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Pods-ObjectiveSugar-own-target-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Pods-ObjectiveSugar-all-target-headers.hmap -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Pods-ObjectiveSugar-project-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/include -I/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/BuildHeaders -I/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/BuildHeaders/ObjectiveSugar -I/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/Headers -I/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/Headers/Kiwi -I/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/Headers/ObjectiveSugar -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/DerivedSources/i386 -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/DerivedSources -F/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator -include /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/PrecompiledHeaders/Pods-ObjectiveSugar-prefix-fbehxvikzshezadcwuseekuhbnus/Pods-ObjectiveSugar-prefix.pch -MMD -MT dependencies -MF /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Objects-normal/i386/NSMutableArray+ObjectiveSugar.d --serialize-diagnostics /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Objects-normal/i386/NSMutableArray+ObjectiveSugar.dia -c /Users/musalj/code/OSS/ObjectiveSugar/Classes/NSMutableArray+ObjectiveSugar.m -o /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Objects-normal/i386/NSMutableArray+ObjectiveSugar.o
)

SAMPLE_ANOTHER_COMPILE = %Q(
CompileC /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Objects-normal/i386/KWNull.o Classes/Core/KWNull.m normal i386 objective-c com.apple.compilers.llvm.clang.1_0.compiler
    cd /Users/musalj/code/OSS/Kiwi
    setenv LANG en_US.US-ASCII
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c -arch i386 -fmessage-length=178 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=c99 -fobjc-arc -Wno-trigraphs -fpascal-strings -O0 -Wno-missing-field-initializers -Wmissing-prototypes -Wno-implicit-atomic-properties -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wduplicate-method-match -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wshorten-64-to-32 -Wpointer-sign -Wnewline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -fexceptions -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -g -Wno-sign-conversion -fobjc-abi-version=2 -fobjc-legacy-dispatch -mios-simulator-version-min=5.0 -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Kiwi-generated-files.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Kiwi-own-target-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Kiwi-all-target-headers.hmap -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Kiwi-project-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Products/Debug-iphonesimulator/include -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include -I/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/DerivedSources/i386 -I/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/DerivedSources -Wall -F/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Products/Debug-iphonesimulator -F/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk/Developer/Library/Frameworks -F/Applications/Xcode.app/Contents/Developer/Library/Frameworks -include /Users/musalj/code/OSS/Kiwi/Supporting\\ Files/Kiwi-Prefix.pch -MMD -MT dependencies -MF /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Objects-normal/i386/KWNull.d --serialize-diagnostics /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Objects-normal/i386/KWNull.dia -c /Users/musalj/code/OSS/Kiwi/Classes/Core/KWNull.m -o /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Objects-normal/i386/KWNull.o
)

SAMPLE_SWIFT_COMPILE = %Q(
CompileSwift normal x86_64 /Users/marinusalj/code/foo/bar-temp/baz/Classes/yolo + Common/Common/Helpers & Managers/Poller.swift
    cd /Users/paul/foo/bar/siesta
    /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -frontend -c /Users/paul/foo/bar/siesta/Source/Networking-Alamofire.swift /Users/paul/foo/bar/siesta/Source/Networking.swift /Users/paul/foo/bar/siesta/Source/ARC+Siesta.swift /Users/paul/foo/bar/siesta/Source/DebugFormatting.swift /Users/paul/foo/bar/siesta/Source/Configuration.swift /Users/paul/foo/bar/siesta/Source/Networking-NSURLSession.swift /Users/paul/foo/bar/siesta/Source/Collection+Siesta.swift /Users/paul/foo/bar/siesta/Source/Logging.swift /Users/paul/foo/bar/siesta/Source/GCD+Siesta.swift /Users/paul/foo/bar/siesta/Source/Regex.swift /Users/paul/foo/bar/siesta/Source/ResourceObserver.swift /Users/paul/foo/bar/siesta/Source/Service.swift /Users/paul/foo/bar/siesta/Source/Request.swift /Users/paul/foo/bar/siesta/Source/NSURL+Siesta.swift /Users/paul/foo/bar/siesta/Source/ResourceStatusOverlay.swift /Users/paul/foo/bar/siesta/Source/WeakCache.swift -primary-file /Users/paul/foo/bar/siesta/Source/Resource.swift /Users/paul/foo/bar/siesta/Source/ResponseTransformer.swift /Users/paul/foo/bar/siesta/Source/RemoteImageView.swift /Users/paul/foo/bar/siesta/Source/Error.swift /Users/paul/foo/bar/siesta/Source/Entity.swift /Users/paul/foo/bar/siesta/Source/Siesta-ObjC.swift /Users/paul/foo/bar/siesta/Source/String+Siesta.swift /Users/paul/foo/bar/siesta/Source/PersistentCache.swift -target arm64-apple-ios8.0 -Xllvm -aarch64-use-tbi -enable-objc-interop -sdk /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.0.sdk -I /tmp/xcode-build/Release-iphoneos -F /tmp/xcode-build/Release-iphoneos -F /Users/paul/foo/bar/siesta/Carthage/Build/iOS -g -import-underlying-module -serialize-debugging-options -Xcc -I/tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/swift-overrides.hmap -Xcc -iquote -Xcc /tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/Siesta-generated-files.hmap -Xcc -I/tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/Siesta-own-target-headers.hmap -Xcc -I/tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/Siesta-all-non-framework-target-headers.hmap -Xcc -ivfsoverlay -Xcc /tmp/xcode-build/Siesta.build/all-product-headers.yaml -Xcc -iquote -Xcc /tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/Siesta-project-headers.hmap -Xcc -I/tmp/xcode-build/Release-iphoneos/include -Xcc -I/tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/DerivedSources/arm64 -Xcc -I/tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/DerivedSources -Xcc -ivfsoverlay -Xcc /tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/unextended-module-overlay.yaml -Xcc -working-directory/Users/paul/foo/bar/siesta -emit-module-doc-path /tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/Objects-normal/arm64/Resource~partial.swiftdoc -O -module-name Siesta -emit-module-path /tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/Objects-normal/arm64/Resource~partial.swiftmodule -serialize-diagnostics-path /tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/Objects-normal/arm64/Resource.dia -emit-dependencies-path /tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/Objects-normal/arm64/Resource.d -emit-reference-dependencies-path /tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/Objects-normal/arm64/Resource.swiftdeps -o /tmp/xcode-build/Siesta.build/Release-iphoneos/Siesta.build/Objects-normal/arm64/Resource.o -embed-bitcode-marker
)

SAMPLE_COMPILE_SWIFT_SOURCES = %Q(
CompileSwiftSources normal x86_64 com.apple.xcode.tools.swift.compiler
    cd /Users/marinusalj/code/lyft/lyft-temp/Pods
    export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
    export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/marinusalj/.bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marinusalj/.fzf/bin"
    export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator10.0.sdk
    export TOOLCHAINS=com.apple.dt.toolchain.Swift_2_3
    /Applications/Xcode.app/Contents/Developer/Toolchains/Swift_2.3.xctoolchain/usr/bin/swiftc -incremental -module-name LambdaKit -Onone -D COCOAPODS -DDEBUG -sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator10.0.sdk -target x86_64-apple-ios8.0 -g -module-cache-path /Users/marinusalj/code/lyft/lyft-temp/build/ModuleCache -Xfrontend -serialize-debugging-options -application-extension -enable-testing -I /Users/marinusalj/code/lyft/lyft-temp/build -F /Users/marinusalj/code/lyft/lyft-temp/build -c -j8 /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/AVAudioPlayer+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/AVSpeechSynthesizer+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/CADisplayLink+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/CLLocationManager+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/MFMailComposeViewController+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/MFMessageComposeViewController+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/NSObject+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/NSTimer+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/UIBarButtonItem+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/UIControl+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/UIGestureRecognizer+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/UIImagePickerController+LambdaKit.swift /Users/marinusalj/code/lyft/lyft-temp/Pods/LambdaKit/Source/UIWebView+LambdaKit.swift -output-file-map /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LambdaKit-iOS.build/Objects-normal/x86_64/LambdaKit-iOS-OutputFileMap.json -parseable-output -serialize-diagnostics -emit-dependencies -emit-module -emit-module-path /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LambdaKit-iOS.build/Objects-normal/x86_64/LambdaKit.swiftmodule -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LambdaKit-iOS.build/swift-overrides.hmap -Xcc -iquote -Xcc /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LambdaKit-iOS.build/LambdaKit-generated-files.hmap -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LambdaKit-iOS.build/LambdaKit-own-target-headers.hmap -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LambdaKit-iOS.build/LambdaKit-all-non-framework-target-headers.hmap -Xcc -ivfsoverlay -Xcc /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/all-product-headers.yaml -Xcc -iquote -Xcc /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LambdaKit-iOS.build/LambdaKit-project-headers.hmap -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/build/include -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Private -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/CardIO -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/Crashlytics -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/Fabric -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/GoogleMaps -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/GooglePlaces -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/Instabug -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/Kochava -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/Leanplum-iOS-SDK -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/TrustDefenderMobile -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/Tune -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/Pods/Headers/Public/WazeTransport -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LambdaKit-iOS.build/DerivedSources/x86_64 -Xcc -I/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LambdaKit-iOS.build/DerivedSources -Xcc -DPOD_CONFIGURATION_DEBUG=1 -Xcc -DDEBUG=1 -Xcc -DCOCOAPODS=1 -emit-objc-header -emit-objc-header-path /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LambdaKit-iOS.build/Objects-normal/x86_64/LambdaKit-Swift.h -import-underlying-module -Xcc -working-directory/Users/marinusalj/code/lyft/lyft-temp/Pods
)

SAMPLE_COMPILE_ASSET_CATALOG = %Q(
CompileAssetCatalog /Users/marinusalj/code/lyft/lyft-temp/build/LyftUI.framework /Users/marinusalj/code/lyft/lyft-temp/LyftKit/Resources/LyftUI/Images.xcassets
    cd /Users/marinusalj/code/lyft/lyft-temp/Pods
    export PATH="/Applications/Xcode7.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode7.app/Contents/Developer/usr/bin:/Users/marinusalj/.
bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marinusalj/.fzf/bin"
    /Applications/Xcode7.app/Contents/Developer/usr/bin/actool --output-format human-readable-text --notices --warnings --export-dependency-info /Users/marinusalj/code/lyft/lyft-temp/bu
ild/Pods.build/Debug-iphonesimulator/LyftUI.build/assetcatalog_dependencies --output-partial-info-plist /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/Lyft
UI.build/assetcatalog_generated_info.plist --compress-pngs --enable-on-demand-resources NO --filter-for-device-model iPhone8,1 --filter-for-device-os-version 9.3 --target-device iphone
--target-device ipad --minimum-deployment-target 8.0 --platform iphonesimulator --compile /Users/marinusalj/code/lyft/lyft-temp/build/LyftUI.framework /Users/marinusalj/code/lyft/lyft-t
emp/LyftKit/Resources/LyftUI/Images.xcassets
/* com.apple.actool.compilation-results */
/Users/marinusalj/code/lyft/lyft-temp/build/LyftUI.framework/Assets.car
/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/LyftUI.build/assetcatalog_generated_info.plist
)

SAMPLE_MERGE_SWIFT_MODULE = %Q(
MergeSwiftModule normal x86_64 /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/Objects-normal/x86_64/SnapKit.swiftmodule
    cd /Users/marinusalj/code/lyft/lyft-temp/Pods
    /Applications/Xcode.app/Contents/Developer/Toolchains/Swift_2.3.xctoolchain/usr/bin/swift -frontend -emit-module /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/D
)

SAMPLE_CPHEADER = %Q(
CpHeader Target\\ Support\\ Files/Alamofire/Alamofire-umbrella.h /Users/marinusalj/code/lyft/lyft-temp/build/Alamofire.framework/Headers/Alamofire-umbrella.h
    cd /Users/marinusalj/code/lyft/lyft-temp/Pods
    export PATH="/Applications/Xcode7.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode7.app/Contents/Developer/usr/bin:/Users/marinusalj/.bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marinusalj/.fzf/bin"
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks /Users/marinusalj/code/lyft/lyft-temp/Pods/Target\ Support\ Files/Alamofire/Alamofire-umbrella.h /Users/marinusalj/code/lyft/lyft-temp/build/Alamofire.framework/Headers
)

SAMPLE_DITTO = %Q(
Ditto /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/DerivedSources/SnapKit-Swift.h /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/Objects-normal/x86_64/SnapKit-Swift.h
    cd /Users/marinusalj/code/lyft/lyft-temp/Pods
    export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/marinusalj/.bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marinusalj/.fzf/bin"
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/Alamofire.build/module.modulemap /Users/marinusalj/code/lyft/lyft-temp/build/Alamofire.framework/Modules
    /usr/bin/ditto -rsrc /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/Objects-normal/x86_64/SnapKit-Swift.h /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/DerivedSources/SnapKit-Swift.h
)

SAMPLE_PRECOMPILE = %Q(
ProcessPCH /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CocoaLumberjack-prefix-aklsecopvqdctoeroyamrkgktpei/Pods-CocoaLumberjack-prefix.pch.pch Pods-CocoaLumberjack-prefix.pch normal i386 objective-c com.apple.compilers.llvm.clang.1_0.compiler
    cd /Users/musalj/code/OSS/ObjectiveRecord/Pods
    setenv LANG en_US.US-ASCII
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/.rbenv/versions/2.0.0-p247/bin:/usr/local/Cellar/rbenv/0.4.0/libexec:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c-header -arch i386 -fmessage-length=178 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fmodules -fmodules-cache-path=/Users/musalj/Library/Developer/Xcode/DerivedData/ModuleCache -Wno-trigraphs -fpascal-strings -O0 -Wno-missing-field-initializers -Wno-missing-prototypes -Werror=return-type -Wno-implicit-atomic-properties -Werror=deprecated-objc-isa-usage -Werror=objc-root-class -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wshorten-64-to-32 -Wpointer-sign -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -DDEBUG=1 -DCOCOAPODS=1 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -fexceptions -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -g -Wno-sign-conversion -fobjc-abi-version=2 -fobjc-legacy-dispatch -mios-simulator-version-min=6.0 -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/Pods-CocoaLumberjack-generated-files.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/Pods-CocoaLumberjack-own-target-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/Pods-CocoaLumberjack-all-target-headers.hmap -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/Pods-CocoaLumberjack-project-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Products/Debug-iphonesimulator/include -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/BuildHeaders -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/BuildHeaders/CocoaLumberjack -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/ABContactHelper -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/AFNetworking -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/CocoaLumberjack -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/CrittercismSDK -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/DTCoreText -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/DTFoundation -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/HPGrowingTextView -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/Kiwi -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/MAKVONotificationCenter -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/MAKVONotificationCenter/MAKVONotificationCenter -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/MBSwitch -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/MBSwitch/MBSwitch -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/Reachability -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/SBJson -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/SSKeychain -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/TITokenField -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/YamDrawReport -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/YamKit -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/YamKit/YamCore -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/YamKit/YamData -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/YamKit/YamSerf -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/YamKit/YamUI -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/YamKitTests -I/Users/musalj/code/OSS/ObjectiveRecord/Pods/Headers/cometclient -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/DerivedSources/i386 -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/DerivedSources -F/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Products/Debug-iphonesimulator -fobjc-arc -DOS_OBJECT_USE_OBJC=0 --serialize-diagnostics /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CocoaLumberjack-prefix-aklsecopvqdctoeroyamrkgktpei/Pods-CocoaLumberjack-prefix.pch.dia -MMD -MT dependencies -MF /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CocoaLumberjack-prefix-aklsecopvqdctoeroyamrkgktpei/Pods-CocoaLumberjack-prefix.pch.d -c /Users/musalj/code/OSS/ObjectiveRecord/Pods/Pods-CocoaLumberjack-prefix.pch -o /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveRecord-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CocoaLumberjack-prefix-aklsecopvqdctoeroyamrkgktpei/Pods-CocoaLumberjack-prefix.pch.pch
)

SAMPLE_LIBTOOL = %Q(
Libtool /Users/marinusalj/code/lyft/lyft-temp/build/Pods_Models.framework/Pods_Models normal x86_64
    cd /Users/marinusalj/code/lyft/lyft-temp/Pods
    export IPHONEOS_DEPLOYMENT_TARGET=8.0
    export PATH="/Applications/Xcode7.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode7.app/Contents/Developer/usr/bin:/Users/marinusalj/.bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marinusalj/.fzf/bin"
    /Applications/Xcode7.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool -static -arch_only x86_64 -syslibroot /Applications/Xcode7.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator9.3.sdk -L/Users/marinusalj/code/lyft/lyft-temp/build -filelist /Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/Pods-Models.build/Objects-normal/x86_64/Pods_Models.LinkFileList -framework Foundation -o /Users/marinusalj/code/lyft/lyft-temp/build/Pods_Models.framework/Pods_Models
)

SAMPLE_CPRESOURCE = %Q(
CpResource ObjectiveSugar/Default-568h@2x.png /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/Default-568h@2x.png
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example
    export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks /Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugar/Default-568h@2x.png /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app
)

SAMPLE_COPYSTRINGS = %Q(
CopyStringsFile build/Products/Debug-iphonesimulator/Models.framework/en.lproj/Localizable.strings Lyft/Models/Resources/en.lproj/Localizable.strings
    cd /Users/marinusalj/code/lyft/lyft-ios
    export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/Users/marinusalj/.linuxbrew/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    builtin-copyStrings --validate --inputencoding utf-8 --outputencoding binary --outdir /Users/marinusalj/code/lyft/lyft-ios/build/Products/Debug-iphonesimulator/Models.framework/en.lproj -- Lyft/Models/Resources/en.lproj/Localizable.strings
)

SAMPLE_COPYPNGFILE = %Q(
CopyPNGFile build/Example.app/Default-568h@2x.png Default-568h@2x.png
    cd /Users/distiller/LyftKit/Example
    export PATH="/Applications/Xcode-8.0.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode-8.0.app/Contents/Developer/usr/bin:/usr/local/bin:/usr/local/lib/ruby/gems/2.3.0/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode-8.0.app/Contents/Developer/usr/bin/copypng -compress -strip-PNG-text /Users/distiller/LyftKit/Example/Default-568h@2x.png /Users/distiller/LyftKit/Example/build/Example.app/Default-568h@2x.png
)

SAMPLE_COPYSWIFTLIBS = %Q(
CopySwiftLibs /Users/marinusalj/code/lyft/lyft-temp/build/Pods_Lyft.framework
    cd /Users/marinusalj/code/lyft/lyft-temp/Pods
    export CODESIGN_ALLOCATE=/Applications/Xcode7.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate
    export DEVELOPER_DIR=/Applications/Xcode7.app/Contents/Developer
    export PATH="/Applications/Xcode7.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode7.app/Contents/Developer/usr/bin:/Users/marinusalj/.bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marinusalj/.fzf/bin"
    export SDKROOT=/Applications/Xcode7.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator9.3.sdk
    export TOOLCHAINS=com.apple.dt.toolchain.iOS9_3
    /Applications/Xcode7.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-stdlib-tool --copy --verbose --scan-executable /Users/marinusalj/code/lyft/lyft-temp/build/Pods_Lyft.framework/Pods_Lyft --scan-folder /Users/marinusalj/code/lyft/lyft-temp/build/Pods_Lyft.framework/Frameworks --scan-folder /Users/marinusalj/code/lyft/lyft-temp/build/Pods_Lyft.framework/PlugIns --scan-folder /Applications/Xcode7.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk/System/Library/Frameworks/Foundation.framework --platform iphonesimulator --destination /Users/marinusalj/code/lyft/lyft-temp/build/Pods_Lyft.framework/Frameworks --strip-bitcode
    builtin-swiftStdLibTool --copy --verbose --sign - --scan-executable /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/yolo --scan-folder /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks --scan-folder /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/PlugIns --scan-folder /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator10.0.sdk/System/Library/Frameworks/AddressBook.framework --scan-folder /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/Models.framework --scan-folder /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/API.framework --scan-folder /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/Pods_yolo.framework --platform iphonesimulator --toolchain /Applications/Xcode.app/Contents/Developer/Toolchains/Swift_2.3.xctoolchain --toolchain /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain --toolchain /Applications/Xcode.app/Contents/Developer/Toolchains/Swift_2.3.xctoolchain --toolchain /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain --destination /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks --strip-bitcode --resource-destination /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app --resource-library libswiftRemoteMirror.dylib
Requested Swift ABI version based on scanned binaries: 3
libswiftCore.dylib is up to date at /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib
libswiftCoreGraphics.dylib is up to date at /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCoreGraphics.dylib
Probing signature of /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib
  /usr/bin/codesign '-r-' '--display' '/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib'
Codesigning /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib
  /usr/bin/codesign '--force' '--sign' '-' '--verbose' '/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib'
Probing signature of /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib
  /usr/bin/codesign '-r-' '--display' '/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib'
Code signature of /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib is unchanged; keeping original
Probing signature of /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCoreAudio.dylib
  /usr/bin/codesign '-r-' '--display' '/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCoreImage.dylib'
  /usr/bin/codesign '-r-' '--display' '/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftPassKit.dylib'
  /usr/bin/codesign '-r-' '--display' '/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftObjectiveC.dylib'
Codesigning /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftPassKit.dylib
Codesigning /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCoreImage.dylib
Codesigning /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftAVFoundation.dylib
  /usr/bin/codesign '--force' '--sign' '-' '--verbose' '/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftDispatch.dylib'
  /usr/bin/codesign '--force' '--sign' '-' '--verbose' '/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftObjectiveC.dylib'
Codesigning /Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftUIKit.dylib
  /usr/bin/codesign '--force' '--sign' '-' '--verbose' '/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftPassKit.dylib'
)

SAMPLE_PROCESS_INFOPLIST = %Q(
ProcessInfoPlistFile /Users/marinusalj/code/lyft/lyft-temp/build/LambdaKit.framework/Info.plist Target\\ Support\\ Files/LambdaKit-iOS/Info.plist
    cd /Users/marinusalj/code/lyft/lyft-temp/Pods
    export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/marinusalj/.bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marinusalj/.fzf/bin"
    builtin-infoPlistUtility /Users/marinusalj/code/lyft/lyft-temp/Pods/Target\\ Support\\ Files/LambdaKit-iOS/Info.plist -expandbuildsettings -format binary -platform iphonesimulator -o /Users/marinusalj/code/lyft/lyft-temp/build/LambdaKit.framework/Info.plist
)

SAMPLE_LD = %Q(
Ld /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/ObjectiveSugar normal i386
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example
    export PATH="/Applications/Xcode7.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode7.app/Contents/Developer/usr/bin:/Users/marinusalj/.bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marinusalj/.fzf/bin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -arch i386 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -L/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator -F/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator -filelist /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects-normal/i386/ObjectiveSugar.LinkFileList -Xlinker -objc_abi_version -Xlinker 2 -ObjC -fobjc-arc -fobjc-link-runtime -Xlinker -no_implicit_dylibs -mios-simulator-version-min=4.3 -framework UIKit -framework Foundation -framework CoreGraphics -lPods -Xlinker -dependency_info -Xlinker /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects-normal/i386/ObjectiveSugar_dependency_info.dat -o /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/ObjectiveSugar
)

SAMPLE_LD_RELATIVE = %Q(
Ld ../Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/ObjectiveSugar normal i386
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example
    setenv IPHONEOS_DEPLOYMENT_TARGET 4.3
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -arch i386 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -L/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator -F/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator -filelist /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects-normal/i386/ObjectiveSugar.LinkFileList -Xlinker -objc_abi_version -Xlinker 2 -ObjC -fobjc-arc -fobjc-link-runtime -Xlinker -no_implicit_dylibs -mios-simulator-version-min=4.3 -framework UIKit -framework Foundation -framework CoreGraphics -lPods -Xlinker -dependency_info -Xlinker /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects-normal/i386/ObjectiveSugar_dependency_info.dat -o /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/ObjectiveSugar
).freeze

SAMPLE_DSYM = %Q(
GenerateDSYMFile /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugarTests.octest.dSYM /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugarTests.octest/ObjectiveSugarTests
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/dsymutil /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugarTests.octest/ObjectiveSugarTests -o /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugarTests.octest.dSYM
)

SAMPLE_TOUCH = %Q(
Touch /Users/musalj/Library/Developer/Xcode/DerivedData/Alcatraz-aobuxcinaqyzjugrnxjjhfzgwaou/Build/Products/Debug/Alcatraz\\ Tests.octest
    cd /Users/musalj/code/OSS/Alcatraz
    export PATH="/Applications/Xcode7.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode7.app/Contents/Developer/usr/bin:/Users/marinusalj/.bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marinusalj/.fzf/bin"
    /usr/bin/touch -c /Users/musalj/Library/Developer/Xcode/DerivedData/Alcatraz-aobuxcinaqyzjugrnxjjhfzgwaou/Build/Products/Debug/Alcatraz\\ Tests.octest
)

SAMPLE_WRITE_FILE = %Q(
write-file /Users/me/myproject/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-AFNetworking.build/Objects-normal/x86_64/Pods-AFNetworking.LinkFileList
)

SAMPLE_WRITE_AUXILIARY_FILES = %Q(
Write auxiliary files
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Script-49C486D7B8EF179A4C22BBA8.sh
chmod 0755 /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Script-49C486D7B8EF179A4C22BBA8.sh
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/module.modulemap
/bin/mkdir -p /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Objects-normal/x86_64
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Objects-normal/x86_64/Models.LinkFileList
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/swift-overrides.hmap
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Models-own-target-headers.hmap
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Models.hmap
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/all-product-headers.yaml
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Models-project-headers.hmap
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Models-all-non-framework-target-headers.hmap
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Models-generated-files.hmap
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Objects-normal/x86_64/WatchModels-OutputFileMap.json
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Script-E44F85D54F22A5EEFE0DDBE1.sh
chmod 0755 /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Script-E44F85D54F22A5EEFE0DDBE1.sh
/bin/mkdir -p /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/DerivedSources
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/DerivedSources/Models_vers.c
write-file /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Models-all-target-headers.hmap
)

SAMPLE_TIFFUTIL = %Q(
TiffUtil eye_icon.tiff
    cd /Users/musalj/code/OSS/Alcatraz
    /usr/bin/tiffutil -cathidpicheck /Users/musalj/code/OSS/Alcatraz/Alcatraz/eye_icon@2x.png /Users/musalj/code/OSS/Alcatraz/Alcatraz/eye_icon.png -out /Users/musalj/Library/Application\\ Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin/Contents/Resources/eye_icon.tiff
)

SAMPLE_PHASE_SCRIPT_EXECUTION_FAIL = %Q(
PhaseScriptExecution [CP]\\ Check\\ Pods\\ Manifest.lock build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Script-E44F85D54F22A5EEFE0DDBE1.sh
    cd /Users/marinusalj/code/lyft/lyft-temp
    /bin/sh -c /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Script-E44F85D54F22A5EEFE0DDBE1.sh
error: The sandbox is not in sync with the Podfile.lock. Run 'pod install' or update your CocoaPods installation.
)

SAMPLE_NEW_RUN_SCRIPT = %Q(
PhaseScriptExecution Generate\ View\ Controller\ Factory build/Lyft.build/Debug-iphonesimulator/Lyft.build/Script-679D9DF81B72DA39003A5532.sh
    cd /Users/marinusalj/code/lyft/lyft-temp
    export ACTION=build
    export AD_HOC_CODE_SIGNING_ALLOWED=NO
    export ALTERNATE_GROUP=staff
    export ALTERNATE_MODE=u+w,go-w,a+rX
    export ALTERNATE_OWNER=marinusalj
    export ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES=YES
    export ALWAYS_SEARCH_USER_PATHS=NO
    export ALWAYS_USE_SEPARATE_HEADERMAPS=NO
    export INFOPLIST_EXPAND_BUILD_SETTINGS=YES
    export INFOPLIST_FILE="Lyft/Supporting Files/Info.plist"
    export INFOPLIST_OUTPUT_FORMAT=binary
    export INFOPLIST_PATH=Lyft.app/Info.plist
    export INFOPLIST_PREPROCESS=NO
    export INFOSTRINGS_PATH=Lyft.app/English.lproj/InfoPlist.strings
    export INSTALL_DIR=/tmp/Lyft.dst/Applications
    export INSTALL_GROUP=staff
    export INSTALL_MODE_FLAG=u+w,go-w,a+rX
    /bin/sh -c /Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/Lyft.build/Script-679D9DF81B72DA39003A5532.sh
storyboarder version 0.1-internal
collecting viewcontrollers...
  eowifalwekfjalwkej: 6 controllers collected
  eowifalwekfjalwkej: 5 controllers collected
  eowifalwekfjalwkej: 5 controllers collected
  eowifalwekfjalwkej: 2 controllers collected
  eowifalwekfjalwkej: 12 controllers collected
  eowifalwekfjalwkej: 7 controllers collected
  eowifalwekfjalwkej: 2 controllers collected
  eowifalwekfjalwkej: 4 controllers collected
  eowifalwekfjalwkej: 3 controllers collected
  eowifalwekfjalwkej: 3 controllers collected
  eowifalwekfjalwkej: 11 controllers collected
  eowifalwekfjalwkej: 1 controllers collected
  eowifalwekfjalwkej: 5 controllers collected
  eowifalwekfjalwkej: 1 controllers collected
  eowifalwekfjalwkej: 13 controllers collected
  eowifalwekfjalwkej: 7 controllers collected
  eowifalwekfjalwkej: 5 controllers collected
  eowifalwekfjalwkej: 4 controllers collected
  eowifalwekfjalwkej: 4 controllers collected
  eowifalwekfjalwkej: 1 controllers collected
  eowifalwekfjalwkej: 2 controllers collected
  eowifalwekfjalwkej: 3 controllers collected
  eowifalwekfjalwkej: 15 controllers collected
  eowifalwekfjalwkej: 2 controllers collected
  eowifalwekfjalwkej: 2 controllers collected
  eowifalwekfjalwkej: 2 controllers collected
  eowifalwekfjalwkej: 8 controllers collected
  eowifalwekfjalwkej: 8 controllers collected
  eowifalwekfjalwkej: 2 controllers collected
  eowifalwekfjalwkej: 4 controllers collected
149 viewcontrollers in 30 storyboards
assembling...
done!
)

SAMPLE_RUN_SCRIPT = %Q(
PhaseScriptExecution Check\\ Pods\\ Manifest.lock /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Script-468DABF301EC4EC1A00CC4C2.sh
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example
    setenv ACTION build
    setenv AD_HOC_CODE_SIGNING_ALLOWED NO
    setenv ALTERNATE_GROUP staff
    setenv ALTERNATE_MODE u+w,go-w,a+rX
    setenv ALTERNATE_OWNER musalj
    setenv ALWAYS_SEARCH_USER_PATHS NO
    setenv ALWAYS_USE_SEPARATE_HEADERMAPS YES
    setenv APPLE_INTERNAL_DEVELOPER_DIR /AppleInternal/Developer
    setenv APPLE_INTERNAL_DIR /AppleInternal
    setenv APPLE_INTERNAL_DOCUMENTATION_DIR /AppleInternal/Documentation
    setenv APPLE_INTERNAL_LIBRARY_DIR /AppleInternal/Library
    setenv APPLE_INTERNAL_TOOLS /AppleInternal/Developer/Tools
    setenv APPLY_RULES_IN_COPY_FILES NO
    setenv ARCHS i386
    setenv ARCHS_STANDARD i386
    setenv ARCHS_STANDARD_32_64_BIT i386
    setenv ARCHS_STANDARD_32_BIT i386
    setenv ARCHS_STANDARD_64_BIT x86_64
    setenv ARCHS_STANDARD_INCLUDING_64_BIT "i386 x86_64"
    setenv AVAILABLE_PLATFORMS "iphonesimulator macosx iphoneos"
    setenv BUILD_COMPONENTS "headers build"
    setenv BUILD_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products
    setenv BUILD_ROOT /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products
    setenv BUILD_STYLE
    setenv BUILD_VARIANTS normal
    setenv BUILT_PRODUCTS_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator
    setenv CACHE_ROOT /var/folders/dp/3hrp_j_j04b6gxk5tybq0lz80000gp/C/com.apple.DeveloperTools/5.0.2-5A3005/Xcode
    setenv CCHROOT /var/folders/dp/3hrp_j_j04b6gxk5tybq0lz80000gp/C/com.apple.DeveloperTools/5.0.2-5A3005/Xcode
    setenv CHMOD /bin/chmod
    setenv CHOWN /usr/sbin/chown
    setenv CLANG_CXX_LANGUAGE_STANDARD gnu++0x
    setenv CLANG_CXX_LIBRARY libc++
    setenv CLANG_ENABLE_OBJC_ARC YES
    setenv CLANG_WARN_CONSTANT_CONVERSION YES
    setenv CLANG_WARN_EMPTY_BODY YES
    setenv CLANG_WARN_ENUM_CONVERSION YES
    setenv CLANG_WARN_INT_CONVERSION YES
    setenv CLANG_WARN__DUPLICATE_METHOD_MATCH YES
    setenv CLASS_FILE_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/JavaClasses
    setenv CLEAN_PRECOMPS YES
    setenv CLONE_HEADERS NO
    setenv CODESIGNING_FOLDER_PATH /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app
    setenv CODE_SIGNING_ALLOWED NO
    setenv CODE_SIGN_CONTEXT_CLASS XCiPhoneSimulatorCodeSignContext
    setenv CODE_SIGN_IDENTITY "iPhone Developer"
    setenv COLOR_DIAGNOSTICS NO
    setenv COMBINE_HIDPI_IMAGES NO
    setenv COMMAND_MODE legacy
    setenv COMPOSITE_SDK_DIRS /var/folders/dp/3hrp_j_j04b6gxk5tybq0lz80000gp/C/com.apple.DeveloperTools/5.0.2-5A3005/Xcode/CompositeSDKs
    setenv COMPRESS_PNG_FILES YES
    setenv CONFIGURATION Debug
    setenv CONFIGURATION_BUILD_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator
    setenv CONFIGURATION_TEMP_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator
    setenv CONTENTS_FOLDER_PATH ObjectiveSugar.app
    setenv COPYING_PRESERVES_HFS_DATA NO
    setenv COPY_PHASE_STRIP NO
    setenv COPY_RESOURCES_FROM_STATIC_FRAMEWORKS YES
    setenv CP /bin/cp
    setenv CREATE_INFOPLIST_SECTION_IN_BINARY NO
    setenv CURRENT_ARCH i386
    setenv CURRENT_VARIANT normal
    setenv DEAD_CODE_STRIPPING NO
    setenv DEBUGGING_SYMBOLS YES
    setenv DEBUG_INFORMATION_FORMAT dwarf-with-dsym
    setenv DEFAULT_COMPILER com.apple.compilers.llvm.clang.1_0
    setenv DEFAULT_KEXT_INSTALL_PATH /System/Library/Extensions
    setenv DEPLOYMENT_LOCATION NO
    setenv DEPLOYMENT_POSTPROCESSING NO
    setenv DERIVED_FILES_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/DerivedSources
    setenv DERIVED_FILE_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/DerivedSources
    setenv DERIVED_SOURCES_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/DerivedSources
    setenv DEVELOPER_APPLICATIONS_DIR /Applications/Xcode.app/Contents/Developer/Applications
    setenv DEVELOPER_BIN_DIR /Applications/Xcode.app/Contents/Developer/usr/bin
    setenv DEVELOPER_DIR /Applications/Xcode.app/Contents/Developer
    setenv DEVELOPER_FRAMEWORKS_DIR /Applications/Xcode.app/Contents/Developer/Library/Frameworks
    setenv DEVELOPER_FRAMEWORKS_DIR_QUOTED /Applications/Xcode.app/Contents/Developer/Library/Frameworks
    setenv DEVELOPER_LIBRARY_DIR /Applications/Xcode.app/Contents/Developer/Library
    setenv DEVELOPER_SDK_DIR /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs
    setenv DEVELOPER_TOOLS_DIR /Applications/Xcode.app/Contents/Developer/Tools
    setenv DEVELOPER_USR_DIR /Applications/Xcode.app/Contents/Developer/usr
    setenv DEVELOPMENT_LANGUAGE English
    setenv DOCUMENTATION_FOLDER_PATH ObjectiveSugar.app/English.lproj/Documentation
    setenv DO_HEADER_SCANNING_IN_JAM NO
    setenv DSTROOT /tmp/ObjectiveSugar.dst
    setenv DT_TOOLCHAIN_DIR /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain
    setenv DWARF_DSYM_FILE_NAME ObjectiveSugar.app.dSYM
    setenv DWARF_DSYM_FILE_SHOULD_ACCOMPANY_PRODUCT NO
    setenv DWARF_DSYM_FOLDER_PATH /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator
    setenv EFFECTIVE_PLATFORM_NAME -iphonesimulator
    setenv ENABLE_HEADER_DEPENDENCIES YES
    setenv EXCLUDED_INSTALLSRC_SUBDIRECTORY_PATTERNS ".DS_Store .svn .git .hg CVS"
    setenv EXCLUDED_RECURSIVE_SEARCH_PATH_SUBDIRECTORIES "*.nib *.lproj *.framework *.gch (*) .DS_Store CVS .svn .git .hg *.xcodeproj *.xcode *.pbproj *.pbxproj"
    setenv EXECUTABLES_FOLDER_PATH ObjectiveSugar.app/Executables
    setenv EXECUTABLE_FOLDER_PATH ObjectiveSugar.app
    setenv EXECUTABLE_NAME ObjectiveSugar
    setenv EXECUTABLE_PATH ObjectiveSugar.app/ObjectiveSugar
    setenv FILE_LIST /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects/LinkFileList
    setenv FIXED_FILES_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/FixedFiles
    setenv FRAMEWORKS_FOLDER_PATH ObjectiveSugar.app/Frameworks
    setenv FRAMEWORK_FLAG_PREFIX -framework
    setenv FRAMEWORK_SEARCH_PATHS "/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator "
    setenv FRAMEWORK_VERSION A
    setenv FULL_PRODUCT_NAME ObjectiveSugar.app
    setenv GCC3_VERSION 3.3
    setenv GCC_C_LANGUAGE_STANDARD gnu99
    setenv GCC_DYNAMIC_NO_PIC NO
    setenv GCC_INLINES_ARE_PRIVATE_EXTERN YES
    setenv GCC_OBJC_LEGACY_DISPATCH YES
    setenv GCC_OPTIMIZATION_LEVEL 0
    setenv GCC_PFE_FILE_C_DIALECTS "c objective-c c++ objective-c++"
    setenv GCC_PRECOMPILE_PREFIX_HEADER YES
    setenv GCC_PREFIX_HEADER ObjectiveSugar/ObjectiveSugar-Prefix.pch
    setenv GCC_PREPROCESSOR_DEFINITIONS "DEBUG=1  COCOAPODS=1"
    setenv GCC_SYMBOLS_PRIVATE_EXTERN NO
    setenv GCC_TREAT_WARNINGS_AS_ERRORS NO
    setenv GCC_VERSION com.apple.compilers.llvm.clang.1_0
    setenv GCC_VERSION_IDENTIFIER com_apple_compilers_llvm_clang_1_0
    setenv GCC_WARN_ABOUT_RETURN_TYPE YES
    setenv GCC_WARN_UNINITIALIZED_AUTOS YES
    setenv GCC_WARN_UNUSED_VARIABLE YES
    setenv GENERATE_MASTER_OBJECT_FILE NO
    setenv GENERATE_PKGINFO_FILE YES
    setenv GENERATE_PROFILING_CODE NO
    setenv GID 20
    setenv GROUP staff
    setenv HEADERMAP_INCLUDES_FLAT_ENTRIES_FOR_TARGET_BEING_BUILT YES
    setenv HEADERMAP_INCLUDES_FRAMEWORK_ENTRIES_FOR_ALL_PRODUCT_TYPES YES
    setenv HEADERMAP_INCLUDES_NONPUBLIC_NONPRIVATE_HEADERS YES
    setenv HEADERMAP_INCLUDES_PROJECT_HEADERS YES
    setenv HEADER_SEARCH_PATHS "/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/include \"/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/Headers\" \"/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/Headers/Kiwi\" \"/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/Headers/ObjectiveSugar\""
    setenv ICONV /usr/bin/iconv
    setenv INFOPLIST_EXPAND_BUILD_SETTINGS YES
    setenv INFOPLIST_FILE ObjectiveSugar/ObjectiveSugar-Info.plist
    setenv INFOPLIST_OUTPUT_FORMAT binary
    setenv INFOPLIST_PATH ObjectiveSugar.app/Info.plist
    setenv INFOPLIST_PREPROCESS NO
    setenv INFOSTRINGS_PATH ObjectiveSugar.app/English.lproj/InfoPlist.strings
    setenv INSTALL_DIR /tmp/ObjectiveSugar.dst/Applications
    setenv INSTALL_GROUP staff
    setenv INSTALL_MODE_FLAG u+w,go-w,a+rX
    setenv INSTALL_OWNER musalj
    setenv INSTALL_PATH /Applications
    setenv INSTALL_ROOT /tmp/ObjectiveSugar.dst
    setenv IPHONEOS_DEPLOYMENT_TARGET 4.3
    setenv JAVAC_DEFAULT_FLAGS "-J-Xms64m -J-XX:NewSize=4M -J-Dfile.encoding=UTF8"
    setenv JAVA_APP_STUB /System/Library/Frameworks/JavaVM.framework/Resources/MacOS/JavaApplicationStub
    setenv JAVA_ARCHIVE_CLASSES YES
    setenv JAVA_ARCHIVE_TYPE JAR
    setenv JAVA_COMPILER /usr/bin/javac
    setenv JAVA_FOLDER_PATH ObjectiveSugar.app/Java
    setenv JAVA_FRAMEWORK_RESOURCES_DIRS Resources
    setenv JAVA_JAR_FLAGS cv
    setenv JAVA_SOURCE_SUBDIR .
    setenv JAVA_USE_DEPENDENCIES YES
    setenv JAVA_ZIP_FLAGS -urg
    setenv JIKES_DEFAULT_FLAGS "+E +OLDCSO"
    setenv KEEP_PRIVATE_EXTERNS NO
    setenv LD_DEPENDENCY_INFO_FILE /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects-normal/i386/ObjectiveSugar_dependency_info.dat
    setenv LD_GENERATE_MAP_FILE NO
    setenv LD_MAP_FILE_PATH /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/ObjectiveSugar-LinkMap-normal-i386.txt
    setenv LD_NO_PIE NO
    setenv LD_QUOTE_LINKER_ARGUMENTS_FOR_COMPILER_DRIVER YES
    setenv LEGACY_DEVELOPER_DIR /Applications/Xcode.app/Contents/PlugIns/Xcode3Core.ideplugin/Contents/SharedSupport/Developer
    setenv LEX lex
    setenv LIBRARY_FLAG_NOSPACE YES
    setenv LIBRARY_FLAG_PREFIX -l
    setenv LIBRARY_KEXT_INSTALL_PATH /Library/Extensions
    setenv LIBRARY_SEARCH_PATHS "/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator "
    setenv LINKER_DISPLAYS_MANGLED_NAMES NO
    setenv LINK_FILE_LIST_normal_i386 /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects-normal/i386/ObjectiveSugar.LinkFileList
    setenv LINK_WITH_STANDARD_LIBRARIES YES
    setenv LOCALIZED_RESOURCES_FOLDER_PATH ObjectiveSugar.app/English.lproj
    setenv LOCAL_ADMIN_APPS_DIR /Applications/Utilities
    setenv LOCAL_APPS_DIR /Applications
    setenv LOCAL_DEVELOPER_DIR /Library/Developer
    setenv LOCAL_LIBRARY_DIR /Library
    setenv MACH_O_TYPE mh_execute
    setenv MACOSX_DEPLOYMENT_TARGET 10.6
    setenv MAC_OS_X_PRODUCT_BUILD_VERSION 13A603
    setenv MAC_OS_X_VERSION_ACTUAL 1090
    setenv MAC_OS_X_VERSION_MAJOR 1090
    setenv MAC_OS_X_VERSION_MINOR 0900
    setenv MODULE_CACHE_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ModuleCache
    setenv NATIVE_ARCH i386
    setenv NATIVE_ARCH_32_BIT i386
    setenv NATIVE_ARCH_64_BIT x86_64
    setenv NATIVE_ARCH_ACTUAL x86_64
    setenv NO_COMMON YES
    setenv OBJC_ABI_VERSION 2
    setenv OBJECT_FILE_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects
    setenv OBJECT_FILE_DIR_normal /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects-normal
    setenv OBJROOT /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates
    setenv ONLY_ACTIVE_ARCH NO
    setenv OPTIMIZATION_LEVEL 0
    setenv OS MACOS
    setenv OSAC /usr/bin/osacompile
    setenv OTHER_LDFLAGS -ObjC
    setenv PACKAGE_TYPE com.apple.package-type.wrapper.application
    setenv PASCAL_STRINGS YES
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/libexec:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/local/bin:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/usr/bin:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/usr/local/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/local/bin:/Applications/Xcode.app/Contents/Developer/Tools:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    setenv PATH_PREFIXES_EXCLUDED_FROM_HEADER_DEPENDENCIES "/usr/include /usr/local/include /System/Library/Frameworks /System/Library/PrivateFrameworks /Applications/Xcode.app/Contents/Developer/Headers /Applications/Xcode.app/Contents/Developer/SDKs /Applications/Xcode.app/Contents/Developer/Platforms"
    setenv PBDEVELOPMENTPLIST_PATH ObjectiveSugar.app/pbdevelopment.plist
    setenv PFE_FILE_C_DIALECTS objective-c
    setenv PKGINFO_FILE_PATH /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/PkgInfo
    setenv PKGINFO_PATH ObjectiveSugar.app/PkgInfo
    setenv PLATFORM_DEVELOPER_APPLICATIONS_DIR /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications
    setenv PLATFORM_DEVELOPER_BIN_DIR /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin
    setenv PLATFORM_DEVELOPER_LIBRARY_DIR /Applications/Xcode.app/Contents/PlugIns/Xcode3Core.ideplugin/Contents/SharedSupport/Developer/Library
    setenv PLATFORM_DEVELOPER_SDK_DIR /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs
    setenv PLATFORM_DEVELOPER_TOOLS_DIR /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Tools
    setenv PLATFORM_DEVELOPER_USR_DIR /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr
    setenv PLATFORM_DIR /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform
    setenv PLATFORM_NAME iphonesimulator
    setenv PLATFORM_PREFERRED_ARCH i386
    setenv PLATFORM_PRODUCT_BUILD_VERSION 11B508
    setenv PLATFORM_VERSION_AVAILABILITY_H_FORMAT 70000
    setenv PLIST_FILE_OUTPUT_FORMAT binary
    setenv PLUGINS_FOLDER_PATH ObjectiveSugar.app/PlugIns
    setenv PODS_ROOT /Users/musalj/code/OSS/ObjectiveSugar/Example/Pods
    setenv PRECOMPS_INCLUDE_HEADERS_FROM_BUILT_PRODUCTS_DIR YES
    setenv PRECOMP_DESTINATION_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/PrefixHeaders
    setenv PRESERVE_DEAD_CODE_INITS_AND_TERMS NO
    setenv PRIVATE_HEADERS_FOLDER_PATH ObjectiveSugar.app/PrivateHeaders
    setenv PRODUCT_NAME ObjectiveSugar
    setenv PRODUCT_SETTINGS_PATH /Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugar/ObjectiveSugar-Info.plist
    setenv PRODUCT_TYPE com.apple.product-type.application
    setenv PROFILING_CODE NO
    setenv PROJECT ObjectiveSugar
    setenv PROJECT_DERIVED_FILE_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/DerivedSources
    setenv PROJECT_DIR /Users/musalj/code/OSS/ObjectiveSugar/Example
    setenv PROJECT_FILE_PATH /Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugar.xcodeproj
    setenv PROJECT_NAME ObjectiveSugar
    setenv PROJECT_TEMP_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build
    setenv PROJECT_TEMP_ROOT /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates
    setenv PUBLIC_HEADERS_FOLDER_PATH ObjectiveSugar.app/Headers
    setenv RECURSIVE_SEARCH_PATHS_FOLLOW_SYMLINKS YES
    setenv REMOVE_CVS_FROM_RESOURCES YES
    setenv REMOVE_GIT_FROM_RESOURCES YES
    setenv REMOVE_HG_FROM_RESOURCES YES
    setenv REMOVE_SVN_FROM_RESOURCES YES
    setenv REZ_COLLECTOR_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/ResourceManagerResources
    setenv REZ_OBJECTS_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/ResourceManagerResources/Objects
    setenv REZ_SEARCH_PATHS "/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator "
    setenv SCAN_ALL_SOURCE_FILES_FOR_INCLUDES NO
    setenv SCRIPTS_FOLDER_PATH ObjectiveSugar.app/Scripts
    setenv SCRIPT_INPUT_FILE_COUNT 0
    setenv SCRIPT_OUTPUT_FILE_COUNT 0
    setenv SDKROOT /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk
    setenv SDK_DIR /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk
    setenv SDK_NAME iphonesimulator7.0
    setenv SDK_PRODUCT_BUILD_VERSION 11B508
    setenv SED /usr/bin/sed
    setenv SEPARATE_STRIP NO
    setenv SEPARATE_SYMBOL_EDIT NO
    setenv SET_DIR_MODE_OWNER_GROUP YES
    setenv SET_FILE_MODE_OWNER_GROUP NO
    setenv SHALLOW_BUNDLE YES
    setenv SHARED_DERIVED_FILE_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/DerivedSources
    setenv SHARED_FRAMEWORKS_FOLDER_PATH ObjectiveSugar.app/SharedFrameworks
    setenv SHARED_PRECOMPS_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/PrecompiledHeaders
    setenv SHARED_SUPPORT_FOLDER_PATH ObjectiveSugar.app/SharedSupport
    setenv SKIP_INSTALL NO
    setenv SOURCE_ROOT /Users/musalj/code/OSS/ObjectiveSugar/Example
    setenv SRCROOT /Users/musalj/code/OSS/ObjectiveSugar/Example
    setenv STRINGS_FILE_OUTPUT_ENCODING binary
    setenv STRIP_INSTALLED_PRODUCT YES
    setenv STRIP_STYLE all
    setenv SUPPORTED_DEVICE_FAMILIES "1 2"
    setenv SUPPORTED_PLATFORMS "iphonesimulator iphoneos"
    setenv SYMROOT /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products
    setenv SYSTEM_ADMIN_APPS_DIR /Applications/Utilities
    setenv SYSTEM_APPS_DIR /Applications
    setenv SYSTEM_CORE_SERVICES_DIR /System/Library/CoreServices
    setenv SYSTEM_DEMOS_DIR /Applications/Extras
    setenv SYSTEM_DEVELOPER_APPS_DIR /Applications/Xcode.app/Contents/Developer/Applications
    setenv SYSTEM_DEVELOPER_BIN_DIR /Applications/Xcode.app/Contents/Developer/usr/bin
    setenv SYSTEM_DEVELOPER_DEMOS_DIR "/Applications/Xcode.app/Contents/Developer/Applications/Utilities/Built Examples"
    setenv SYSTEM_DEVELOPER_DIR /Applications/Xcode.app/Contents/Developer
    setenv SYSTEM_DEVELOPER_DOC_DIR "/Applications/Xcode.app/Contents/Developer/ADC Reference Library"
    setenv SYSTEM_DEVELOPER_GRAPHICS_TOOLS_DIR "/Applications/Xcode.app/Contents/Developer/Applications/Graphics Tools"
    setenv SYSTEM_DEVELOPER_JAVA_TOOLS_DIR "/Applications/Xcode.app/Contents/Developer/Applications/Java Tools"
    setenv SYSTEM_DEVELOPER_PERFORMANCE_TOOLS_DIR "/Applications/Xcode.app/Contents/Developer/Applications/Performance Tools"
    setenv SYSTEM_DEVELOPER_RELEASENOTES_DIR "/Applications/Xcode.app/Contents/Developer/ADC Reference Library/releasenotes"
    setenv SYSTEM_DEVELOPER_TOOLS /Applications/Xcode.app/Contents/Developer/Tools
    setenv SYSTEM_DEVELOPER_TOOLS_DOC_DIR "/Applications/Xcode.app/Contents/Developer/ADC Reference Library/documentation/DeveloperTools"
    setenv SYSTEM_DEVELOPER_TOOLS_RELEASENOTES_DIR "/Applications/Xcode.app/Contents/Developer/ADC Reference Library/releasenotes/DeveloperTools"
    setenv SYSTEM_DEVELOPER_USR_DIR /Applications/Xcode.app/Contents/Developer/usr
    setenv SYSTEM_DEVELOPER_UTILITIES_DIR /Applications/Xcode.app/Contents/Developer/Applications/Utilities
    setenv SYSTEM_DOCUMENTATION_DIR /Library/Documentation
    setenv SYSTEM_KEXT_INSTALL_PATH /System/Library/Extensions
    setenv SYSTEM_LIBRARY_DIR /System/Library
    setenv TARGETED_DEVICE_FAMILY 1
    setenv TARGETNAME ObjectiveSugar
    setenv TARGET_BUILD_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator
    setenv TARGET_NAME ObjectiveSugar
    setenv TARGET_TEMP_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build
    setenv TEMP_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build
    setenv TEMP_FILES_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build
    setenv TEMP_FILE_DIR /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build
    setenv TEMP_ROOT /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates
    setenv TOOLCHAINS com.apple.dt.toolchain.XcodeDefault
    setenv UID 502
    setenv UNLOCALIZED_RESOURCES_FOLDER_PATH ObjectiveSugar.app
    setenv UNSTRIPPED_PRODUCT NO
    setenv USER musalj
    setenv USER_APPS_DIR /Users/musalj/Applications
    setenv USER_LIBRARY_DIR /Users/musalj/Library
    setenv USE_DYNAMIC_NO_PIC YES
    setenv USE_HEADERMAP YES
    setenv USE_HEADER_SYMLINKS NO
    setenv VALIDATE_PRODUCT NO
    setenv VALID_ARCHS i386
    setenv VERBOSE_PBXCP NO
    setenv VERSIONPLIST_PATH ObjectiveSugar.app/version.plist
    setenv VERSION_INFO_BUILDER musalj
    setenv VERSION_INFO_FILE ObjectiveSugar_vers.c
    setenv VERSION_INFO_STRING "\"@(#)PROGRAM:ObjectiveSugar  PROJECT:ObjectiveSugar-\""
    setenv WRAPPER_EXTENSION app
    setenv WRAPPER_NAME ObjectiveSugar.app
    setenv WRAPPER_SUFFIX .app
    setenv XCODE_APP_SUPPORT_DIR /Applications/Xcode.app/Contents/Developer/Library/Xcode
    setenv XCODE_PRODUCT_BUILD_VERSION 5A3005
    setenv XCODE_VERSION_ACTUAL 0502
    setenv XCODE_VERSION_MAJOR 0500
    setenv XCODE_VERSION_MINOR 0500
    setenv XPCSERVICES_FOLDER_PATH ObjectiveSugar.app/XPCServices
    setenv YACC yacc
    setenv arch i386
    setenv variant normal
    /bin/sh -c /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Script-468DABF301EC4EC1A00CC4C2.sh
)

SAMPLE_ANALYZE = %Q(
Analyze CocoaChip/CCChip8DisplayView.m
    cd /Users/dustin/Source/CocoaChip
    setenv LANG en_US.US-ASCII
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c -arch x86_64 -fmessage-length=107 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fobjc-arc -Wno-trigraphs -fpascal-strings -Os -Werror -Wmissing-field-initializers -Wmissing-prototypes -Wno-implicit-atomic-properties -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wduplicate-method-match -Wmissing-braces -Wparentheses -Wswitch -Wunused-function -Wunused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wshadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wsign-compare -Wshorten-64-to-32 -Wpointer-sign -Wnewline-eof -Wno-selector -Wstrict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -mmacosx-version-min=10.7 -g -fvisibility=hidden -Wno-sign-conversion -D__clang_analyzer__ -Xclang -analyzer-output=plist-multi-file -Xclang -analyzer-config -Xclang path-diagnostics-alternate=true -Xclang -analyzer-config -Xclang report-in-main-source-file=true -Xclang -analyzer-checker -Xclang security.insecureAPI.UncheckedReturn -Xclang -analyzer-checker -Xclang security.insecureAPI.getpw -Xclang -analyzer-checker -Xclang security.insecureAPI.gets -Xclang -analyzer-checker -Xclang security.insecureAPI.mkstemp -Xclang -analyzer-checker -Xclang security.insecureAPI.mktemp -Xclang -analyzer-disable-checker -Xclang security.insecureAPI.rand -Xclang -analyzer-disable-checker -Xclang security.insecureAPI.strcpy -Xclang -analyzer-checker -Xclang security.insecureAPI.vfork -iquote /Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-generated-files.hmap -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-own-target-headers.hmap -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-all-target-headers.hmap -iquote /Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-project-headers.hmap -I/Users/dustin/Source/CocoaChip/build/Release/include -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/DerivedSources/x86_64 -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/DerivedSources -F/Users/dustin/Source/CocoaChip/build/Release -include /var/folders/nn/s88k060x7016ccml2bc6f5_h0000gn/C/com.apple.DeveloperTools/5.0.2-5A3005/Xcode/SharedPrecompiledHeaders/CocoaChip-Prefix-cqqikmscxiepjgdcrgpysqicucyu/CocoaChip-Prefix.pch --analyze /Users/dustin/Source/CocoaChip/CocoaChip/CCChip8DisplayView.m -o /Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/StaticAnalyzer/CocoaChip/CocoaChip/normal/x86_64/CCChip8DisplayView.plist
)

SAMPLE_ANALYZE_SHALLOW = %Q(
AnalyzeShallow CocoaChip/CCChip8DisplayView.m
    cd /Users/dustin/Source/CocoaChip
    setenv LANG en_US.US-ASCII
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c -arch x86_64 -fmessage-length=107 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fobjc-arc -Wno-trigraphs -fpascal-strings -Os -Werror -Wmissing-field-initializers -Wmissing-prototypes -Wno-implicit-atomic-properties -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wduplicate-method-match -Wmissing-braces -Wparentheses -Wswitch -Wunused-function -Wunused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wshadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wsign-compare -Wshorten-64-to-32 -Wpointer-sign -Wnewline-eof -Wno-selector -Wstrict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -mmacosx-version-min=10.7 -g -fvisibility=hidden -Wno-sign-conversion -D__clang_analyzer__ -Xclang -analyzer-output=plist-multi-file -Xclang -analyzer-config -Xclang path-diagnostics-alternate=true -Xclang -analyzer-config -Xclang report-in-main-source-file=true -Xclang -analyzer-config -Xclang mode=shallow -Xclang -analyzer-checker -Xclang security.insecureAPI.UncheckedReturn -Xclang -analyzer-checker -Xclang security.insecureAPI.getpw -Xclang -analyzer-checker -Xclang security.insecureAPI.gets -Xclang -analyzer-checker -Xclang security.insecureAPI.mkstemp -Xclang -analyzer-checker -Xclang security.insecureAPI.mktemp -Xclang -analyzer-disable-checker -Xclang security.insecureAPI.rand -Xclang -analyzer-disable-checker -Xclang security.insecureAPI.strcpy -Xclang -analyzer-checker -Xclang security.insecureAPI.vfork -iquote /Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-generated-files.hmap -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-own-target-headers.hmap -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-all-target-headers.hmap -iquote /Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-project-headers.hmap -I/Users/dustin/Source/CocoaChip/build/Release/include -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/DerivedSources/x86_64 -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/DerivedSources -F/Users/dustin/Source/CocoaChip/build/Release -include /var/folders/nn/s88k060x7016ccml2bc6f5_h0000gn/C/com.apple.DeveloperTools/5.0.2-5A3005/Xcode/SharedPrecompiledHeaders/CocoaChip-Prefix-dzmrdzscqkbvvrafvxsbjwbxtmlz/CocoaChip-Prefix.pch --analyze /Users/dustin/Source/CocoaChip/CocoaChip/CCChip8DisplayView.m -o /Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/StaticAnalyzer/CocoaChip/CocoaChip/normal/x86_64/CCChip8DisplayView.plist
)

SAMPLE_ANALYZE_CPP = %Q(
Analyze CocoaChip/CCChip8DisplayView.cpp
    cd /Users/dustin/Source/CocoaChip
    setenv LANG en_US.US-ASCII
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c -arch x86_64 -fmessage-length=107 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fobjc-arc -Wno-trigraphs -fpascal-strings -Os -Werror -Wmissing-field-initializers -Wmissing-prototypes -Wno-implicit-atomic-properties -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wduplicate-method-match -Wmissing-braces -Wparentheses -Wswitch -Wunused-function -Wunused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wshadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wsign-compare -Wshorten-64-to-32 -Wpointer-sign -Wnewline-eof -Wno-selector -Wstrict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -mmacosx-version-min=10.7 -g -fvisibility=hidden -Wno-sign-conversion -D__clang_analyzer__ -Xclang -analyzer-output=plist-multi-file -Xclang -analyzer-config -Xclang path-diagnostics-alternate=true -Xclang -analyzer-config -Xclang report-in-main-source-file=true -Xclang -analyzer-checker -Xclang security.insecureAPI.UncheckedReturn -Xclang -analyzer-checker -Xclang security.insecureAPI.getpw -Xclang -analyzer-checker -Xclang security.insecureAPI.gets -Xclang -analyzer-checker -Xclang security.insecureAPI.mkstemp -Xclang -analyzer-checker -Xclang security.insecureAPI.mktemp -Xclang -analyzer-disable-checker -Xclang security.insecureAPI.rand -Xclang -analyzer-disable-checker -Xclang security.insecureAPI.strcpy -Xclang -analyzer-checker -Xclang security.insecureAPI.vfork -iquote /Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-generated-files.hmap -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-own-target-headers.hmap -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-all-target-headers.hmap -iquote /Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/CocoaChip-project-headers.hmap -I/Users/dustin/Source/CocoaChip/build/Release/include -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/DerivedSources/x86_64 -I/Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/DerivedSources -F/Users/dustin/Source/CocoaChip/build/Release -include /var/folders/nn/s88k060x7016ccml2bc6f5_h0000gn/C/com.apple.DeveloperTools/5.0.2-5A3005/Xcode/SharedPrecompiledHeaders/CocoaChip-Prefix-cqqikmscxiepjgdcrgpysqicucyu/CocoaChip-Prefix.pch --analyze /Users/dustin/Source/CocoaChip/CocoaChip/CCChip8DisplayView.m -o /Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/StaticAnalyzer/CocoaChip/CocoaChip/normal/x86_64/CCChip8DisplayView.plist
).freeze

SAMPLE_COMPILE_XIB = %Q(
CompileXIB /Users/marinusalj/code/lyft/lyft-temp/LyftKit/Resources/LyftUI/XIBs/AlertController.xib
    cd /Users/dustin/Source/CocoaChip
    export XCODE_DEVELOPER_USR_PATH=/Applications/Xcode.app/Contents/Developer/usr/bin/..
    /Applications/Xcode.app/Contents/Developer/usr/bin/ibtool --errors --warnings --notices --minimum-deployment-target 10.7 --output-format human-readable-text --compile /Users/dustin/Source/CocoaChip/build/Release/CocoaChip.app/Contents/Resources/en.lproj/MainMenu.nib /Users/dustin/Source/CocoaChip/CocoaChip/en.lproj/MainMenu.xib
)

SAMPLE_COMPILE_STORYBOARD = %Q(
CompileStoryboard Lyft/Resources/Storyboards\\ \\&\\ XIBs/Driver/DriverDestination.storyboard
    cd /Users/marinusalj/code/lyft/lyft-ios
    export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/marinusalj/.bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marinusalj/.fzf/bin"
    export XCODE_DEVELOPER_USR_PATH=/Applications/Xcode.app/Contents/Developer/usr/bin/..
    /Applications/Xcode.app/Contents/Developer/usr/bin/ibtool --errors --warnings --notices --module Lyft --output-partial-info-plist /Users/marinusalj/code/lyft/lyft-ios/build/Intermediates/Lyft.build/Debug-iphonesimulator/Lyft.build/DriverDestination-SBPartialInfo.plist --auto-activate-custom-fonts --target-device iphone --minimum-deployment-target 8.0 --output-format human-readable-text --compilation-directory /Users/marinusalj/code/lyft/lyft-ios/build/Intermediates/Lyft.build/Debug-iphonesimulator/Lyft.build /Users/marinusalj/code/lyft/lyft-ios/Lyft/Resources/Storyboards\ &\ XIBs/Driver/DriverDestination.storyboard
)

SAMPLE_CODESIGN = %Q(
CodeSign build/Release/CocoaChip.app
    cd /Users/dustin/Source/CocoaChip
    export CODESIGN_ALLOCATE=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate
    Using code signing identity \"Mac Developer: John Smith (0123456789)\"
    /usr/bin/codesign --force --sign 0123456789ABCDEF0123456789ABCDEF01234567 /Users/dustin/Source/CocoaChip/build/Release/CocoaChip.app
)

SAMPLE_CODESIGN_FRAMEWORK = %Q(
CodeSign build/Release/CocoaChipCore.framework/Versions/A
    cd /Users/dustin/Source/CocoaChip
    setenv CODESIGN_ALLOCATE /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate
    Using code signing identity "Mac Developer: John Smith (0123456789)"
    /usr/bin/codesign --force --sign 0123456789ABCDEF0123456789ABCDEF01234567 /Users/dustin/Source/CocoaChip/build/Release/CocoaChipCore.framework/Versions/A
)

SAMPLE_PREPROCESS = %Q(
Preprocess build/CocoaChip.build/Release/CocoaChip.build/Preprocessed-Info.plist CocoaChip/CocoaChip-Info.plist
    cd /Users/dustin/Source/CocoaChip
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc -E -P -x c -Wno-trigraphs /Users/dustin/Source/CocoaChip/CocoaChip/CocoaChip-Info.plist -F/Users/dustin/Source/CocoaChip/build/Release -o /Users/dustin/Source/CocoaChip/build/CocoaChip.build/Release/CocoaChip.build/Preprocessed-Info.plist
)

SAMPLE_PBXCP = %Q(
PBXCp build/Products/Debug-watchsimulator/API.framework build/Products/Debug-watchsimulator/WatchExtension.appex/Frameworks/API.framework
    cd /Users/marinusalj/code/lyft/lyft-ios
    export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/WatchSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/Users/marinusalj/.linuxbrew/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -exclude Headers -exclude PrivateHeaders -exclude Modules -resolve-src-symlinks /Users/marinusalj/code/lyft/lyft-ios/build/Products/Debug-watchsimulator/API.framework /Users/marinusalj/code/lyft/lyft-ios/build/Products/Debug-watchsimulator/WatchExtension.appex/Frameworks
)

SAMPLE_SCREENSHOT_FILE = 'RACCommandSpec, line 80, hello xcpretty.png'
SAMPLE_UNRELATED_IMAGE_FILE = 'apple_raw.png'

SAMPLE_CREATE_PRODUCT_STRUCTURE = %Q(
Create product structure
/bin/mkdir -p /Users/marinusalj/code/lyft/lyft-temp/build/LambdaKit.framework/Modules
/bin/mkdir -p /Users/marinusalj/code/lyft/lyft-temp/build/LambdaKit.framework/Headers
)

SAMPLE_LINK_STORYBOARDS = %Q(
LinkStoryboards
    cd /Users/marinusalj/code/lyft/lyft-ios
    export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/marinusalj/code/go/bin:/Users/marinusalj/.gem/bin:/Users/marinusalj/.linuxbrew/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    export XCODE_DEVELOPER_USR_PATH=/Applications/Xcode.app/Contents/Developer/usr/bin/..
    /Applications/Xcode.app/Contents/Developer/usr/bin/ibtool --errors --warnings --notices --module SiriUI --target-device iphone --target-device ipad --minimum-deployment-target 10.0 --output-format human-readable-text --link /Users/marinusalj/code/lyft/lyft-ios/build/Products/Debug-iphonesimulator/SiriUI.appex /Users/marinusalj/code/lyft/lyft-ios/build/Intermediates/Lyft.build/Debug-iphonesimulator/SiriUI.build/SiriUI.storyboardc
)

################################################################################
# ERRORS
################################################################################

SAMPLE_PODS_ERROR = "error: The sandbox is not in sync with the Podfile.lock. Run 'pod install' or update your CocoaPods installation."

SAMPLE_COMPILE_ERROR = %Q(
/Users/musalj/code/OSS/SampleApp/SampleTest.m:12:59: error: expected identifier
                [[thread.lastMessage should] equal:thread.];
                                                          ^
)

SAMPLE_FILE_MISSING_ERROR = %Q(
<unknown>:0: error: no such file or directory: '/Users/travis/build/supermarin/project/Classes/Class + Category/Two Words/MissingViewController.swift'
)

SAMPLE_CODESIGN_ERROR = %Q(
Code Sign error: No code signing identites found: No valid signing identities (i.e. certificate and private key pair) matching the team ID ‚ÄúCAT6HF57NJ‚Äù were found.
)

SAMPLE_CODESIGN_ERROR_NO_SPACES = %Q(
CodeSign error: code signing is required for product type 'Application' in SDK 'iOS 7.0'
)

SAMPLE_FATAL_COMPILE_ERROR = %Q(
In file included from /Users/musalj/code/OSS/SampleApp/Pods/SuperCoolPod/SuperAwesomeClass.m:12:
In file included from /Users/musalj/code/OSS/SampleApp/Pods/../LessCoolPod/LessCoolClass.h:9:
In file included from /Users/musalj/code/OSS/SampleApp/Pods/../LessCoolPod/EvenLessCoolClass.h:10:
/Users/musalj/code/OSS/SampleApp/Pods/Headers/LessCoolPod/SomeRandomClass.h:31:9: fatal error: 'SomeRandomHeader.h' file not found
#import "SomeRandomHeader.h"
        ^
)

SAMPLE_FATAL_COMPILE_PCH_ERROR = %Q(
fatal error: file '/path/to/myproject/Pods/Pods-environment.h' has been modified since the precompiled header '/Users/hiroshi/Library/Developer/Xcode/DerivedData/MyProject-gfmuvpipjscewkdnqacgumhfarrd/Build/Intermediates/PrecompiledHeaders/MyProject-Prefix-dwjpvcnrlaydzmegejmcvrtcfkpf/MyProject-Prefix.pch.pch' was built
)

SAMPLE_FATAL_HEADER_ERROR = %Q(
fatal error: malformed or corrupted AST file: 'could not find file '/Users/mpv/dev/project/Crashlytics.framework/Headers/Crashlytics.h' referenced by AST file' note: after modifying system headers, please delete the module cache at '/Users/mpv/Library/Developer/Xcode/DerivedData/ModuleCache/M5WJ0FYE7N06'
)

SAMPLE_UNDEFINED_SYMBOLS = %Q(
Undefined symbols for architecture x86_64:
  "_OBJC_CLASS_$_CABasicAnimation", referenced from:
      objc-class-ref in ATZRadialProgressControl.o
ld: symbol(s) not found for architecture x86_64
)

SAMPLE_DUPLICATE_SYMBOLS = %Q(
duplicate symbol _OBJC_IVAR_$ClassName._ivarName in:
    /Users/username/Library/Developer/Xcode/DerivedData/App-arcyyktezaigixbocjwfhsjllojz/Build/Intermediates/App.build/Debug-iphonesimulator/App.build/Objects-normal/i386/ClassName.o
    /Users/username/Library/Developer/Xcode/DerivedData/App-arcyyktezaigixbocjwfhsjllojz/Build/Products/Debug-iphonesimulator/libPods.a(DuplicateClassName.o)
ld: 1 duplicate symbol for architecture i386
clang: error: linker command failed with exit code 1 (use -v to see invocation)
)

SAMPLE_BITCODE_LD = %Q(
ld: '/Users/.../GoogleAnalytics-iOS-SDK/libGoogleAnalyticsServices.a(TAGHit.o)' does not contain bitcode. You must rebuild it with bitcode enabled (Xcode setting ENABLE_BITCODE), obtain an updated library from the vendor, or disable bitcode for this target. for architecture armv7
)

SAMPLE_LD_SYMBOLS_ERROR = 'ld: symbol(s) not found for architecture x86_64'
SAMPLE_LD_LIBRARY_ERROR = 'ld: library not found for -lPods-Yammer'

SAMPLE_CLANG_ERROR = 'clang: error: linker command failed with exit code 1 (use -v to see invocation)'

SAMPLE_COMPILE_ERROR_WITH_TILDES = %Q(
/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSSetTests.m:93:16: error: no visible @interface for 'NSArray' declares the selector 'shoulds'
            }] shoulds] equal:@[ @"F458 Italia", @"Testarossa" ]];
            ~~ ^~~~~~~
)

################################################################################
# WARNINGS
################################################################################

SAMPLE_FORMAT_WARNING = %Q(
/Users/supermarin/code/oss/ObjectiveSugar/Example/ObjectiveSugar/AppDelegate.m:19:31: warning: format specifies type 'id' but the argument has type 'int' [-Wformat]
    NSLog(@"I HAZ %@ CATS", 1);
                         ~~   ^
                         %d
1 warning generated.
)

