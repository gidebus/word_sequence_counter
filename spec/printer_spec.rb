require_relative '../lib/printer'

describe Printer do
  let(:printer) { Printer.new }
  let(:word_count) {{'word' => 3, 'test' => 6}}

  context 'prints the correct format' do
    specify { expect { printer.print(word_count) }.to output(/word - 3/).to_stdout }
  end

  context 'does not print values that are not in hash' do
    specify { expect { printer.print(word_count) }.to_not output(/ipsum - 6/).to_stdout }
  end

  context 'prints added values' do
    let(:word_count) {{'word' => 3, 'test' => 6, 'ipsum' => 6}}
    specify { expect { printer.print(word_count) }.to output(/ipsum - 6/).to_stdout }
  end
end