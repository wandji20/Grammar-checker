# rubocop:disable Style/GuardClause,Style/Next,Metrics/CyclomaticComplexity,Layout/LineLength,Style/IfUnlessModifier,Metrics/PerceivedComplexity
class Lines
  attr_accessor :my_paragraph_index, :my_data

  def initialize(lines_array)
    @punctuation = ['.', ',', ';', ':', '!', '?']
    @my_data = lines_array
    @my_paragraph_index = paragraph_index(@my_data)
  end

  def paragraph_index(my_data)
    paragragh_start_index = []
    paragragh_end_index = []
    (4...my_data.length - 1).each do |i|
      if /[a-zA-Z]/.match(my_data[i]) && my_data[i - 1] == ''
        paragragh_start_index << i
      end
    end
    (4...my_data.length - 1).each do |i|
      if /[a-zA-Z]/.match(my_data[i]) && my_data[i + 1] == ''
        paragragh_end_index << i
      end
    end
    @my_paragraph_index = [paragragh_start_index, paragragh_end_index]
  end

  def start_space_check(line, index)
    if !@my_paragraph_index[0].include?(index) && index > 3 && line.peek(1) == ' '
      puts "Line :#{index + 1} Trailling white-space detected at start of line"
      true
    else
      false
    end
  end

  def end_space_check(line, index)
    current_line = StringScanner.new(line.string.reverse)
    puts "Line :#{index + 1} Trailling white-space detected at end of line" if current_line.peek(1) == ' '
  end

  def within_space_check(line, index)
    current_line = line.string.strip
    current_line = StringScanner.new(current_line)
    flag = false
    until current_line.eos?
      current_item = current_line.getch
      if current_item == ' ' && current_line.peek(1) == ' '
        puts "Line :#{index + 1} Trailling white-space detected within words"
        flag = true
      end
    end
    flag
  end

  def capital_i_check(line, index)
    current_line = StringScanner.new(line.string)
    until current_line.eos?
      scanned_word = current_line.scan_until(/\w+/)
      current_line.terminate if scanned_word.nil?
      if scanned_word && scanned_word.strip == 'i' && current_line.peek(1) == ' '
        puts "Line :#{index + 1} Wrong capitalization of 'i' Use 'I' instead "
        true
      end
      false
    end
  end

  def punctuation_space_check(line, index)
    current_line = StringScanner.new(line.string)
    until current_line.eos?
      current_item = current_line.getch
      if @punctuation.include?(current_item)
        current_line.pos = current_line.pos - 2
        if current_line.peek(1) == ' '
          puts "Line :#{index + 1} Trailling white-space detected before '#{current_item}' "
          current_line.pos = current_line.pos + 2
        elsif current_line.pos < line.string.length && current_line.peek(2) == '  '
          puts "Line :#{index + 1} Two white-spaces detected after '#{current_item}' instead of one "
        elsif @punctuation.include?(current_line.peek(1))
          puts "Line :#{index + 1} Wrong use of punctuation mark after '#{current_item}' "
        end
      end
      false
    end
  end

  def capital_letter_check(line, index)
    current_line = StringScanner.new(line.string)
    until current_line.eos?
      current_item = current_line.getch
      if ['.', '?', '!'].include?(current_item)
        scanned_word = current_line.scan_until(/\w+/)
        current_line.terminate if scanned_word.nil?
        if scanned_word && scanned_word.strip[0].upcase != scanned_word.strip[0]
          puts "Line :#{index + 1} Use  '#{scanned_word.strip[0].upcase}' insted of '#{scanned_word.strip[0]}' in word '#{scanned_word.strip}'"
          true
        end
        false
      end
    end
  end

  def new_line_capitalization(line, index)
    first_word = line.scan_until(/(\w+)/)
    if first_word
      first_word.strip[0]
      if first_word.strip[0].upcase != first_word.strip[0]
        puts "Line :#{index + 1} Use '#{first_word.strip[0].upcase}' insted of '#{first_word.strip[0]} at the start of a new line"
        true
      else
        false
      end
    end
  end

  def top_empty_line(line1, line2)
    puts ' Missing Two empty lines at the top of Article' unless line1 == '' && line2 == ''
  end

  def bottom_text_check(line1, line2)
    puts ' Missing empty line at the End of Text' if line2 != ''
    puts ' Trailing empty line at the End of Text' if line1 == '' && line2 == ''
  end

  def heading_check(line)
    arr = line.split
    line = StringScanner.new(line)
    puts 'Line 3: Capitalize all Header Words' unless arr.all? { |word| word[0] == word[0].upcase }
    puts 'Line 3: Ten space indentation missing at the start of Text Heading' if line.peek(10) != '          '
  end

  def bottom_header_empty_line(line4)
    puts ' Missing empty lines at the Bottom of Article Title' unless line4 == ''
  end
end
# rubocop:enable Style/GuardClause,Style/Next,Metrics/CyclomaticComplexity,Layout/LineLength,Style/IfUnlessModifier,Metrics/PerceivedComplexity
