# frozen_string_literal: true

def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(str, &prc)
  arr = []
  str.split(' ').each do |el|
    arr << prc.call(el)
  end
  arr.join(' ')
end

def greater_proc_value(num, prc_1, prc_2)
  [prc_1.call(num), prc_2.call(num)].max
end

def and_selector(arr, prc_1, prc_2)
  # arr.select(&prc_1).select(&prc_2)
  arr.select { |el| prc_1.call(el) && prc_2.call(el) }
end

def alternating_mapper(arr, prc_1, prc_2)
  arr.map.with_index do |el, i|
    if i.even?
      prc_1.call(el)
    else
      prc_2.call(el)
    end
  end
end
