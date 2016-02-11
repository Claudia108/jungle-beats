class Node
  # attr_reader :data
  # attr_accessor :link

  def initialize(data, link = nil)
    @data = data
    @link = link
  end

  def data
    @data
  end

  def link
    @link
  end

  def link=(new_link)
    @link = new_link
  end
end
