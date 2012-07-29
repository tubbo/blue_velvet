module Facebook
  # Generate views for the Facebook namespace.
  class ViewsGenerator < Rails::Generators::Base
    source_root File.expand_path('../../../../../app/views', __FILE__)

    def copy_views
      directory "facebook", "app/views/facebook"
    end
  end
end

