# The interim between the Facebook page data and the end user, this defines the internal API
# used by the Rails app to call Facebook attributes as if they were controller actions.
class Facebook::PageController < ApplicationController
  # Much like method_missing, this method is called when ApplicationController can't find
  # the hard-coded action. For this controller specifically, it will be called on all routing
  # requests to +facebook/page+.
  #
  # This method retrieves any attribute from the Facebook page and displays it with a consistent
  # partial template. The template used is page_attribute, which creates a +<div class="facebook_attribute"
  # id="{whatever-facebook-attribute-you-used}>+ and renders it with the contents of the Facebook
  # attribute. Because this method makes use of a partial, it can be called in place of any other
  # +render+ or +redirect_to+ call, from any part of the application like so:
  # 
  #     class InfoController < ApplicationController
  #       def about
  #         render 'facebook/page#description'
  #       end
  #     end
  #
  # Or, you may route to the action:
  #
  #     get "/about" => "facebook/page#description"
  #
  # Note that using routes.rb is easier, but binds you to using CSS as the main method of
  # customization. You may override our styles if you simply create styles for
  # +.facebook_attribute+, and for individual pages the name of the attribute as an ID.
  def action_missing attribute_name
    if facebook.has_attribute? attribute_name
      attribute_content = facebook.send(:"#{attribute_name}").gsub(/\n/, "<br>")
      attribute = Facebook::Attribute.new \
        name: attribute_name.parameterize,
        title: attribute_name.titleize,
        body: attribute_content.html_safe
      render partial: 'page_attribute', locals: { attribute: attribute }
    else
      render partial: 'attribute_not_found', locals: { attribute_name: "#{attribute_name}" }
    end
  end

protected
  # Shorthand accessor for the omnipresent Facebook client
  def facebook
    @facebook_client ||= Facebook::Client.new
  end

private
  def use_layout
    if request.xhr?
      false
    else
      'application'
    end
  end
end
