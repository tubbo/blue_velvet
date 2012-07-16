require 'test_helper'

class Facebook::PageControllerTest < ActionController::TestCase
  setup do
    VCR.use_cassette(:facebook_authentication) do
      @controller = Facebook::PageController.new 
    end
  end

  test "disallow access to attributes that don't exist" do
    VCR.use_cassette(:facebook_authentication) do
      get :events
      assert response.success?
      assert_select '#error'
    end
  end

  test "allow access and render a found attribute" do
    VCR.use_cassette(:facebook_authentication) do
      get :about
      assert response.success?
      assert_select '#about'
    end
  end
end
