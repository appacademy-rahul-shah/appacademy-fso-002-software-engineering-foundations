# frozen_string_literal: true

def average(num1, num2)
  (num1 + num2) / 2.0
end

def average_array(arr)
  arr.sum / arr.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + '!'
end

def alternating_case(str)
  str.split(' ').map.with_index do |el, i|
    if i.even?
      el.upcase
    else
      el.downcase
    end
  end.join(' ')
end
