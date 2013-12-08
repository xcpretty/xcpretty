require "bundler/gem_tasks"

task :kick do
  sh 'kicker -r ruby'
end

task :spec do
  sh 'rspec spec'
end

task :ci do
  Rake::Task[:spec].invoke
end

