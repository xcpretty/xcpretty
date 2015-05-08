require "bundler/gem_tasks"
require 'rubocop/rake_task'

task :kick do
  sh 'kicker -r ruby'
end

task :spec do
  sh 'rspec spec --color --format=doc'
end

task :cucumber do
  sh 'cucumber'
end

RuboCop::RakeTask.new(:lint) do |task|
  task.fail_on_error = false
end

task :ci do
  Rake::Task[:spec].invoke
  Rake::Task[:cucumber].invoke
  Rake::Task[:lint].invoke
end

