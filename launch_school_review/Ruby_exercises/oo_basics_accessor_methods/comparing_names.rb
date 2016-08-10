# Using the following code, add the appropriate accessor methods. Keep in mind that
# @last_name shouldn't be visible outside the class.

class Person
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == last_name
  end
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?
# Expected output:

# false

