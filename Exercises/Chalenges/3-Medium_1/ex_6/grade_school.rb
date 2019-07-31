class School
    def initialize
    @archive = Hash.new do |hash, grade|
                 hash[grade] = []
               end
  end

  def add(name, grade)
    @archive[grade] << name
    @archive[grade].sort!
    nil
  end

  def to_h
    archive.sort.to_h
  end

  def grade(number)
    archive[number]
  end

  private

  attr_reader :archive
end

# test_school = School.new
# test_school.add('Aimee', 2)
# p test_school.to_h
# p test_school.grade(5)
