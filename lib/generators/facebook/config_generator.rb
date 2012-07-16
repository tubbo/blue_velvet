# Creates YAML configuration in +config/facebook.yml+ which helps you
# connect to the Facebook platform. Required inherently by Koala, which
# forms the backend of this gem.
class Facebook::ConfigGenerator < Rails::Generators::Base
  # Edit this file with your Facebook app details
  def create_yaml_file
    copy_file "config/facebook.yml", "#{Rails.root}/config/facebook/yml"
  end

  # Don't touch this file, all it does is read from YAML and instantiate
  # Koala.
  def create_initializer
    copy_file "config/initializers/koala.rb", "#{Rails.root}/config/initializers/koala.rb"
  end
end
