require 'xcpretty/ansi'

module XCPretty
  class Formatter

    include ANSI
    
    EMPTY_STRING = ""
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

    def format_test_summary(executed_message)
      failures = format_failures(failures_per_suite)
      final_message = if colorize?
                        failures.empty? ? green(executed_message) : red(executed_message)
                      else
                        executed_message
                      end
      text = [failures, final_message].join("\n\n\n").strip
      "\n\n#{text}"
    end

    def format_failures(failures)
      failures.map do |suite, failures|
        formatted_failures = failures.map do |f|
          "  #{f[:test_case]}, #{f[:reason]}\n  #{f[:file]}"
        end.join("\n\n")

        "\n#{suite}\n#{formatted_failures}"
      end.join("\n")
    end

    #########################################################
    # PROTECTED / OVERRIDES
    #########################################################

    def format_analyze(file);                                  EMPTY_STRING; end
    def format_build_target(target, project, configuration);   EMPTY_STRING; end
    def format_check_dependencies;                             EMPTY_STRING; end
    def format_clean(project, target, configuration);          EMPTY_STRING; end
    def format_clean_target(target, project, configuration);   EMPTY_STRING; end
    def format_clean_remove;                                   EMPTY_STRING; end
    def format_compile(file);                                  EMPTY_STRING; end
    def format_compile_xib(file);                              EMPTY_STRING; end
    def format_copy_strings_file(file);                        EMPTY_STRING; end
    def format_cpresource(file);                               EMPTY_STRING; end
    def format_generate_dsym(dsym);                            EMPTY_STRING; end
    def format_linking(file);                                  EMPTY_STRING; end
    def format_passing_test(suite, test_case, time);           EMPTY_STRING; end
    def format_failing_test(suite, test_case, time, file);     EMPTY_STRING; end
    def format_process_pch(file);                              EMPTY_STRING; end
    def format_phase_script_execution(script_name);            EMPTY_STRING; end
    def format_process_info_plist(file);                       EMPTY_STRING; end
    def format_test_run_started(name);                         EMPTY_STRING; end
    def format_test_suite_started(name);                       EMPTY_STRING; end

    #########################################################

  end
end
