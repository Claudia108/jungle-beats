class Node
  attr_reader :data
  attr_accessor :link

  def initialize(data, link = nil)
    @data = data
    @link = link
  end
end
