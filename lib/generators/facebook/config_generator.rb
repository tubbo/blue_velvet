YAML_BOILERPLATE = <<-YAML
# This is your Facebook configuration file. Put your Facebook app info in this file
# and it will be read by the Rails application. and BlueVelvet.

development:
  app_id:
  secret_key:
  page_id:

test:
  app_id:
  secret_key:
  page_id:

production:
  app_id:
  secret_key:
  page_id:
YAML

module Facebook
  class ConfigGenerator < Rails::Generators::Base
    def create_yaml_file
      create_file "config/facebook.yml", YAML_BOILERPLATE
    end

    def show_instructions
      puts "Go ahead and edit config/facebook.yml with your app OAuth details and page ID"
    end
  end
end
