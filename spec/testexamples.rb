require '../lib/line'
require 'strscan'

my_data = [" ", '', 'My Rspec Test','  name', '  my name is wandji' 'Microverse is a very great community! ']
my_lines = Lines.new(my_data)
val = StringScanner.new(my_data[1])
describe Lines do
  val = StringScanner.new(my_lines.my_data[0])
  describe "#start_space_check" do
    it "Returns true if there is a white space at start of paragragh line" do
      expect(my_lines.start_space_check(val, 4)).to eq true
    end
  end
end
p my_lines.start_space_check(val, 4)