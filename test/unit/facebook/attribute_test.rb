class Facebook::AttributeTest < ActiveSupport::TestCase
  test "can be created" do
    attribute = Facebook::Attribute.new \
      name: 'foo',
      title: 'Foo',
      body: 'bar baz'
  end
end
