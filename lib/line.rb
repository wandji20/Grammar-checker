class Lines
  attr_accessor :all_lines
  attr_reader :work_data

  def initialize(lines_array)
    @punctuation = ['.', ',', ';', ':', '!', '?']
    @my_data = lines_array
    @all_lines = []
    make_lines
  end

  def make_lines
    @my_data.each do |line|
      @all_lines << [line]
    end
    @all_lines
  end

  def all_words
    total_word = 0
    @all_lines.each do |line|
      total_word += word_count(line) 
    end
    puts "Exceded maximum word limit #{total_word} words " if total_word > 30
  end

  def word_count(line)
    counts = 0
    line = StringScanner.new(line[0])
    until line.eos?
      scanned_section = line.scan_until(/\w+/)
      if scanned_section != nil      
        counts += 1 
      end
      
      line.terminate if scanned_section == nil
    end
    counts  
  end

  def doing_line_checks
    all_lines.each_with_index do |line, index|
      puts " checking line:#{index+1}"
      line = StringScanner.new(line[0])
      start_space_check(line, index)
      end_space_check(line, index)
      within_space_check(line, index)
      punctuation_check(line, index)
    end
  end

  def start_space_check(line, index)
    start_space_count = 0
    flag = true
    while flag
      item = line.getch
      start_space_count += 1 if item == ' '
      flag =false if item != ' '
    end
    puts "Line :#{index+1} Trailling white-space detected at start of line" if start_space_count > 0 
  end

  def end_space_check(line, index)
    end_space_count = 0
    line = StringScanner.new(line.string.reverse)
    flag = true
    while flag
      item = line.getch
      end_space_count += 1 if item == ' '
      flag =false if item != ' '
    end
    puts "Line :#{index+1} Trailling white-space detected at end of line" if end_space_count > 0 
  end

  def within_space_check(line, index)
    counts_array = []
    line = line.string.strip()
    line = StringScanner.new(line)
    until line.eos?
      counts = 0
      scanned_section = line.scan_until(/\w+/)
      if scanned_section != nil      
        scanned_section.each_char do |charat|
        counts += 1 if charat == ' '
        end
        counts_array << counts
      end
      
      line.terminate if scanned_section == nil
    end
  
    puts "Line :#{index+1} Trailling white-space detected within words" if counts_array.any?{ |spaces| spaces > 1}
  end

  def punctuation_check(line, index)
    until line.eos?
      current_item = line.getch
      line.peek(1)
      if @punctuation.include?(current_item) && line.peek(2) == '  '
        puts "Line :#{index+1} Trailling white-space detected after #{current_item} "
      end
    end


  end

end