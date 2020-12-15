#!/usr/bin/env ruby
require '../lib/working_data'
require '../lib/line'

work_data = WorkData.new
#p work_data.arr
all_lines = Lines.new(work_data.arr)
all_lines.all_words

all_lines.doing_line_checks


