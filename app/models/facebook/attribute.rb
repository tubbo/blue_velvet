# Display a Facebook page attribute for use in the Rails view layer.
class Facebook::Attribute
  attr_accessor :name, :title, :body

  def initialize with_options={}
    with_options.each { |key,val| self.send :"#{key}=", val }
  end
end
