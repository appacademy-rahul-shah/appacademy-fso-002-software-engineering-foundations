# frozen_string_literal: true

require 'employee'

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.keys.include?(title)
  end

  def >(startup)
    return true if @funding > startup.funding

    false
  end

  def hire(name, title)
    raise 'Invalid title' unless valid_title?(title)

    @employees << Employee.new(name, title)
  end

  def size
    @employees.size
  end

  def pay_employee(employee)
    salary = salaries[employee.title]
    raise 'Insufficient funds' unless @funding > salary

    employee.pay(salary)
    @funding -= salary
  end

  def payday
    @employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    employees.inject(0) do |total_salary, employee|
      total_salary + @salaries[employee.title]
    end / employees.size.to_f
  end

  def close
    @funding = 0
    @employees = []
  end

  def acquire(startup)
    @funding += startup.funding
    @salaries.merge!(startup.salaries) { |_key, val1, _val2| val1 }
    @employees += startup.employees
    startup.close
  end
end
