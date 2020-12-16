class Lines
  attr_accessor :my_paragraph_index
  attr_reader :my_data

  def initialize(lines_array)
    @punctuation = ['.', ',', ';', ':', '!', '?']
    @my_data = lines_array
    @my_paragraph_index = nil
    paragraph_index
  end

  def paragraph_index
    paragragh_start_index = []
    paragragh_end_index = []
    (4...@my_data.length-1).each do |i|
      if  /[a-zA-Z]/.match(@my_data[i]) && @my_data[i-1] == ''
        paragragh_start_index << i
      end
    end
    (4...@my_data.length-1).each do |i|
      if  /[a-zA-Z]/.match(@my_data[i]) && @my_data[i+1] == ''
        paragragh_end_index << i
      end
    end
    @my_paragraph_index = [paragragh_start_index, paragragh_end_index ]
  end

  def perform_line_checks
    # @my_data.each_with_index do |line, index|
    #   line = StringScanner.new(line)
    #   puts "Performing checks on line: #{index+1} "
    #   start_space_check(line, index)
    #   end_space_check(line, index)
    #   within_space_check(line, index) 
    #   capital_i_check(line, index)
    #   punctuation_space_check(line, index) 
    #   capital_letter_check(line, index)
    # end
  end

  def start_space_check(line, index)
    if !@my_paragraph_index[0].include?(index) && index > 3
      counter = 0
      flag = true
      while flag
        item = line.getch
        counter += 1 if item == ' '
        flag = false if item != ' '
      end
      puts "Line :#{index + 1} Trailling white-space detected at start of line" if counter.positive?
    end
  end

  def end_space_check(line, index)
    end_space_count = 0
    current_line = StringScanner.new(line.string.reverse)
    flag = true
    while flag
      item = current_line.getch
      end_space_count += 1 if item == ' '
      flag = false if item != ' '
    end
    puts "Line :#{index + 1} Trailling white-space detected at end of line" if end_space_count.positive?
  end

  def within_space_check(line, index)
    current_line = line.string.strip
    current_line = StringScanner.new(current_line)
    until current_line.eos?
      current_item = current_line.getch
      puts "Line :#{index + 1} Trailling white-space detected within words" if current_item == ' ' && current_line.peek(1) == ' '
    end
  end

  def capital_i_check(line, index)
    current_line = StringScanner.new(line.string)
    until current_line.eos?
    scanned_word = current_line.scan_until(/\w+/)
    current_line.terminate if scanned_word == nil
      if scanned_word && scanned_word.strip == 'i'
        puts "Line :#{index + 1} Wrong capitalization of 'i' Use 'I' instead "   
      end
    end
  end

  def punctuation_space_check(line, index)
    current_line = StringScanner.new(line.string)
    until current_line.eos?
      current_item = current_line.getch

      if @punctuation.include?(current_item) 
        current_line.pos = current_line.pos - 2
        if  current_line.peek(1) == ' '
          puts "Line :#{index + 1} Trailling white-space detected before '#{current_item}' " 
        end
        current_line.pos = current_line.pos + 2
        if current_line.pos < line.string.length && current_line.peek(2) == '  '
          puts "Line :#{index + 1} Two white-spaces detected after '#{current_item}' instead of one " 
        end
        if @punctuation.include?(current_line.peek(1))
          puts "Line :#{index + 1} Wrong use of punctuation mark after '#{current_item}' "
        end
      end
    end
  end

  def capital_letter_check(line, index)
    current_line = StringScanner.new(line.string)
    until current_line.eos?
      current_item = current_line.getch     
      if ['.', '?', '!'].include?(current_item)    
        scanned_word = current_line.scan_until(/\w+/)
        current_line.terminate if scanned_word == nil
        if scanned_word && scanned_word.strip[0].upcase != scanned_word.strip[0]
          puts "Line :#{index + 1} Use  '#{scanned_word.strip[0].upcase}' insted of '#{scanned_word.strip[0]}' in word '#{scanned_word.strip}'" 
        end
      end
    end
  end




  # def all_words
  #   total_word = 0
  #   @all_lines.each do |line|
  #     total_word += word_count(line)
  #   end
  #   puts "Exceded maximum word limit #{total_word} words " if total_word > 30
  # end

  # def word_count(line)
  #   counts = 0
  #   line = StringScanner.new(line[0])
  #   until line.eos?
  #     scanned_section = line.scan_until(/\w+/)
  #     counts += 1 unless scanned_section.nil?

  #     line.terminate if scanned_section.nil?
  #   end
  #   counts
  # end










  # def top_empty_line(line1, line2)
  #   puts ' Missing Two empty lines at the top of Article' unless line1 == '' && line2 == ''
  # end

  # def bottom_text_check(line)
  #   puts 'Line  Trailing empty line at the End of Text' if line == ''
  # end

  # def heading_check(line)
  #   arr = line.split
  #   puts 'Line 3: Capitalize all header words' unless arr.all? { |word| word[0] == word[0].upcase }
  # end

  # def bottom_header_empty_line(line4)
  #   puts ' Missing empty lines at the Bottom of Article Title' unless line4 == ''
  # end

end
