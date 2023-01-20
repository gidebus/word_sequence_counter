require_relative '../lib/parser'

describe Parser do
  let(:parser) { Parser.new }
  let(:line) { "some-great testin'. A number here: 2. ALL CAPS!!!" }
  let(:expected) { ["some", "great", "testin'", "a", "number", "here", "all", "caps"] }

  it 'converts text into array' do
    expect(parser.parse(line).length).to eq(8)
  end

  it 'replaces every character but lower case letters and aphostrophes' do
    expect(parser.parse(line)).to eq(expected)
  end
end