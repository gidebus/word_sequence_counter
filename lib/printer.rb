class Printer
  def print(word_count)
    puts ''
    rank = 1
    word_count.each do |word, count|
      puts "#{rank}. #{word} - #{count}"
      rank += 1
    end
  end
end