class Robot
  attr_reader :name
  @@names_used = []

  def initialize
    reset
  end

  def reset
    @name = nil
    loop do
      new_name = generate_name
      @name = new_name unless @@names_used.include?(new_name)
      break if @name
    end
    @@names_used << @name.dup
  end

  private

  def generate_name
    ("AA".."ZZ").to_a.sample + (100..999).to_a.sample.to_s
  end
end
