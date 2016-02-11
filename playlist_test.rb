gem 'minitest, ~> 5.2'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'list.rb'

class PlaylistTest < Minitest::Test
  # has a name
  # can play the beats
  # can change the play_rate
  # can change the play_voice
end
