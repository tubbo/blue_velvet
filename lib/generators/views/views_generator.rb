class ViewsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_page_views
    views_dir = File.join(__FILE__, 'app', 'views', 'facebook')
    Dir[views_dir].each do |view_file_path|
      view_file = File.basename view_file_path
      app_path = "#{Rails.root}/app/views/facebook/#{view_file}"
      copy_file view_file_path, app_path
    end
  end
end
