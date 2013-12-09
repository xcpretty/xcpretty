KIWI = 'kiwi'
OCUNIT = 'ocunit'
SAMPLE_KIWI_SUITE_COMPLETION = "Test Suite 'All tests' finished at 2013-12-08 04:26:49 +0000."
SAMPLE_OCUNIT_SUITE_COMPLETION = "Test Suite '/Users/musalj/Library/Developer/Xcode/DerivedData/ReactiveCocoa-eznxkbqvgfsnrvetemqloysuwagb/Build/Products/Test/ReactiveCocoaTests.octest(Tests)' finished at 2013-12-08 22:09:37 +0000."
SAMPLE_KIWI_FAILURE = "/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:49: error: -[NumberAdditions Iterators_TimesIteratesTheExactNumberOfTimes] : 'Iterators, times： iterates the exact number of times' [FAILED], expected subject to equal 4, got 5"
SAMPLE_SPECTA_FAILURE = "/Users/musalj/code/OSS/ReactiveCocoa/ReactiveCocoaFramework/ReactiveCocoaTests/RACCommandSpec.m:458: error: -[RACCommandSpec enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES] : expected: 1, got: 0"
SAMPLE_BUILD = "=== BUILD TARGET The Spacer OF PROJECT Pods WITH THE DEFAULT CONFIGURATION Debug ==="
SAMPLE_CLEAN = "=== CLEAN TARGET Pods-ObjectiveSugar OF PROJECT Pods WITH CONFIGURATION Debug ==="
SAMPLE_ANOTHER_CLEAN = "=== CLEAN TARGET Pods OF PROJECT Pods WITH CONFIGURATION Debug ==="
SAMPLE_CLEAN_NESTED_PODS = "=== CLEAN TARGET Pods-ObjectiveSugarTests-Kiwi OF PROJECT Pods WITH CONFIGURATION Debug ==="
SAMPLE_CLEAN_REMOVE = %Q(
Clean.Remove clean /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugarTests.build
    builtin-rm -rf /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugarTests.build
)
SAMPLE_EXECUTED_TESTS = "Executed 4 tests, with 0 failures (0 unexpected) in 0.003 (0.004) seconds"
SAMPLE_OCUNIT_TEST = "Test Case '-[RACTupleSpec _tupleByAddingObject__should_add_a_non_nil_object]' passed (0.001 seconds)."
SAMPLE_COMPILE = %Q(
CompileC /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Objects-normal/i386/NSMutableArray+ObjectiveSugar.o /Users/musalj/code/OSS/ObjectiveSugar/Classes/NSMutableArray+ObjectiveSugar.m normal i386 objective-c com.apple.compilers.llvm.clang.1_0.compiler
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example/Pods
    setenv LANG en_US.US-ASCII
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c -arch i386 -fmessage-length=178 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fmodules -fmodules-cache-path=/Users/musalj/Library/Developer/Xcode/DerivedData/ModuleCache -Wno-trigraphs -fpascal-strings -O0 -Wno-missing-field-initializers -Wno-missing-prototypes -Werror=return-type -Wno-implicit-atomic-properties -Werror=deprecated-objc-isa-usage -Werror=objc-root-class -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wshorten-64-to-32 -Wpointer-sign -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -DDEBUG=1 -DCOCOAPODS=1 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -fexceptions -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -g -Wno-sign-conversion -fobjc-abi-version=2 -fobjc-legacy-dispatch -mios-simulator-version-min=5.0 -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Pods-ObjectiveSugar-generated-files.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Pods-ObjectiveSugar-own-target-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Pods-ObjectiveSugar-all-target-headers.hmap -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Pods-ObjectiveSugar-project-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/include -I/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/BuildHeaders -I/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/BuildHeaders/ObjectiveSugar -I/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/Headers -I/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/Headers/Kiwi -I/Users/musalj/code/OSS/ObjectiveSugar/Example/Pods/Headers/ObjectiveSugar -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/DerivedSources/i386 -I/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/DerivedSources -F/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator -include /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/PrecompiledHeaders/Pods-ObjectiveSugar-prefix-fbehxvikzshezadcwuseekuhbnus/Pods-ObjectiveSugar-prefix.pch -MMD -MT dependencies -MF /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Objects-normal/i386/NSMutableArray+ObjectiveSugar.d --serialize-diagnostics /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Objects-normal/i386/NSMutableArray+ObjectiveSugar.dia -c /Users/musalj/code/OSS/ObjectiveSugar/Classes/NSMutableArray+ObjectiveSugar.m -o /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugar.build/Objects-normal/i386/NSMutableArray+ObjectiveSugar.o
)
SAMPLE_ANOTHER_COMPILE = %Q(
CompileC /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Objects-normal/i386/KWNull.o Classes/Core/KWNull.m normal i386 objective-c com.apple.compilers.llvm.clang.1_0.compiler
    cd /Users/musalj/code/OSS/Kiwi
    setenv LANG en_US.US-ASCII
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c -arch i386 -fmessage-length=178 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=c99 -fobjc-arc -Wno-trigraphs -fpascal-strings -O0 -Wno-missing-field-initializers -Wmissing-prototypes -Wno-implicit-atomic-properties -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wduplicate-method-match -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wshorten-64-to-32 -Wpointer-sign -Wnewline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -fexceptions -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -g -Wno-sign-conversion -fobjc-abi-version=2 -fobjc-legacy-dispatch -mios-simulator-version-min=5.0 -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Kiwi-generated-files.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Kiwi-own-target-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Kiwi-all-target-headers.hmap -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Kiwi-project-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Products/Debug-iphonesimulator/include -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include -I/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/DerivedSources/i386 -I/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/DerivedSources -Wall -F/Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Products/Debug-iphonesimulator -F/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk/Developer/Library/Frameworks -F/Applications/Xcode.app/Contents/Developer/Library/Frameworks -include /Users/musalj/code/OSS/Kiwi/Supporting\ Files/Kiwi-Prefix.pch -MMD -MT dependencies -MF /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Objects-normal/i386/KWNull.d --serialize-diagnostics /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Objects-normal/i386/KWNull.dia -c /Users/musalj/code/OSS/Kiwi/Classes/Core/KWNull.m -o /Users/musalj/Library/Developer/Xcode/DerivedData/Kiwi-guimpeiqlepzeaankpygesetdzsx/Build/Intermediates/Kiwi.build/Debug-iphonesimulator/Kiwi.build/Objects-normal/i386/KWNull.o
)
SAMPLE_PRECOMPILE = %Q(
ProcessPCH /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CocoaLumberjack-prefix-aklsecopvqdctoeroyamrkgktpei/Pods-CocoaLumberjack-prefix.pch.pch Pods-CocoaLumberjack-prefix.pch normal i386 objective-c com.apple.compilers.llvm.clang.1_0.compiler
    cd /Users/musalj/code/yammer/ios-chat/Pods
    setenv LANG en_US.US-ASCII
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/.rbenv/versions/2.0.0-p247/bin:/usr/local/Cellar/rbenv/0.4.0/libexec:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c-header -arch i386 -fmessage-length=178 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fmodules -fmodules-cache-path=/Users/musalj/Library/Developer/Xcode/DerivedData/ModuleCache -Wno-trigraphs -fpascal-strings -O0 -Wno-missing-field-initializers -Wno-missing-prototypes -Werror=return-type -Wno-implicit-atomic-properties -Werror=deprecated-objc-isa-usage -Werror=objc-root-class -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wshorten-64-to-32 -Wpointer-sign -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -DDEBUG=1 -DCOCOAPODS=1 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -fexceptions -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -g -Wno-sign-conversion -fobjc-abi-version=2 -fobjc-legacy-dispatch -mios-simulator-version-min=6.0 -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/Pods-CocoaLumberjack-generated-files.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/Pods-CocoaLumberjack-own-target-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/Pods-CocoaLumberjack-all-target-headers.hmap -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/Pods-CocoaLumberjack-project-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Products/Debug-iphonesimulator/include -I/Users/musalj/code/yammer/ios-chat/Pods/BuildHeaders -I/Users/musalj/code/yammer/ios-chat/Pods/BuildHeaders/CocoaLumberjack -I/Users/musalj/code/yammer/ios-chat/Pods/Headers -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/ABContactHelper -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/AFNetworking -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/CocoaLumberjack -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/CrittercismSDK -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/DTCoreText -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/DTFoundation -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/HPGrowingTextView -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/Kiwi -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MAKVONotificationCenter -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MAKVONotificationCenter/MAKVONotificationCenter -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MBSwitch -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MBSwitch/MBSwitch -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/Reachability -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/SBJson -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/SSKeychain -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/TITokenField -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamDrawReport -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamCore -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamData -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamSerf -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamUI -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKitTests -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/cometclient -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/DerivedSources/i386 -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CocoaLumberjack.build/DerivedSources -F/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Products/Debug-iphonesimulator -fobjc-arc -DOS_OBJECT_USE_OBJC=0 --serialize-diagnostics /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CocoaLumberjack-prefix-aklsecopvqdctoeroyamrkgktpei/Pods-CocoaLumberjack-prefix.pch.dia -MMD -MT dependencies -MF /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CocoaLumberjack-prefix-aklsecopvqdctoeroyamrkgktpei/Pods-CocoaLumberjack-prefix.pch.d -c /Users/musalj/code/yammer/ios-chat/Pods/Pods-CocoaLumberjack-prefix.pch -o /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CocoaLumberjack-prefix-aklsecopvqdctoeroyamrkgktpei/Pods-CocoaLumberjack-prefix.pch.pch    
)
SAMPLE_ANOTHER_PRECOMPILE = %Q(
ProcessPCH /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CrittercismSDK-prefix-ayqymsvxomizqsdqzftsirxxyful/Pods-CrittercismSDK-prefix.pch.pch Pods-CrittercismSDK-prefix.pch normal i386 objective-c com.apple.compilers.llvm.clang.1_0.compiler
    cd /Users/musalj/code/yammer/ios-chat/Pods
    setenv LANG en_US.US-ASCII
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/.rbenv/versions/2.0.0-p247/bin:/usr/local/Cellar/rbenv/0.4.0/libexec:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c-header -arch i386 -fmessage-length=178 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fmodules -fmodules-cache-path=/Users/musalj/Library/Developer/Xcode/DerivedData/ModuleCache -Wno-trigraphs -fpascal-strings -O0 -Wno-missing-field-initializers -Wno-missing-prototypes -Werror=return-type -Wno-implicit-atomic-properties -Werror=deprecated-objc-isa-usage -Werror=objc-root-class -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wshorten-64-to-32 -Wpointer-sign -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -DDEBUG=1 -DCOCOAPODS=1 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -fexceptions -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -g -Wno-sign-conversion -fobjc-abi-version=2 -fobjc-legacy-dispatch -mios-simulator-version-min=6.0 -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CrittercismSDK.build/Pods-CrittercismSDK-generated-files.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CrittercismSDK.build/Pods-CrittercismSDK-own-target-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CrittercismSDK.build/Pods-CrittercismSDK-all-target-headers.hmap -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CrittercismSDK.build/Pods-CrittercismSDK-project-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Products/Debug-iphonesimulator/include -I/Users/musalj/code/yammer/ios-chat/Pods/BuildHeaders -I/Users/musalj/code/yammer/ios-chat/Pods/BuildHeaders/CrittercismSDK -I/Users/musalj/code/yammer/ios-chat/Pods/Headers -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/ABContactHelper -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/AFNetworking -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/CocoaLumberjack -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/CrittercismSDK -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/DTCoreText -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/DTFoundation -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/HPGrowingTextView -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/Kiwi -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MAKVONotificationCenter -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MAKVONotificationCenter/MAKVONotificationCenter -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MBSwitch -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MBSwitch/MBSwitch -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/Reachability -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/SBJson -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/SSKeychain -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/TITokenField -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamDrawReport -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamCore -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamData -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamSerf -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamUI -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKitTests -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/cometclient -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CrittercismSDK.build/DerivedSources/i386 -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-CrittercismSDK.build/DerivedSources -F/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Products/Debug-iphonesimulator --serialize-diagnostics /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CrittercismSDK-prefix-ayqymsvxomizqsdqzftsirxxyful/Pods-CrittercismSDK-prefix.pch.dia -MMD -MT dependencies -MF /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CrittercismSDK-prefix-ayqymsvxomizqsdqzftsirxxyful/Pods-CrittercismSDK-prefix.pch.d -c /Users/musalj/code/yammer/ios-chat/Pods/Pods-CrittercismSDK-prefix.pch -o /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-CrittercismSDK-prefix-ayqymsvxomizqsdqzftsirxxyful/Pods-CrittercismSDK-prefix.pch.pch
)
SAMPLE_LIBTOOL = %Q(
Libtool /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/libPods-ObjectiveSugarTests-Kiwi.a normal i386
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example/Pods
    setenv IPHONEOS_DEPLOYMENT_TARGET 5.0
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool -static -arch_only i386 -syslibroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -L/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator -filelist /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-ObjectiveSugarTests-Kiwi.build/Objects-normal/i386/Pods-ObjectiveSugarTests-Kiwi.LinkFileList -framework Foundation -framework SenTestingKit -o /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/libPods-ObjectiveSugarTests-Kiwi.a
)
SAMPLE_CPRESOURCE = %Q(
CpResource ObjectiveSugar/Default-568h@2x.png /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/Default-568h@2x.png
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    builtin-copy -exclude .DS_Store -exclude CVS -exclude .svn -exclude .git -exclude .hg -resolve-src-symlinks /Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugar/Default-568h@2x.png /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app
)
SAMPLE_COPYSTRINGS = %Q(
CopyStringsFile /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/en.lproj/InfoPlist.strings ObjectiveSugar/en.lproj/InfoPlist.strings
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    builtin-copyStrings --validate --inputencoding utf-8 --outputencoding binary --outdir /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/en.lproj -- ObjectiveSugar/en.lproj/InfoPlist.strings
)
SAMPLE_PROCESS_INFOPLIST = 
%Q(ProcessInfoPlistFile build/Release/The\\ Spacer.app/Contents/Info.plist The\\ Spacer/The\\ Spacer-Info.plist
    cd "/Users/delisa/Code/Personal/The Spacer"
    builtin-infoPlistUtility /Users/delisa/Code/Personal/The\\ Spacer/The\\ Spacer/The\\ Spacer-Info.plist -genpkginfo /Users/delisa/Code/Personal/The\\ Spacer/build/Release/The\\ Spacer.app/Contents/PkgInfo -expandbuildsettings -platform macosx -additionalcontentfile /Users/delisa/Code/Personal/The\\ Spacer/build/The\\ Spacer.build/Release/The\\ Spacer.build/assetcatalog_generated_info.plist -o /Users/delisa/Code/Personal/The\\ Spacer/build/Release/The\\ Spacer.app/Contents/Info.plist
)
SAMPLE_LD = %Q(
Ld /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/ObjectiveSugar normal i386
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example
    setenv IPHONEOS_DEPLOYMENT_TARGET 4.3
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -arch i386 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -L/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator -F/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator -filelist /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects-normal/i386/ObjectiveSugar.LinkFileList -Xlinker -objc_abi_version -Xlinker 2 -ObjC -fobjc-arc -fobjc-link-runtime -Xlinker -no_implicit_dylibs -mios-simulator-version-min=4.3 -framework UIKit -framework Foundation -framework CoreGraphics -lPods -Xlinker -dependency_info -Xlinker /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Objects-normal/i386/ObjectiveSugar_dependency_info.dat -o /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/ObjectiveSugar
)
SAMPLE_DSYM = %Q(
GenerateDSYMFile /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugarTests.octest.dSYM /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugarTests.octest/ObjectiveSugarTests
    cd /Users/musalj/code/OSS/ObjectiveSugar/Example
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/dsymutil /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugarTests.octest/ObjectiveSugarTests -o /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugarTests.octest.dSYM
)
SAMPLE_RUN_SCRIPT = 
%Q(PhaseScriptExecution Check\\ Pods\\ Manifest.lock /Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Intermediates/ObjectiveSugar.build/Debug-iphonesimulator/ObjectiveSugar.build/Script-468DABF301EC4EC1A00CC4C2.sh
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
