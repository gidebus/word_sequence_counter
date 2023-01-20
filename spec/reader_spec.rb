require_relative '../lib/reader'

describe Reader do
  let(:reader) { Reader.new }
  let(:path_to_txt) { '../support/sample.txt' }
  let(:expected) { ['hello', 'from', 'txt'] }

  # TODO: Implement way of mocking $stdin so ARGF can pick it up
  xit 'reads txt files' do
    allow($stdin).to receive(:gets).and_return(path_to_txt)
    expect(reader.read_files).to eq(expected)
  end
end