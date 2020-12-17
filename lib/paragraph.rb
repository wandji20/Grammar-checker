class Paragraph
  attr_reader :arr, :index_arr

  def initialize(arr, index_arr)
    @arr = arr
    @index_arr = index_arr
  end

  def para_counts
    if @index_arr[0].length > 4
      puts "Line :#{@index_arr[1].last + 1} Exceeded maximum number of paragraphs '#{@index_arr[1].length}/4 '"
      true
    else
      false
    end
  end

  def para_word_counts(arr_index1, arr_index2)
    flag = false
    total_words = 0
    (0...arr_index1.length).each do |i|
      (arr_index1[i]..arr_index2[i]).each do |line_index|
        line_word_counts(line_index)
        total_words += line_word_counts(line_index)
      end
    end
    if total_words > 300
      puts "Maximum word size Exceeded: You made #{total_words} Words"
      flag = true
    end
    flag
  end

  def line_word_counts(line_index)
    line = StringScanner.new(@arr[line_index])
    counts = 0
    until line.eos?
      scanned_section = line.scan_until(/\w+/)
      counts += 1 if scanned_section
      line.terminate if scanned_section.nil?
    end
    counts
  end

  def para_line_space
    @index_arr[1].each do |line_index|
      if line_index > 3 && @arr[line_index + 1] == @arr[line_index + 2] && @arr[line_index + 1] == ''
        puts "Line: #{line_index + 2} Trailing Empty line at the end of paragraph'"
        true
      else
        false
      end
    end
  end

  def para_start_space_check(arr)
    flag = false
    arr.each do |line_index|
      line = StringScanner.new(@arr[line_index])
      if line.peek(2) != '  '
        puts "Line: #{line_index + 1} 2 space indentation missing at the start of paragraph"
        flag = true
      elsif line.peek(3) == '   '
        puts "Line: #{line_index + 1} Trailling white space detected at the start of paragraph"
        flag = true
      end
    end
    flag
  end
end
