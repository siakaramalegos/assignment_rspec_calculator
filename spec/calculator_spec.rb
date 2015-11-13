require_relative '../lib/calculator.rb'

describe Calculator do

  let(:calculator){Calculator.new}

  describe '#initialize' do

    it 'should give you a new calculator object' do
      expect(calculator).to be_a(Calculator)
    end

  end

  describe '.add' do

    it 'should add two numbers' do
      expect(calculator.add(1, 2)).to eq(3)
    end
  end
end
