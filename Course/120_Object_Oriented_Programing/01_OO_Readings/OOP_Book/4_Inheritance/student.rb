# student.rb

class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

bob = Student.new('bob', 70)
joe = Student.new('joe', 50)

puts bob.better_grade_than?(joe)
puts joe.better_grade_than?(bob)
