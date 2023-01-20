class Parser
  def parse(line)
    line.downcase
      .gsub(/[^a-z’']/, ' ')
      .split
  end
end