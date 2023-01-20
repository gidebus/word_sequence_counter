require_relative '../lib/counter'

describe Counter do
  let(:counter) { Counter.new }
  let(:arr_of_words) {['some', 'example', 'words', 'some', 'example', 'words']}
  let(:expected) {{'some example words' => 2, 'example words some' => 1, 'words some example' => 1}}
  let(:empty_arr) {[]}

  it 'returns correct amount of combinations' do
    expect(counter.count(arr_of_words).length).to eq(3)
  end

  it 'returns a hash with the right count' do
    expect(counter.count(arr_of_words)).to eq(expected)
  end

  it 'return empty hash value if input is empty' do
    expect(counter.count(empty_arr)).to be_empty
  end
end