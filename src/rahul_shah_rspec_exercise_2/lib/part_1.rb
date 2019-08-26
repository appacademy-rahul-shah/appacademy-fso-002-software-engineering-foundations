# frozen_string_literal: true

def partition(arr, num)
  lower = []
  higher = []

  arr.each do |el|
    if el < num
      lower << el
    else
      higher << el
    end
  end

  [lower, higher]
end

def merge(hash_1, hash_2)
  merged = {}

  [hash_1, hash_2].each do |hash|
    hash.each do |k, v|
      merged[k] = v
    end
  end

  merged
end

def censor(sentence, curse_words)
  censored = []

  sentence.split(' ').each do |word|
    censored << if curse_words.include?(word.downcase)
                  word.gsub(/[aeiouAEIOU]/, '*')
                else
                  word
                end
  end

  censored.join(' ')
end

def power_of_two?(num)
  index = 0
  loop do
    if num == 2**index
      return true
    elsif 2**index > num
      return false
    else
      index += 1
    end
  end
end
