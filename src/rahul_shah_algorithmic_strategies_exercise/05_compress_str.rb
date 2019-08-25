# frozen_string_literal: true

# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

# def compress_str(str)
#   compressed = []

#   str.each_char do |char|
#     if compressed[-1] == char
#       compressed[-2] += 1
#     else
#       compressed = [*compressed, 1, char]
#     end
#   end

#   compressed.inject('') do |acc, el|
#     if el == 1
#       acc.to_s
#     else
#       acc + el.to_s
#     end
#   end
# end

def compress_str(str)
  compressed = ''

  i = 0

  while i < str.length
    count = 0
    char = str[i]

    while char == str[i]
      count += 1
      i += 1
    end

    compressed += count > 1 ? count.to_s + char : char

  end

  compressed
end

p compress_str('aaabbc')        # => "3a2bc"
p compress_str('xxyyyyzz')      # => "2x4y2z"
p compress_str('qqqqq')         # => "5q"
p compress_str('mississippi')   # => "mi2si2si2pi"
