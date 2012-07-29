module Facebook
  # Generate configuration for BlueVelvet and Koala.
  class ConfigGenerator < Rails::Generators::NamedBase
    desc "Copies Facebook/Koala configuration to your application"
    source_root File.expand_path('../templates', __FILE__)

    # Edit this file with your Facebook app details
    def copy_configuration
      copy_file "facebook.yml", "config/facebook.yml"
      copy_file "koala.rb",     "config/initializers/koala.rb"
    end
  end
end
