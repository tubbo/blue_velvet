# Copies internal gem views for use in the main app. Any view files
# encountered in the app in the same location as those in the engine
# will override the default views, so this generator allows you to
# customize the display of your Facebook content.
class Facebook::ViewsGenerator < Rails::Generators::Base
  def copy_page_views
    views_dir = File.join(__FILE__, 'app', 'views', 'facebook')
    Dir[views_dir].each do |view_file_path|
      view_file = File.basename view_file_path
      app_path = "#{Rails.root}/app/views/facebook/#{view_file}"
      copy_file view_file_path, app_path
    end
  end
end
