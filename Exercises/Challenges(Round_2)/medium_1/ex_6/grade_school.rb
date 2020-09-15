class School
  def initialize
    @grades = {}
  end

  def add(name, grade)
    @grades[grade] || @grades[grade] = []
    @grades[grade] << name
  end

  def to_h
    sort!
    @grades.clone
  end

  def grade(n)
    @grades.fetch(n, [])
  end

  private

  def sort!
    @grades = @grades.sort.to_h
    @grades.each { |_, students| students.sort! }
    nil
  end
end

# school = School.new
# school.add('Aimee', 2)
# school.add('Jill', 1)
# p school.to_h
# p school.grade(3)
