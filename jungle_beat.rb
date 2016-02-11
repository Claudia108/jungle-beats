require_relative 'node'
require 'pry'

class JungleBeat
  attr_reader :head

  def initialize(beats)
    array = beats.split
    @head = Node.new(array.shift)
    array.each do |sound|
      append(sound)
    end
  end

  def play
    `say -r 100 -v Boing #{all}`
  end

  def append(data)
    new_node = Node.new(data)
    current_node = @head
    while current_node.link
      current_node = current_node.link
    end
    current_node.link = new_node
  end

  def include?(sound)
    current_node = @head
    while current_node.data != sound && current_node.link != nil
      current_node = current_node.link
    end
    if current_node.data == sound
      return true
    else
      return false
    end
  end

  def prepend(sound)
    new_node = Node.new(sound)
    new_node.link = @head
    @head = new_node
  end

  def insert(start, element)
    current_node = @head
    all_beats = [current_node.data]

    (start - 1).times do
      all_beats << current_node.link.data
      current_node = current_node.link

    end
    previous_link = current_node.link
    current_node.link = Node.new(element)
    current_node.link.link = previous_link

    until current_node.link == nil
      current_node = current_node.link
      all_beats << current_node.data
    end
    all_beats.join(" ")
  end

  def pop(number)
    current_node = @head
    tail_index = count - (number + 1)

    tail_index.times do
      current_node = current_node.link
    end
    current_node.link = nil
  end

  def find(start, element)
    current_node = @head
    start.times do
      current_node = current_node.link
    end
    found = []
    element.times do
      found << current_node.data
      current_node = current_node.link
    end
    found.join(" ")
  end

  def all
    current_node = @head
    found = [current_node.data]

    until current_node.link == nil
      current_node = current_node.link
      found << current_node.data
    end
    found.join(" ")
  end

  def count
    current_node = @head
    found = [current_node]

    until current_node.link == nil
      current_node = current_node.link
      found << current_node.data
    end
    found.count
  end

end
