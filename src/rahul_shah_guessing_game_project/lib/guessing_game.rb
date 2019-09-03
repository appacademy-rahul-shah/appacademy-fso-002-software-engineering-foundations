# frozen_string_literal: true

class GuessingGame
  def initialize(min, max)
    @min = min
    @max = max
    @secret_num = rand(@min..@max)
    @num_attempts = 0
    @game_over = false
  end

  attr_reader :num_attempts

  def game_over?
    @game_over
  end

  def check_num(num)
    @num_attempts += 1

    if num == @secret_num
      @game_over = true
      puts 'You win!'
    elsif num > @secret_num
      puts 'Too big.'
    else
      puts 'Too small.'
    end
  end

  def ask_user
    puts 'Enter a number:'
    num = gets.chomp.to_i
    check_num(num)
  end
end
