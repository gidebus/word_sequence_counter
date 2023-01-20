class Sorter
  def sort(word_count)
    word_count.sort_by { |_word, count| count }.reverse[0...100].to_h
  end
end