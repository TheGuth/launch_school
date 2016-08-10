

require 'pry'

class EmployeeManagementApplication
  def initialize
    @Employees = []
  end
end

module DelegateWork
  def delegate
    "I may delegate work"
  end
end

class Employee
  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
    @full_or_part_time = full_or_part_time
    @vacation_days = vacation_time
    @desk = work_space
  end

  def info
     puts "name: #{name}"
     puts "serial number: #{@serial_number}"
     puts "full or part time: #{@full_or_part_time}"
     puts "Vacation days: #{@vacation_days}"
     puts "Desk: #{@desk}"
     puts ""
  end
end

class Executive < Employee
  include DelegateWork

  def name
    "Exe #{@name}"
  end

  def full_or_part_time
    "Full Time"
  end

  def work_space
    "corner office"
  end

  def vacation_time
    20
  end
end

class Manager < Employee
  include DelegateWork

  def name
    "Mgr #{@name}"
  end

  def full_or_part_time
    "Full Time"
  end

  def work_space
    "regular private office"
  end

  def vacation_time
    14
  end
end

class RegularEmployee < Employee

  def name
    "#{@name}"
  end

  def full_or_part_time
    "Full Time"
  end

  def work_space
    "desk in cubicle farm"
  end

  def vacation_time
    10
  end
end

class PartTimeEmployee < Employee

  def name
    "#{@name}"
  end

  def full_or_part_time
    "Part Time"
  end

  def work_space
    "open workspace (no reserved desk)"
  end

  def vacation_time
    0
  end
end


bob = Executive.new('bob', 123)
tom = Manager.new('tom', 589)
jim = RegularEmployee.new('jim', 748)
tim = PartTimeEmployee.new('tim', 238)
p bob.name
bob.info
p tom.name
tom.info
p jim.name
jim.info
p tim.name
tim.info

p bob.delegate
p tom.delegate






















































