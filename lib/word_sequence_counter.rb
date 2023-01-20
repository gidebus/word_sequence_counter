require_relative './printer'
require_relative './sorter'
require_relative './counter'
require_relative './parser'
require_relative './reader'

class WordSequenceCounter
  def initialize(
    reader = Reader.new,
    counter = Counter.new,
    sorter = Sorter.new,
    printer = Printer.new
  )
    @reader = reader
    @counter = counter
    @sorter = sorter
    @printer = printer
  end

  def count_text_sequences
    start = Time.now
    arr = @reader.read_files
    word_count = @counter.count(arr)
    word_count = @sorter.sort(word_count)
    @printer.print(word_count)
    ending = Time.now
    puts ''
    puts "Speed: #{ending - start} seconds"
  end
end
