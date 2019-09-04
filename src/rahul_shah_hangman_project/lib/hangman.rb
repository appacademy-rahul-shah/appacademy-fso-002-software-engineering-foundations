# frozen_string_literal: true

class Hangman
  DICTIONARY = %w[cat dog bootcamp pizza]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.size, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word
  attr_reader :attempted_chars
  attr_reader :remaining_incorrect_guesses

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |c, i|
      indices << i if c == char
    end
    indices
  end

  def fill_indices(char, indices)
    indices.each do |index|
      @guess_word[index] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts 'That has already been attempted.'
      return false
    end

    @attempted_chars << char

    matching_indices = get_matching_indices(char)

    if matching_indices.empty?
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, matching_indices)
    end
    true
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join('') == @secret_word
      puts 'WIN'
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      puts "Word is: #{@secret_word}"
      return true
    end
    false
  end
end
