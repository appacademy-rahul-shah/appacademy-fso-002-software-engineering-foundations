# frozen_string_literal: true

class Code
  POSSIBLE_PEGS = {
    'R' => :red,
    'G' => :green,
    'B' => :blue,
    'Y' => :yellow
  }.freeze

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end

  def initialize(chars)
    raise 'Invalid characters.' unless Code.valid_pegs?(chars)

    @pegs = chars.map(&:upcase)
  end

  attr_reader :pegs

  def self.random(length)
    chars = []
    length.times do
      chars << POSSIBLE_PEGS.keys.sample
    end
    Code.new(chars)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(''))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    matches = 0
    (0...code.length).each { |i| matches += 1 if code[i] == @pegs[i] }
    matches
  end

  def num_near_matches(code)
    matches = 0
    (0...code.length).each do |i|
      matches += 1 if @pegs.include?(code[i]) && code[i] != @pegs[i]
    end
    matches
  end

  def ==(code)
    # return false unless code.length == length
    # return true if num_exact_matches(code) == length

    # false

    @pegs == code.pegs
  end
end
