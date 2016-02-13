require_relative 'node'
require 'pry'

class JungleBeat
  attr_reader :head

  def initialize(beats)
    array = beats.split
    @head = Node.new(array.first)
    array.shift
    array.each do |beat|
      append(beat)
    end
  end

  def play
    `say -r 100 -v Boing #{all}`
  end

  def append(beats)
    new_node = Node.new(beats)
    current_node = @head
    while current_node.link
      current_node = current_node.link
    end
    current_node.link = new_node
  end

  def include?(beats)
    current_node = @head
    while current_node.data != beats && current_node.link != nil
      current_node = current_node.link
    end
    current_node.data == beats ? true : false
  end

  def prepend(beats)
    new_node = Node.new(beats)
    new_node.link = @head
    @head = new_node
  end

  def insert(beats_index, beats)
    current_node = @head
    all_beats = [current_node.data]

    (beats_index - 1).times do
      all_beats << current_node.link.data
      current_node = current_node.link
    end
    previous_link = current_node.link
    current_node.link = Node.new(beats)
    current_node.link.link = previous_link
    all
  end

  def pop(beats_number)
    current_node = @head
    tail_index = count - (beats_number + 1)

    tail_index.times do
      current_node = current_node.link
    end
    current_node.link = nil
  end

  def find(beats_index, beats_number)
    current_node = @head
    beats_index.times do
      current_node = current_node.link
    end
    found_beats = []
    beats_number.times do
      found_beats << current_node.data
      current_node = current_node.link
    end
    found_beats.join(" ")
  end

  def collect
    current_node = @head
    found_beats = [current_node.data]

    until current_node.link == nil
      current_node = current_node.link
      found_beats << current_node.data
    end
    found_beats
  end

  def all
    collect.join(" ")
  end

  def count
    collect.count
  end
end
