class Garden
  attr_accessor :students

  def initialize
    @students = [ 'Alice', 'Bob', 'Charlie', 'David', 
                  'Eve', 'Fred', 'Ginny', 'Harriet',
                  'Ileana', 'Joseph', 'Kincaid', 'Larry' ]

    @diagram = diagram

  end

  def diagram
    puts "[window][window][window]"
    puts "........................"
    puts "........................"
    puts ""
  end







end