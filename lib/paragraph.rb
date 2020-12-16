class Paragraph
  attr_reader :arr, :index_arr
  def initialize(arr, index_arr)
    @arr = arr
    @index_arr = index_arr
  end

  def perform_paragraph_check
    para_counts
    para_word_counts(@index_arr[0], @index_arr[1])
  end

  def para_counts
    puts "Line :#{@index_arr[1].last + 1} Exceeded maximum number of paragraphs '#{@index_arr[1].length}/4 ' " if @index_arr[0].length > 4
  end

  def para_word_counts(arr_index1, arr_index2)
    total_words = 0
    (0...arr_index1.length).each do |i|
      (arr_index1[i]..arr_index2[i]).each do |line_index| 
        line_word_counts(line_index)
        total_words += line_word_counts(line_index)
      end
    end
    puts "Maximum word size Exceeded: You made #{total_words} Words" if total_words > 100
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
end