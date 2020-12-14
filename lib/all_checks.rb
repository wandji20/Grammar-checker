class CheckLine
  attr_reader :data

  def initialize(data)
    @punctuation = ['.', ',', ';', ':', '!', '?', '(', ')']
    @data = data
  end

  def doing_text_check
    total_word = 0
    @data.each do |line|
      total_word += word_count(line[0]) 
    end
    total_word
    puts "Exceded maximum word limit #{total_word} words "
  end

  def doing_line_checks
    (0...data.size).each do |i|
      #puts " check number #{i+1}"
      line = @data[i][0]
      start_space_check(line, i)
      end_space_check(line, i)
      within_space_check(line, i)
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
    # line.each_char do |charat|
    #   if charat == ' '
    #     counts += 1
    #   elsif charat != ' '
    #     counts_array << counts
    #     counts = 0
    #   end
    # end
    # p counts_array
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
     
      #current_item = line.getch
      #counts += 1 if current_item == ' '
      #counts_array << counts
      #line.pos = line.pos - 1 if current_item != ' '
     #if current_item == ' '
     #  counts += 1 
     #else
     #  counts = 0
     #end
    end
  
    puts "Line :#{index+1} Trailling white-space detected within words" if counts_array.any?{ |spaces| spaces > 1}
    # current_item = line.getch

    # if line.scan_until(/\w+/) != nil
    #   counts = 0
    #   current_item = line.getch
    #   counts += 1 if current_item == ' '  
    # end
    # counts_array << counts
    # line.terminate if line.scan_until(/\w+/).nil?
    # p counts_array
  end

  def word_count(line)
    counts = 0
    until line.eos?
      scanned_section = line.scan_until(/\w+/)
      if scanned_section != nil      
        counts += 1 
      end
      
      line.terminate if scanned_section == nil
    end
    counts  
  end


  
end