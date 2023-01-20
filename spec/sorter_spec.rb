require_relative '../lib/sorter'

describe Sorter do
  let(:sorter) { Sorter.new }
  let(:hash_of_words) { {'tests' => 1, 'example' => 2, 'amazing' => 3, 'some' => 4} }
  let(:sorted_hash) { {'some' => 4, 'amazing' => 3, 'example' => 2, 'tests' => 1 } }

  it 'returns a sorted hash by largest value in descending order' do
    expect(sorter.sort(hash_of_words)).to eq(sorted_hash)
  end

  it 'returns the first 100 elements in a hash' do
    hash = {}
    110.times { |n| hash[n] = rand(12) }
    expect(sorter.sort(hash).length).to eq(100)
  end

  it 'returns all elements in a hash if its smaller than 100 values' do
    hash = {}
    80.times { |n| hash[n] = rand(12) }
    expect(sorter.sort(hash).length).to eq(80)
  end
end