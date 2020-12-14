require 'strscan'

class WorkData
  attr_accessor :arr
  def initialize
    @arr = []
    @my_file =  File.read('../user.txt')
    @working_file = StringScanner.new(@my_file)
  end

end