# frozen_string_literal: true

# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require 'byebug'

def largest_prime_factor(num)
  # (0..num).reverse_each do |i|
  #   return i if prime?(i) && (num % i).zero?
  # end
  num.downto(2) { |i| return i if prime?(i) && (num % i).zero? }
end

def prime?(num)
  false if num < 2

  # (2...num).each do |i|
  #   return false if (num % i).zero?
  # end

  # true
  (2...num).none? { |i| (num % i).zero? }
end

def unique_chars?(str)
  # str.split('').uniq.join('') == str.split.join('')
  seen_chars = []
  str.each_char do |char|
    return false if seen_chars.include?(char)

    seen_chars << char
  end
  true
end

def dupe_indices(arr)
  # hash = Hash.new([])
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each_with_index do |el, i|
    # hash[el] += [i]
    hash[el] << i
  end
  hash.select do |_k, v|
    v.length > 1
  end
end

def ana_array(arr_1, arr_2)
  # hash_1 = Hash.new(0)
  # hash_2 = Hash.new(0)

  # arr_1.each { |el| hash_1[el] += 1 }
  # arr_2.each { |el| hash_2[el] += 1 }

  # hash_1.each do |k, v|
  #   return false if hash_2[k] != v
  # end

  # hash_2.each do |k, v|
  #   return false if hash_1[k] != v
  # end

  # true
  count_elements(arr_1) == count_elements(arr_2)
end

def count_elements(arr)
  count = Hash.new(0)
  arr.each { |el| count[el] += 1 }
  count
end
