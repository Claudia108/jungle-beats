gem 'minitest', '~> 5.2'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'jungle_beat'
require 'pry'


class JungleBeatTest < Minitest::Test
   def test_it_has_a_head
     list = JungleBeat.new("bleep")
     @head = list

     assert list.include?("bleep")
   end

   def test_it_can_add_new_nodes
     beats = JungleBeat.new("beep")
     beats.append("beep")

     assert beats.include?("beep")
   end

   def test_it_can_start_with_multiple_nodes
     beats = JungleBeat.new("beep boop bip")

     assert_equal 3, beats.count
   end

   def test_it_can_add_new_nodes_at_the_end
     beats = JungleBeat.new("beep")
     beats.append("bup")

     assert_equal "bup", beats.head.link.data
   end

   def test_it_can_add_new_nodes_to_the_front
     beats = JungleBeat.new("beep")
     beats.prepend("bup")

     assert_equal "bup", beats.head.data
   end

   def test_it_can_add_elements_at_a_certain_position
     beats = JungleBeat.new("beep")
     beats.append("boop")
     beats.append("bip")
     beats.append("la")
     inserted = beats.insert(2, "ku li")

     assert_equal "beep boop ku li bip la", inserted
   end

   def test_it_can_delete_nodes_at_the_end
     beats = JungleBeat.new("beep")
     beats.append("boop")
     beats.append("bip")
     beats.append("mi")
     beats.append("la")
     beats.pop(2)

     refute beats.include?("mi")
     refute beats.include?("la")
   end

   def test_it_can_find_nodes_in_the_list
     beats = JungleBeat.new("beep")
     beats.append("boop")
     beats.append("la")
     beats.append("lo")
     beats.append("te")
     beats.append("bip")
     found = beats.find(3, 2)

     assert_equal "lo te", found
   end

   def test_it_can_count_all_the_nodes_in_the_list
     beats = JungleBeat.new("beep")
     beats.append("boop")
     beats.append("la")
     beats.append("lo")
     number = beats.count

     assert_equal 4, number
   end

   def test_it_can_return_all_nodes
     beats = JungleBeat.new("beep")
     beats.append("boop")
     beats.append("la")
     beats.append("lo")
     list = beats.all

     assert_equal "beep boop la lo", list
   end
end
