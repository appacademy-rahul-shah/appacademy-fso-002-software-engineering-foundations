# frozen_string_literal: true

def hipsterfy(str)
  (0...str.length).reverse_each do |i|
    if 'aeiou'.include?(str[i])
      str[i] = ''
      return str
    end
  end

  str
end

def vowel_counts(str)
  counts = Hash.new(0)

  str.downcase.each_char do |char|
    counts[char] += 1 if 'aeiou'.include?(char)
  end

  counts
end

def caesar_cipher(str, num)
  # arr = str.split('').map do |el|
  #   if el >= 'a' && el <= 'z'
  #     code = el.ord - 96
  #     shifted_code = (code + num) % 26
  #     (shifted_code + 96).chr
  #   else
  #     el
  #   end
  # end
  # arr.join('')
  shifted_str = ''
  alphabet = ('a'..'z').to_a

  str.each_char do |char|
    if alphabet.include?(char)
      index = alphabet.index(char)
      new_index = (index + num) % 26
      shifted_char = alphabet[new_index]
      shifted_str += shifted_char
    else
      shifted_str += char
    end
  end

  shifted_str
end
