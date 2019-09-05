# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Battleship
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  attr_reader :board, :player

  def start_game
    @board.place_random_ships
    puts "Number of ships: #{@board.num_ships}"
    puts @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts 'You lose.'
      return true
    end

    false
  end

  def win?
    if @board.num_ships.zero?
      puts 'You win!'
      return true
    end

    false
  end

  def game_over?
    return true if win? || lose?

    false
  end

  def turn
    move = player.get_move
    @remaining_misses -= 1 unless board.attack(move)
    puts "Number of remaining misses: #{@remaining_misses}"
    board.print
  end
end
