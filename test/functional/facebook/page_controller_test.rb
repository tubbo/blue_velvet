require 'test_helper'

class Facebook::PageControllerTest < ActionController::TestCase
  setup do
    VCR.use_cassette(:facebook_authentication) do
      @controller = Facebook::PageController.new 
    end
  end

  test "access the event listing" do
    VCR.use_cassette(:facebook_authentication) do
      get :events
      assert response.success?
    end
  end

  test "access the personnel profiles" do
    VCR.use_cassette(:facebook_authentication) do
      get :members
      assert response.success?
    end
  end
end
