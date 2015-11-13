require_relative '../lib/calculator.rb'

describe Calculator do

  describe '#initialize' do

    let(:calculator){Calculator.new}

    it 'should give you a new calculator object' do
      expect(calculator).to be_a(Calculator)
    end

  end

  # describe '.add' do

  #   it 'should add two numbers' do
  #     expect()
  #   end
  # end
end
