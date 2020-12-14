#!/usr/bin/env ruby
require '../lib/working_data'
require '../lib/line_array'

work_data = WorkData.new
lines_array = LineArray.new(work_data.arr)
all_lines = lines_array.all_lines
p all_lines

