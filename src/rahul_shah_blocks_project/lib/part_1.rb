# frozen_string_literal: true

def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |el| el['age'] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count { |el| el.sum.positive? }
end

def aba_translate(str)
  new_str = ''
  vowels = 'aeiou'
  str.each_char do |char|
    new_str += if vowels.include?(char)
                 char + 'b' + char
               else
                 char
               end
  end
  new_str
end

def aba_array(arr)
  arr.map { |el| aba_translate(el) }
end
