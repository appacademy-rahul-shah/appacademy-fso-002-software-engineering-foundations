# frozen_string_literal: true

class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }

    @size = n**2
  end

  attr_reader :size

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def num_ships
    # @grid.inject(0) { |count, row| count + row.count { |col| col == :S } }
    @grid.flatten.count { |el| el == :S }
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts 'You sunk my battleship!'
      true
    else
      self[position] = :X
      false
    end
  end

  def place_random_ships
    unplaced_ships = size / 4

    while unplaced_ships > 0
      position = [rand(@grid.size), rand(@grid[0].size)]
      unless self[position] == :S
        self[position] = :S
        unplaced_ships -= 1
      end
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |col|
        col == :S ? :N : col
      end
    end
  end

  def self.print_grid(grid)
    puts ''
    grid.each do |row|
      puts row.join(' ')
    end
    puts ''
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
