#!/usr/bin/env ruby
require '../lib/working_data'
require '../lib/line'
require_relative '../lib/paragraph'

work_data = WorkData.new
work_data.arr
my_lines = Lines.new(work_data.arr)
my_para = Paragraph.new(work_data.arr, my_lines.my_paragraph_index)
my_lines.perform_line_checks
my_para.perform_paragraph_check