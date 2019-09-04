# frozen_string_literal: true

require_relative 'room'

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each do |room_name, room_capacity|
      @rooms[room_name] = Room.new(room_capacity)
    end
  end

  def name
    @name.split(' ').map(&:capitalize).join(' ') # word[0].upcase + word[1, word.size].downcase
  end

  attr_reader :rooms

  def room_exists?(room_name)
    @rooms.key?(room_name)
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
      if @rooms[room_name].add_occupant(person)
        puts 'check in successful'
      else
        puts 'sorry, room  is full'
      end
    else
      puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    # @rooms.each_value do |room|
    #   return true unless room.full?
    # end
    # false
    @rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    @rooms.each do |room_name, room|
      puts "#{room_name}: #{room.available_space}"
    end
  end
end
