require 'fileutils'

namespace :build do
  desc "Configure the dummy app with a dummy Facebook page."
  task :configuration do
    cp "config/facebook.yml", "test/dummy/config/facebook.yml"
  end
end

desc "Build and test blue_velvet on the CI server."
task :build => ['build:configuration', 'db:migrate', 'test']
