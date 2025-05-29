# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # adds a new node containing value to the end of the list
  def append(value)
    node = Node.new
    node.value = value

    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  # adds a new node containing the value to the beginning of the list
  def prepend(value)
    node = Node.new
    node.value = value

    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  # returns the total number of nodes of the list
  def size
    count = 0
    current = @head

    until current.nil?
      count += 1
      current = current.next_node
    end
    count
  end

  # returns the first node of the list
  attr_reader :head

  # returns the last node of the list
  attr_reader :tail

  # returns the node at the given index
  def at(index)
    current = @head
    count = 0

    while count < index
      current = current.next_node
      count += 1

    end
    current
  end

  # removes the last node from the list
  def pop
    if @head.nil?
      return nil
    elsif @head == @tail
      @head = nil
      @tail = nil
    end

    current = @head

    current = current.next_node until current.next_node.next_node.nil?

    @tail = current
    current.next_node = nil
  end

  # returns true if the passed in value is in the list and otherwise returns false
  def contains?(value)
    current = @head

    until current.nil?
      current = current.next_node
      return true if current.value == value
    end
    false
  end

  # returns the index of the node containing value, or nil if not found
  def find(value)
    return nil if @head.nil?

    index = 0
    current = @head

    until current.nil?
      return index if current.value == value

      current = current.next_node
      index += 1
    end

    nil
  end

  # represent your LinkedList objects as strings,
  # so you can print them out and preview them in the console.
  # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    current = @head
    string = ''

    until current.nil?
      string += "(#{current.value}) -> "
      current = current.next_node

    end

    string += 'nil'
    string
  end

  # that inserts a new node with the provided value at the given index
  def insert_at(value, index)
    return nil if index.negative? || index > size

    if index.zero?
      prepend(value)
    elsif index == size
      append(value)
    else
      previous_node = at(index - 1)

      node = Node.new
      node.value = value

      node.next_node = previous_node.next_node
      previous_node.next_node = node

    end
  end

  # that removes the node at the given index
  def remove_at(index)
    return nil if index.negative? || index >= size

    @head = @head.next_node if index.zero?

    previous_node = at(index - 1)
    node_to_remove = previous_node.next_node

    previous_node.next_node = previous_node.next_node.next_node
    @tail = previous_node if node_to_remove == @tail
  end
end
