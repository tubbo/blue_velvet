require 'fileutils'

desc "Configure the dummy app with a dummy Facebook page."
task :configure do
  cp "config/facebook.yml", "test/dummy/config/facebook.yml"
end
