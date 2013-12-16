require 'xcpretty/ansi'
require 'xcpretty/tokenizer'

module XCPretty

  module FormatMethods
    EMPTY_STRING = ''
    def format_analyze(file);                                EMPTY_STRING; end
    def format_build_target(target, project, configuration); EMPTY_STRING; end
    def format_check_dependencies;                           EMPTY_STRING; end
    def format_clean(project, target, configuration);        EMPTY_STRING; end
    def format_clean_target(target, project, configuration); EMPTY_STRING; end
    def format_clean_remove;                                 EMPTY_STRING; end
    def format_compile(file);                                EMPTY_STRING; end
    def format_compile_xib(file);                            EMPTY_STRING; end
    def format_copy_strings_file(file);                      EMPTY_STRING; end
    def format_cpresource(file);                             EMPTY_STRING; end
    def format_generate_dsym(dsym);                          EMPTY_STRING; end
    def format_linking(file, build_variant, arch);           EMPTY_STRING; end
    def format_libtool(library);                             EMPTY_STRING; end
    def format_passing_test(suite, test_case, time);         EMPTY_STRING; end
    def format_failing_test(suite, test_case, time, file);   EMPTY_STRING; end
    def format_process_pch(file);                            EMPTY_STRING; end
    def format_phase_script_execution(script_name);          EMPTY_STRING; end
    def format_process_info_plist(file);                     EMPTY_STRING; end
    def format_test_run_started(name);                       EMPTY_STRING; end
    def format_test_run_finished(name, time);                EMPTY_STRING; end
    def format_test_suite_started(name);                     EMPTY_STRING; end
    def format_test_summary(message, failures_per_suite);    EMPTY_STRING; end
  end

  class Formatter

    include ANSI
    include FormatMethods
    
    attr_reader :tokenizer

    def initialize(use_unicode, colorize)
      @use_unicode = use_unicode
      @colorize = colorize
      @tokenizer = Tokenizer.new(self)
    end

    def pretty_format(text)
      tokenizer.tokenize(text)
    end

    def use_unicode?
      !!@use_unicode
    end

    def optional_newline
      "\n"
    end

    def format_test_summary(executed_message, failures_per_suite)
      failures = format_failures(failures_per_suite)
      final_message = failures.empty? ? green(executed_message) : red(executed_message)
                      
      text = [failures, final_message].join("\n\n\n").strip
      "\n\n#{text}"
    end


    private

    def format_failures(failures)
      failures.map do |suite, failures|
        formatted_failures = failures.map do |f|
          "  #{f[:test_case]}, #{red(f[:reason])}\n  #{cyan(f[:file])}"
        end.join("\n\n")

        "\n#{suite}\n#{formatted_failures}"
      end.join("\n")
    end

  end
end
