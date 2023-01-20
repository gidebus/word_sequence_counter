require_relative './parser'

class Reader
  def initialize(parser = Parser.new)
    @parser = parser
  end

  def read_files
    arr = []
    ARGF.each do |line|
      arr.concat(@parser.parse(line))
    end

    arr
  end
end