require '../lib/working_data'
require '../lib/line'
require_relative '../lib/paragraph'
require 'strscan'

my_data = ['', 'the blackloard', 'My Rspec  Test ', ' name', ' my name  is wandji', 'Microverse great community! ']

describe Lines do
  my_lines = Lines.new(my_data)
  val1 = StringScanner.new(my_data[0])
  val2 = StringScanner.new(my_data[1])
  val3 = StringScanner.new(my_data[2])
  val4 = StringScanner.new(my_data[3])
  val5 = StringScanner.new(my_data[5])
  describe '#start_space_check' do
    it 'Returns true if there is a white space at start of a line' do
      expect(my_lines.start_space_check(val4, 4)).to eq true
    end
    it 'Returns false if there is no white space at start of paragragh line' do
      expect(my_lines.start_space_check(val3, 3)).to eq false
    end
  end
  describe '#new_line_capitalization' do
    it 'Returns true if there is line starting without a capital letter' do
      expect(my_lines.new_line_capitalization(val2, 1)). to eq true
    end
    it 'Returns false if line starts with capital letter' do
      expect(my_lines.new_line_capitalization(val3, 1)). to eq false
    end
  end
  describe '#within_space_check' do
    it 'Returns true if there extra spacing between words' do
      expect(my_lines.within_space_check(val3, 1)). to eq true
    end
    it 'Returns false if no extra space between words' do
      expect(my_lines.within_space_check(val5, 5)). to eq false
    end
  end
end
