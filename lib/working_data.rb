require 'strscan'

class WorkData
  attr_accessor :arr, :result

  def initialize
    @arr = []
    @result = []
    @my_file = File.read('../user.txt')
    @working_file = StringScanner.new(@my_file)
    get_arr(@working_file)
  end

  def get_arr(working_file)

    until working_file.eos?
      @arr << working_file.getch
    end
    @arr = @arr.join('').split("\n")
  end
end

