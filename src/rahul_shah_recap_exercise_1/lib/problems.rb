# frozen_string_literal: true

# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array.
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
  pairs = []
  vowels = 'aeiou'.split('')
  (0...words.length - 1).each do |i|
    (1...words.length).each do |j|
      pair = "#{words[i]} #{words[i + j]}"
      pairs << pair if vowels.all? { |vowel| pair.include?(vowel) }
    end
  end
  pairs
end

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
  (2...num).each do |i|
    return true if (num % i).zero?
  end
  false
end

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  #   found_bigrams = []
  #   (0...str.length - 1).each do |i|
  #     char_pair = str[i..i + 1]
  #     found_bigrams << char_pair if bigrams.include?(char_pair)
  #     found_bigrams.sort! { |a, b| bigrams.index(a) <=> bigrams.index(b) }
  #     # found_bigrams.sort_by! { |bigram| bigrams.index(bigram) }
  #   end
  #   found_bigrams
  bigrams.select { |bigram| str.include?(bigram) }
end

class Hash
  # Write a method, Hash#my_select, that takes in an optional proc argument
  # The method should return a new hash containing the key-value pairs that return
  # true when passed into the proc.
  # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
  #
  # Examples:
  #
  # hash_1 = {x: 7, y: 1, z: 8}
  # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
  #
  # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
  # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
  # hash_2.my_select                            # => {4=>4}
  def my_select(&prc)
    hash = {}
    # each do |k, v|
    #   hash[k] = v if (prc&.call(k, v)) || k == v && prc.nil?
    # end
    prc ||= proc { |k, v| k == v }
    each do |k, v|
      hash[k] = v if prc.call(k, v)
    end
    hash
  end
end

class String
  # Write a method, String#substrings, that takes in a optional length argument
  # The method should return an array of the substrings that have the given length.
  # If no length is given, return all substrings.
  #
  # Examples:
  #
  # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
  # "cats".substrings(2)  # => ["ca", "at", "ts"]
  def substrings(length = nil)
    substrings_array = []
    if length
      (0..self.length - length).each do |start_i|
        substrings_array << self[start_i...start_i + length]
      end
    else
      length = self.length
      (0...length).each do |start_i|
        (0...length).each do |end_i|
          substrings_array << self[start_i..start_i + end_i]
        end
        length -= 1
      end
    end

    substrings_array
  end

  # Write a method, String#caesar_cipher, that takes in an a number.
  # The method should return a new string where each char of the original string is shifted
  # the given number of times in the alphabet.
  #
  # Examples:
  #
  # "apple".caesar_cipher(1)    #=> "bqqmf"
  # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
  # "zebra".caesar_cipher(4)    #=> "difve"
  def caesar_cipher(num)
    alphabet = ('a'..'z').to_a
    new_string = ''
    each_char do |chr|
      new_string += alphabet[(alphabet.index(chr) + num) % 26]
    end
    new_string
  end
end
