# frozen_string_literal: true

# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if size.zero?

    max - min
  end

  def average
    return nil if size.zero?

    sum / size.to_f
  end

  def median
    return nil if size.zero?

    mid_index = size / 2.0
    sorted_array = sort

    return sorted_array[mid_index] if size.odd?

    (sorted_array[mid_index - 1] + sorted_array[mid_index]) / 2.0
  end

  def counts
    hash = Hash.new(0)
    each { |el| hash[el] += 1 }
    hash
  end

  def my_count(value)
    counts[value]
  end

  def my_index(value)
    each_with_index do |el, i|
      return i if el == value
    end
    nil
  end

  def my_uniq
    uniq_array = []
    each do |el|
      uniq_array << el unless uniq_array.include?(el)
    end
    uniq_array
  end

  def my_transpose
    transposed_array = Array.new(size) { [] }

    (0...size).each do |i|
      (0...self[i].size).each do |j|
        transposed_array[j][i] = self[i][j]
      end
    end
    transposed_array
  end
end
