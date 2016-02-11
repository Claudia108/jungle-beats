gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'node'

class NodeTest < Minitest::Test

  def test_it_has_data
    node = Node.new("beep")
    assert_equal "beep", node.data
  end

  def test_it_has_a_link
    node = Node.new("bep", "bop")
    assert_equal "bop", node.link
  end

  def test_its_link_can_be_empty
    node = Node.new("bep")
    assert_equal nil, node.link
  end

end
