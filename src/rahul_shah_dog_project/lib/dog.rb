# frozen_string_literal: true

class Dog
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  attr_reader :name
  attr_reader :breed
  attr_reader :age
  attr_reader :favorite_foods

  attr_writer :age

  def bark
    if @age > 3
      @bark.upcase
    else
      @bark.downcase
    end
  end

  def favorite_food?(food)
    @favorite_foods.map(&:downcase).include?(food.downcase)
  end
end
