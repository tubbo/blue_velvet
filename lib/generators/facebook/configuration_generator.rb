module Facebook
  class ConfigurationGenerator < Rails::Generator
    def create_yaml_file
      File.new("#{Rails.root}/config/facebook.yml") do |file|
        file.puts <<-YAML
facebook:
  app_id:
  app_secret:
  page_id:
YAML
      end
    end

    def show_instructions
      puts "Go ahead and edit config/facebook.yml with your app OAuth details and page ID"
    end
  end
end
