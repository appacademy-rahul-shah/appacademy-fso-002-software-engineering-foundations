# frozen_string_literal: true

require_relative 'code'

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    puts "#{@secret_code.num_exact_matches(code)} exact matches"
    puts "#{@secret_code.num_near_matches(code)} near matches"
  end

  def ask_user_for_guess
    puts "Enter a code:"
    code = gets.chomp
    code = Code.from_string(code)
    print_matches(code)
    code == @secret_code
  end
end
