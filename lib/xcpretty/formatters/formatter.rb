# encoding: utf-8
require 'xcpretty/ansi'
require 'xcpretty/parser'

module XCPretty

  # Making a new formatter is easy.
  # Just make a subclass of Formatter, and override any of these methods.
  module FormatMethods
    def format_aggregate_target(target, project, configuration)        end
    def format_analyze(path)                                           end
    def format_analyze_target(target, project, configuration)          end
    def format_build_target(target, project, configuration)            end
    def format_check_dependencies()                                    end
    def format_clean(project, target, configuration)                   end
    def format_clean_remove()                                          end
    def format_clean_target(target, project, configuration)            end
    def format_code_signature_unchanged(path)                          end
    def format_codesign(path)                                          end
    def format_codesigning_swift_lib(path)                             end
    def format_compile(path)                                           end
    def format_compile_asset_catalog(path)                             end
    def format_compile_command(compiler_command, file_path)            end
    def format_compile_storyboard(path)                                end
    def format_compile_swift_sources()                                 end
    def format_compile_swift_with_module_optimization(paths)           end
    def format_compile_xib(path)                                       end
    def format_copy_header_file(source, destination)                   end
    def format_copy_png_file(source, destination)                      end
    def format_copy_plist_file(source, target)                         end
    def format_copy_strings_file(path)                                 end
    def format_copy_swift_libs(path)                                   end
    def format_create_product_structure()                              end
    def format_create_universal_binary()                               end
    def format_cpresource(source, destination)                         end
    def format_ditto(path)                                             end
    def format_failing_test(suite, test, time, path)                   end
    def format_generate_dsym(dsym)                                     end
    def format_libtool(library)                                        end
    def format_linking(path, build_variant, arch)                      end
    def format_link_storyboards()                                      end
    def format_measuring_test(suite, test, time)                       end
    def format_merge_swift_module(path)                                end
    def format_passing_test(suite, test, time)                         end
    def format_pbxcp(file)                                             end
    def format_pending_test(suite, test)                               end
    def format_phase_script_execution(script_name)                     end
    def format_phase_success(phase_name)                               end
    def format_preprocess(file)                                        end
    def format_probing_swift_lib(path)                                 end
    def format_process_info_plist(path)                                end
    def format_process_pch(file)                                       end
    def format_process_pch_command(path)                               end
    def format_set_mode(mode, path)                                    end
    def format_set_owner_and_group(owner_group, path)                  end
    def format_shell_command(command, arguments)                       end
    def format_strip(path)                                             end
    def format_symlink(from_path, to_path)                             end
    def format_swift_code_generation(path)                             end
    def format_test_run_finished(name, time)                           end
    def format_test_run_started(name)                                  end
    def format_test_suite_started(name)                                end
    def format_test_summary(message, failures_per_suite)               end
    def format_tiffutil(file)                                          end
    def format_touch(path)                                             end
    def format_write_auxiliary_files()                                 end
    def format_write_file(path)                                        end

    # COMPILER / LINKER ERRORS AND WARNINGS
    def format_compile_error(path, reason, line, cursor)               end
    def format_error(message)                                          end
    def format_file_missing_error(error, path)                         end
    def format_ld_warning(message)                                     end
    def format_undefined_symbols(message, symbol, reference)           end
    def format_duplicate_symbols(message, paths)                       end
    def format_warning(message)                              message;  end

    # TODO: see how we can unify format_error and format_compile_error,
    #       the same for warnings
    def format_compile_warning(path, reason, line, cursor)             end

    # Unrecognized lines, including user output
    def format_unknown(line)                                           end
  end

  class Formatter

    include ANSI
    include FormatMethods

    attr_reader :parser, :output

    def initialize(output=STDOUT, options={})
      @use_unicode = options[:use_unicode]
      @colorize = options[:colorize]
      @output = output
    end

    def finish
    end

    def use_unicode?
      !!@use_unicode
    end

    # Unrecognized lines, including user output
    def format_unknown(line)
      output.puts line
    end
    # Will be printed by default. Override with '' if you don't want summary
    def format_test_summary(executed_message, failures_per_suite)
      failures = format_failures(failures_per_suite)
      if failures.empty?
        final_message = green(executed_message)
      else
        final_message = red(executed_message)
      end

      text = [failures, final_message].join("\n\n\n").strip
      output.puts "\n\n#{text}"
    end

    ERROR = '❌ '
    ASCII_ERROR = '[x]'

    WARNING = '⚠️ '
    ASCII_WARNING = '[!]'

    def format_error(message)
      output.puts "\n#{red(error_symbol + " " + message)}\n\n"
    end

    def format_compile_error(file, file_path, reason, line, cursor)
      output.puts "\n#{red(error_symbol + " ")}#{file_path}: #{red(reason)}\n\n" \
        "#{line}\n#{cyan(cursor)}\n\n"
    end

    def format_file_missing_error(reason, file_path)
      output.puts "\n#{red(error_symbol + " " + reason)} #{file_path}\n\n"
    end

    def format_compile_warning(file, file_path, reason, line, cursor)
      output.puts "\n#{yellow(warning_symbol + ' ')}#{file_path}: #{yellow(reason)}\n\n" \
        "#{line}\n#{cyan(cursor)}\n\n"
    end

    def format_ld_warning(reason)
      output.puts "#{yellow(warning_symbol + ' ' + reason)}"
    end

    def format_undefined_symbols(message, symbol, reference)
      output.puts "\n#{red(error_symbol + " " + message)}\n" \
        "> Symbol: #{symbol}\n" \
        "> Referenced from: #{reference}\n\n"
    end

    def format_duplicate_symbols(message, file_paths)
      output.puts "\n#{red(error_symbol + " " + message)}\n" \
        "> #{file_paths.map { |path| path.split('/').last }.join("\n> ")}\n"
    end


    private

    def format_failures(failures_per_suite)
      failures_per_suite.map do |suite, failures|
        formatted_failures = failures.map do |failure|
          format_failure(failure)
        end.join("\n\n")

        "\n#{suite}\n#{formatted_failures}"
      end.join("\n")
    end

    def format_failure(f)
      snippet = Snippet.from_filepath(f[:file_path])

      failure = "  #{f[:test_case]}, #{red(f[:reason])}\n  " \
      "#{cyan(f[:file_path])}\n  ```\n"

      if @colorize
        failure += Syntax.highlight(snippet)
      else
        failure += snippet.contents
      end

      failure += "  ```"
      failure
    end

    def error_symbol
      use_unicode? ? ERROR : ASCII_ERROR
    end

    def warning_symbol
      use_unicode? ? WARNING : ASCII_WARNING
    end

  end
end

