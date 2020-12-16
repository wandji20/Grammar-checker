#!/usr/bin/env ruby
require '../lib/working_data'
require '../lib/line'

work_data = WorkData.new
work_data.arr
my_lines = Lines.new(work_data.arr)

my_lines.perform_line_checks

my_para_index = my_lines.my_paragraph_index