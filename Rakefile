require "bundler/gem_tasks"

task :kick do
  sh 'kicker -r ruby'
end

task :spec do
  sh 'rspec spec --color --format nested'
end

task :cucumber do
  sh 'cucumber'
end

task :ci do
  Rake::Task[:spec].invoke
  Rake::Task[:cucumber].invoke
end

