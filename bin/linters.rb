#!/usr/bin/env ruby

require_relative '../lib/working_data'
require_relative '../lib/line'
require_relative '../lib/paragraph'

work_data = WorkData.new
my_data = work_data.arr
my_lines = Lines.new(my_data)
my_para_index = my_lines.my_paragraph_index
my_para = Paragraph.new(my_data, my_para_index)

def doing_checks(my_para, my_lines, my_data, my_para_index)
  total_size = my_data.length
  my_lines.top_empty_line(my_data[0], my_data[1])
  my_lines.heading_check(my_data[2])
  my_lines.bottom_header_empty_line(my_data[3])
  my_data.each_with_index do |line, index|
    line = StringScanner.new(line)
    my_lines.start_space_check(line, index)
    my_lines.end_space_check(line, index)
    my_lines.within_space_check(line, index)
    my_lines.capital_i_check(line, index)
    my_lines.capital_letter_check(line, index)
    my_lines.new_line_capitalization(line, index)
    my_lines.punctuation_space_check(line, index)
  end
  my_lines.bottom_text_check(my_data[total_size - 2], my_data[total_size - 1])
  my_para.para_counts
  my_para.para_word_counts(my_para_index[0], my_para_index[1])
  my_para.para_line_space
  my_para.para_start_space_check(my_para_index[0])
end
doing_checks(my_para, my_lines, my_data, my_para_index)
