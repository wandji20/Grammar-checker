class Line
  attr_reader :my_lines_with_index

  def initialize(my_lines)
    @my_lines_with_index = []
    @my_lines = my_lines
    line_index_maker
  end

  def line_index_maker
    @my_lines.each_with_index do |line, index|
      line << index + 1
      @my_lines_with_index << line
    end
    @my_lines_with_index
  end
end
