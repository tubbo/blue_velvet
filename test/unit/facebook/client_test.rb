require 'test_helper'

class Facebook::ClientTest < ActiveSupport::TestCase
  setup {
    VCR.use_cassette(:facebook) do
      @facebook = Facebook::Client.new
    end
  }

  test "retrieve page name" do
    assert_equal "The BlueVelvet Gem", @facebook.name
  end

  test "retrieve about text" do
    assert_match "BlueVelvet is a Rails engine", @facebook.about
  end

  test "have an access token" do
    VCR.use_cassette(:facebook) do
      refute_nil @facebook.send :access_token
    end
  end

  test "throws an error when an attribute can't be found" do
    assert_raises Facebook::AttributeNotFound do
      @facebook.not_a_real_attr
    end
  end

  test "throws an error when the page can't be found" do
    VCR.use_cassette(:facebook_bad_page) do
      assert_raises Facebook::PageNotFound do
        @facebook.page = nil
        @facebook.about
      end
    end
  end
end
