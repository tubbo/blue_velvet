# A client for the Facebook Graph API which looks for data on a specific Facebook page or profile. It
# reads from the YAML configuration stored in `config/facebook.yml` for the current Rails environment.
class Facebook::Client
  attr_reader :graph, :oauth
  attr_accessor :page

  # Connects to the open graph.
  def initialize options={}
    @oauth = Koala::Facebook::OAuth.new \
        Facebook.config[:app_id], Facebook.config[:secret_key]
    @graph = Koala::Facebook::API.new access_token
    @page = @graph.get_object(Facebook.config[:page_id])
  end

  def has_attribute? attribute
    @page["#{attribute}"].present?
  end

  # Gets any attribute from Facebook, as long as it's within the filter, and returns it.
  def method_missing attribute
    if @page.present?
      if self.has_attribute? attribute
        @page["#{attribute}"]
      else
        raise Facebook::AttributeNotFound
      end
    else
      raise Facebook::PageNotFound
    end
  end

  private

  def access_token
    @oauth.get_app_access_token
  end
end

module Facebook
  # Thrown when the Facebook page doesn't have the attribute requested.
  class AttributeNotFound < StandardError; end

  # Thrown when the Facebook page can't be found
  class PageNotFound < StandardError; end
end
