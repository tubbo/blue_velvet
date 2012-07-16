module Facebook
  def self.config
    if Rails.env.staging?
      ActiveSupport::HashWithIndifferentAccess.new \
        app_id: ENV['FB_APP_ID'],
        secret_key: ENV['FB_SECRET_KEY'],
        page_id: ENV['FB_PAGE_ID']
    else
      ActiveSupport::HashWithIndifferentAccess.new \
        YAML.load_file(Rails.root.join("config/facebook.yml"))[Rails.env]
    end
  end
end

Koala::Facebook::OAuth.class_eval do
  def initialize_with_default_settings(*args)
    case args.size
      when 0, 1
        raise "application id and/or secret are not specified in the config" unless Facebook.config[:app_id].present? && Facebook.config[:secret_key].present?
        initialize_without_default_settings(Facebook.config[:app_id], Facebook.config[:secret], args.first)
      when 2, 3
        initialize_without_default_settings(*args)
    end
  end

  alias_method_chain :initialize, :default_settings
end
