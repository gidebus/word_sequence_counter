class Counter
  def count(arr)
    j = 2
    i = 0
    word_count = {}

    while j < arr.length
      temp_word = arr[i..j].join(' ')
      word_count[temp_word] = 0 unless word_count[temp_word]
      word_count[temp_word] += 1
      j += 1
      i += 1
    end

    word_count
  end
end