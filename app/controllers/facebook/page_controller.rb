# Grabs attributes from the Facebook page and displays them. You may optionally define custom actions
# here which get multiple data sources.
class Facebook::PageController < ApplicationController
  # Gets any attribute from the Facebook page and displays it in the page_attribute template.
  def action_missing attribute_name
    if facebook.has_attribute? attribute_name
      attribute_content = facebook.send(:"#{attribute_name}").gsub(/\n/, "<br>")
      render partial: 'page_attribute', locals: {
        name: attribute_name.parameterize,
        title: attribute_name.titleize,
        body: attribute_content
      }
    else
      render partial: 'attribute_not_found', locals: { attribute_name: "#{attribute_name}" }
    end
  end

  protected

  # Shorthand accessor for the omnipresent Facebook client
  def facebook
    @facebook_client ||= Facebook::Client.new
  end

  def use_layout
    if request.xhr?
      false
    else
      'application'
    end
  end
end
