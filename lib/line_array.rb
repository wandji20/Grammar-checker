class LineArray
  attr_accessor :all_lines
  attr_reader :work_data

  def initialize(lines_array)
    @my_data = lines_array
    @all_lines = []
    make_lines
  end

  def make_lines
    @my_data.each do |line|
      @all_lines << [line]
    end
    @all_lines
  end
end
