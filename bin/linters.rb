#!/usr/bin/env ruby
require '../lib/working_data'
require '../lib/line_array'
require '../lib/line'

work_data = WorkData.new
lines_array = LineArray.new(work_data.arr)
all_lines = lines_array.all_lines
p my_lines_and_index = Line.new(all_lines).my_lines_with_index
