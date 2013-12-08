require "xcpretty/printer"
require "xcpretty/printers/rspec"

module XCPretty

  module Printer

    describe RSpec do

      SAMPLE_TEST = <<-EOS
2013-12-07 19:53:01.881 ObjectiveSugar[32626:907] + 'Additions, -strip strips whitespaces and newlines from both ends' [PASSED]
EOS
      EXECUTED_TEXT = "Executed 4 tests, with 0 failures (0 unexpected) in 0.003 (0.004) seconds"


      it "prints dots in the same line" do
        STDOUT.should receive(:print)
        subject.pretty_print(SAMPLE_TEST)
      end

      it "prints dots for passing tests" do
        subject.pretty_format(SAMPLE_TEST).should == "."
      end

      it "prints F for failing tests" do
        subject.pretty_format(
<<-EOS
/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:30: error: -[NumberAdditions Iterators_uptoIteratesInclusively] : 'Iterators, -upto iterates inclusively' [FAILED], expected subject to equal 5, got 4
EOS
        ).should == "F"
      end

      def given_tests_are_done
        subject.pretty_format("Test Suite 'All tests' finished at 2013-12-08 04:26:49 +0000.")
      end
      
      def executed_tests_message
        subject.pretty_format(EXECUTED_TEXT)
      end

      it "knows when the test suite is done" do
        executed_tests_message.should == ""
      
        given_tests_are_done
        executed_tests_message.should == "\n\n#{EXECUTED_TEXT}"
      end

      it "prints out failures nicely" do
        subject.pretty_format(
"/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:49: error: -[NumberAdditions Iterators_TimesIteratesTheExactNumberOfTimes] : 'Iterators, times： iterates the exact number of times' [FAILED], expected subject to equal 4, got 5"
        )
        subject.pretty_format(
"/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:30: error: -[NumberAdditions Iterators_uptoIteratesInclusively] : 'Iterators, -upto iterates inclusively' [FAILED], expected subject to equal 8, got 4"
        )
        given_tests_are_done
        executed_tests_message.should include(
%Q(
Iterators, times： iterates the exact number of times, expected subject to equal 4, got 5
/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:49

Iterators, -upto iterates inclusively, expected subject to equal 8, got 4
/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:30


#{EXECUTED_TEXT})
        )
      end




      describe "doesn't output any compiling output" do

        it "compiling output" do
          subject.pretty_format(
<<-EOS
CompileC /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-DTFoundation.build/Objects-normal/i386/DTHTMLParser.o DTFoundation/Core/Source/DTHTMLParser/DTHTMLParser.m normal i386 objective-c com.apple.compilers.llvm.clang.1_0.compiler
    cd /Users/musalj/code/yammer/ios-chat/Pods
    setenv LANG en_US.US-ASCII
    setenv PATH "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/musalj/.rbenv/versions/2.0.0-p247/bin:/usr/local/Cellar/rbenv/0.4.0/libexec:/Users/musalj/code/go/bin:/Users/musalj/.rbenv/shims:/Users/musalj/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/bin:/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x objective-c -arch i386 -fmessage-length=178 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -fmodules -fmodules-cache-path=/Users/musalj/Library/Developer/Xcode/DerivedData/ModuleCache -Wno-trigraphs -fpascal-strings -O0 -Wno-missing-field-initializers -Wno-missing-prototypes -Werror=return-type -Wno-implicit-atomic-properties -Werror=deprecated-objc-isa-usage -Werror=objc-root-class -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wshorten-64-to-32 -Wpointer-sign -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -DDEBUG=1 -DCOCOAPODS=1 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk -fexceptions -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -g -Wno-sign-conversion -fobjc-abi-version=2 -fobjc-legacy-dispatch -mios-simulator-version-min=6.0 -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-DTFoundation.build/Pods-DTFoundation-generated-files.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-DTFoundation.build/Pods-DTFoundation-own-target-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-DTFoundation.build/Pods-DTFoundation-all-target-headers.hmap -iquote /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-DTFoundation.build/Pods-DTFoundation-project-headers.hmap -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Products/Debug-iphonesimulator/include -I/Users/musalj/code/yammer/ios-chat/Pods/BuildHeaders -I/Users/musalj/code/yammer/ios-chat/Pods/BuildHeaders/DTFoundation -I/Users/musalj/code/yammer/ios-chat/Pods/Headers -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/ABContactHelper -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/AFNetworking -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/CocoaLumberjack -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/CrittercismSDK -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/DTCoreText -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/DTFoundation -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/HPGrowingTextView -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/Kiwi -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MAKVONotificationCenter -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MAKVONotificationCenter/MAKVONotificationCenter -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MBSwitch -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/MBSwitch/MBSwitch -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/Reachability -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/SBJson -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/SSKeychain -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/TITokenField -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamDrawReport -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamCore -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamData -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamSerf -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKit/YamUI -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/YamKitTests -I/Users/musalj/code/yammer/ios-chat/Pods/Headers/cometclient -I/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk/usr/include/libxml2 -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-DTFoundation.build/DerivedSources/i386 -I/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-DTFoundation.build/DerivedSources -F/Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Products/Debug-iphonesimulator -fobjc-arc -DOS_OBJECT_USE_OBJC=0 -include /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/PrecompiledHeaders/Pods-DTFoundation-prefix-bakffbcvipwgglclplqvierkuzyi/Pods-DTFoundation-prefix.pch -MMD -MT dependencies -MF /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-DTFoundation.build/Objects-normal/i386/DTHTMLParser.d --serialize-diagnostics /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-DTFoundation.build/Objects-normal/i386/DTHTMLParser.dia -c /Users/musalj/code/yammer/ios-chat/Pods/DTFoundation/Core/Source/DTHTMLParser/DTHTMLParser.m -o /Users/musalj/Library/Developer/Xcode/DerivedData/YammerNow-gxwwuvyzqubnbfaesalfplrycxpe/Build/Intermediates/Pods.build/Debug-iphonesimulator/Pods-DTFoundation.build/Objects-normal/i386/DTHTMLParser.o
EOS
          ).should == ""
        end

        
        it "clean target/project/configuration with nested pods" do
          subject.pretty_format(
"=== CLEAN TARGET Pods-ObjectiveSugarTests-Kiwi OF PROJECT Pods WITH CONFIGURATION Debug ==="
          ).should == ""
        end
      end
    end
  end
end
