#!/usr/bin/env ruby
require '../lib/working_data'
require '../lib/line_array'
require '../lib/line'
require '../lib/all_checks'

work_data = WorkData.new
lines_array = LineArray.new(work_data.arr)
all_lines = lines_array.all_lines
my_lines_and_index = Line.new(all_lines).my_lines_with_index
#p my_lines_and_index


check_line = CheckLine.new(my_lines_and_index)
check_line.doing_text_check
check_line.doing_line_checks