# Creates YAML configuration in +config/facebook.yml+ which helps you
# connect to the Facebook platform. Required inherently by Koala, which
# forms the backend of this gem.
class Facebook::ConfigGenerator < Rails::Generators::Base
  def create_yaml_file
    copy_file "config/facebook.yml", "#{Rails.root}/config/facebook/yml"
  end
end
