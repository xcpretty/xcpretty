require "bundler/gem_tasks"

task :kick do
  sh 'kicker -r ruby'
end

task :spec do
  sh 'rspec spec --color --format=doc'
end

task :cucumber do
  sh 'cucumber'
end

task :install_tools do
  sh 'sudo pip install Pygments'
end

task :ci do
  Rake::Task[:install_tools].invoke
  Rake::Task[:spec].invoke
  Rake::Task[:cucumber].invoke
end

