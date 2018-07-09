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
  def format_create_universal_binary(path)                           end
  def format_cpresource(source, destination)                         end
  def format_ditto(path)                                             end
  def format_failing_test(suite, test, time, path)                   end
  def format_generate_dsym(dsym)                                     end
  def format_ld(path, build_variants, arch)                          end
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
  def format_process_entitlements(target)                            end
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
end #XCPretty
