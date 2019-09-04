# frozen_string_literal: true

class Room
  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  attr_reader :capacity
  attr_reader :occupants

  def full?
    return false if @occupants.size < @capacity

    true
  end

  def available_space
    @capacity - occupants.size
  end

  def add_occupant(person)
    unless full?
      @occupants << person
      return true
    end
    false
  end
end
