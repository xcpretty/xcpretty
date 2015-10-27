require "bundler/gem_tasks"
require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

task :kick do
  sh 'bundle exec kicker -r ruby'
end

Cucumber::Rake::Task.new(:cucumber) do |task|
end

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = %w(--color --format=doc)
end

RuboCop::RakeTask.new(:lint) do |task|
  task.fail_on_error = false
end

task :ci do
  Rake::Task[:spec].invoke
  Rake::Task[:cucumber].invoke
  Rake::Task[:lint].invoke
end
