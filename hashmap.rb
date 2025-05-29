# frozen_string_literal: true

require_relative 'linkedlist'
require_relative 'node'

class HashMap
  def initialize
    @buckets = Array.new(16)
  end

  # takes a key and produces a hash code with it
  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  # takes two arguments, the first is a key and the second
  # is a value that is assigned to this key
  def set(key, value)
    hash_index = hash(key) % @buckets.length
    raise IndexError if hash_index.negative? || hash_index >= @buckets.length

    if @buckets[hash_index].nil?
      @buckets[hash_index] = LinkedList.new

    else
      current = @buckets[hash_index].head
      until current.nil?
        return current.value[1] = value if current.value[0] == key

        current = current.next_node
      end
    end
    @buckets[hash_index].append([key, value])
  end

  # takes one argument as a key and returns the value
  # that is assigned to this key. If key is not found, return nil
  def get(key)
    hash_index = hash(key) % @buckets.length
    raise IndexError if hash_index.negative? || hash_index >= @buckets.length

    return nil if @buckets[hash_index].nil?

    current = @buckets[hash_index].head

    until current.nil?
      return current.value[1] if current.value[0] == key

      current = current.next_node

    end
    nil
  end

  # takes a key as an argument and returns true or
  # false based on whether or not the key is in the hash map.
  def has?(key)
    hash_index = hash(key) % @buckets.length
    raise IndexError if hash_index.negative? || hash_index >= @buckets.length

    return false if @buckets[hash_index].nil?

    current = @buckets[hash_index].head

    until current.nil?
      return true if current.value[0] == key

      current = current.next_node
    end
    false
  end

  # takes a key as an argument. If the given key is in the hash map,
  # it should remove the entry with that key and return the deleted
  # entry’s value. If the key isn’t in the hash map, it should return nil.
  def remove(key)
    hash_index = hash(key) % @buckets.length
    raise IndexError if hash_index.negative? || hash_index >= @buckets.length

    return nil if @buckets[hash_index].nil?

    index = 0
    current = @buckets[hash_index].head

    until current.nil?
      if current.value[0] == key
        @buckets[hash_index].remove_at(index)
        return true
      else
        current = current.next_node
        index += 1
      end
    end

    'Key not found'
  end

  #  returns the number of stored keys in the hash map.
  def length
    length = 0
    @buckets.each do |item|
      length += item.size unless item.nil?
    end
    length
  end

  # removes all entries in the hash map
  def clear
    @buckets = Array.new(@buckets.length)
    'HashMap cleared'
  end

  # returns an array containing all the keys inside the hash map
  def keys
    keys_array = []

    @buckets.each do |bucket|
      next if bucket.nil?

      current = bucket.head
      until current.nil?
        keys_array.push(current.value[0])
        current = current.next_node
      end
    end

    keys_array
  end

  # returns an array containing all the values
  def values
    values_array = []

    @buckets.each do |bucket|
      next if bucket.nil?

      current = bucket.head
      until current.nil?
        values_array.push(current.value[1])
        current = current.next_node
      end
    end

    values_array
  end

  # returns an array that contains each key, value pair.
  # Example: [[first_key, first_value]
  def entries
    entries_array = []

    @buckets.each do |bucket|
      next if bucket.nil?

      current = bucket.head
      until current.nil?
        entries_array.push(current.value)
        current = current.next_node
      end
    end
    entries_array
  end
end
