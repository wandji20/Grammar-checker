require '../lib/working_data'
require '../lib/line'
require_relative '../lib/paragraph'
require 'strscan'

my_data = ['', '', 'I love  My Rspec ! Test, ', '', 'the blackloard', ' name', '', ' my name  is wandji', '', 'Microverse great community i think! '] 

describe Lines do
  my_lines = Lines.new(my_data)
  val1 = StringScanner.new(my_data[1])
  val2 = StringScanner.new(my_data[2])
  val4 = StringScanner.new(my_data[4])
  val5 = StringScanner.new(my_data[5])
  val9 = StringScanner.new(my_data[9])
  describe '#start_space_check' do
    it 'Returns true if there is a white space at start of a line' do
      expect(my_lines.start_space_check(val5, 5)).to eq true
    end
    it 'Returns false if there is no white space at start of paragragh line' do
      expect(my_lines.start_space_check(val4, 4)).to eq false
    end
  end
  describe '#new_line_capitalization' do
    it 'Returns true if there is line starting without a capital letter' do
      expect(my_lines.new_line_capitalization(val4, 4)). to eq true
    end
    it 'Returns false if line starts with capital letter' do
      expect(my_lines.new_line_capitalization(val2, 2)). to eq false
    end
  end
  describe '#within_space_check' do
    it 'Returns true if there extra spacing between words' do
      expect(my_lines.within_space_check(val2, 2)). to eq true
    end
    it 'Returns false if no extra space between words' do
      expect(my_lines.within_space_check(val5, 5)). to eq false
    end
  end
  describe "#end_space_check" do
    it 'return true if there is an empty space at the end of a line' do
      expect(my_lines.end_space_check(val2, 2)).to eq true
    end
    it 'return false if there is no empty space at the end of a line' do
      expect(my_lines.end_space_check(val4, 4)).to eq false
    end
  end
  describe "#capital_i_check" do
    it 'return true if there is the word i in a line' do
      expect(my_lines.capital_i_check(val9, 9)).to eq true
    end
    it 'return false if there is no word i in a line' do
      expect(my_lines.capital_i_check(val2, 2)).to eq false
    end
  end
end


describe Paragraph do
  my_data = ['', '', 'My Rspec  Test ', '', 'the blackloard', ' name', '', '  my name  is wandji', '', 'Microverse great community! '] 
  index1 = [[4, 7, 9], [5, 7, 9, 12] ]
  index2 = [[4, 7, 9, 11, 14], [5, 7, 9, 12, 20] ]
  my_para1 = Paragraph.new(my_data, index1)
  my_para2 = Paragraph.new(my_data, index2)
  describe "#para_counts" do
    it ' returns true if text exceeds 4 paragraphs' do
      expect(my_para2.para_counts).to eq true
    end
    it ' returns false if text does not exceed 4 paragraphs' do
      expect(my_para1.para_counts).to eq false
    end
  end
  describe "#para_start_space_check" do
    it 'returns true if the first line of a paragraph is missing a 2 space indentation' do
      expect(my_para1.para_start_space_check([4])).to eq true
    end
    it 'returns false if the first line of a paragraph hase a 2 space indentation' do
      expect(my_para1.para_start_space_check([7])).to eq false
    end
  end

end