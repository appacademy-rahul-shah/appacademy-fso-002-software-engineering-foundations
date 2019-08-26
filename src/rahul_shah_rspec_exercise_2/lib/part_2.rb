# frozen_string_literal: true

def palindrome?(str)
  (0...str.length).each do |i|
    return false if str[i] != str[-i - 1]
  end
  true
end

def substrings(str)
  array = []
  (0...str.length).each do |start_index|
    (start_index...str.length).each do |end_index|
      array << str[start_index..end_index]
    end
  end
  array
end

def palindrome_substrings(str)
  substrings(str).select { |el| palindrome?(el) && el.length > 1 }
end
