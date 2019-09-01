# frozen_string_literal: true

class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  attr_reader :name
  attr_reader :slogan
  attr_reader :teachers
  attr_reader :students

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.size < @student_capacity
      @students << student
      return true
    end
    false
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.size / @teachers.size
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      return true
    end
    false
  end

  def num_grades(student)
    @grades[student].size
  end

  def average_grade(student)
    unless @grades[student].empty?
      return @grades[student].sum / @grades[student].size
    end

    nil
  end
end
