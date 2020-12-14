require 'strscan'

class WorkData
  attr_accessor :arr, :result

  def initialize
    @arr = []
    @result = []
    @my_file = File.read('../user.txt')
    @working_file = StringScanner.new(@my_file)
    get_arr(@working_file)
    new_line_remove
  end

  def get_arr(working_file)
    @arr << working_file.getch until working_file.eos?

    @arr = @arr.join('').gsub("\n", "here\n").split('here')
  end

  def new_line_remove
    @arr.map do |line|
      line.sub!("\n", '')
    end
  end
end
