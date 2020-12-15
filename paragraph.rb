class Paragraph
  def paragraph_index
    paragragh_start_index = []
    paragragh_end_index = []
    (4...@all_lines.length-1).each do |i|
      if  /[a-zA-Z]/.match(@all_lines[i][0]) && @all_lines[i-1][0] == ''
        paragragh_start_index << i
      end
    end
    (4...@all_lines.length-1).each do |i|
      if  /[a-zA-Z]/.match(@all_lines[i][0]) && @all_lines[i+1][0] == ''
        paragragh_end_index << i
      end
    end
    [paragragh_start_index, paragragh_end_index ]
  end

  def make_paragraph

  end
end