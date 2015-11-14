require_relative '../lib/calculator.rb'

describe Calculator do

  context 'non-stringified' do

    let(:calculator){Calculator.new}

    describe '#initialize' do

      it 'should give you a new calculator object' do
        expect(calculator).to be_a(Calculator)
      end

      it 'should default set memory to nil' do
        expect(calculator.memory).to eq(nil)
      end

      it 'should not allow access to stringify value' do
        expect do
          calculator.stringify
        end.to raise_error(NoMethodError)
      end

    end

    describe '#add' do

      it 'should add two positive integers' do
        expect(calculator.add(1, 2)).to eq(3)
      end

      it 'should add two negative integers' do
        expect(calculator.add(-1, -2)).to eq(-3)
      end

      it 'should add a positive and a negative integer' do
        expect(calculator.add(1, -2)).to eq(-1)
      end

      it 'should add two positive floats' do
        expect(calculator.add(1.3, 2.2)).to eq(3.5)
      end

      it 'should add a positive float and positive integer' do
        expect(calculator.add(1.0, 2)).to eq(3.0)
      end

      # TODO:  0.68 did not work
      it 'should add a positive float and negative integer' do
        expect(calculator.add(1.32, -2)).to eq(1.32 - 2)
      end

      it 'should add two negative floats' do
        expect(calculator.add(-13.6, -2.0)).to eq(-15.6)
      end
    end

    describe '#subtract' do

      it 'should subtract two positive integers' do
        expect(calculator.subtract(1,2)).to eq(-1)
      end

      it 'should subtract two negative integers' do
        expect(calculator.subtract(-1, -2)).to eq(1)
      end

      it 'should subtract a positive and a negative integer' do
        expect(calculator.subtract(1, -2)).to eq(3)
      end

      # TODO:  0.9 did not work
      it 'should subtract two positive floats' do
        expect(calculator.subtract(1.3, 2.2)).to eq(1.3 - 2.2)
      end

      it 'should subtract a positive float and positive integer' do
        expect(calculator.subtract(1.0, 2)).to eq(-1.0)
      end

      # TODO: 3.32 did not work
      it 'should subtract a positive float and negative integer' do
        expect(calculator.subtract(1.32, -2)).to eq(1.32 - (-2))
      end

      it 'should subtract two negative floats' do
        expect(calculator.subtract(-13.6, -2.0)).to eq(-11.6)
      end
    end

    describe '#multiply' do

      it 'should multiply two integers' do
        expect(calculator.multiply(2, 3)).to eq(6)
      end

      it 'should multiply two floats' do
        expect(calculator.multiply(2.0, 3.1)).to eq(6.2)
      end

      it 'should multiply two negative floats' do
        expect(calculator.multiply(-1.0, -2.0)).to eq(2.0)
      end

      it 'should multiply a positive float and negative integer' do
        expect(calculator.multiply(3.2, -2)).to eq(-6.4)
      end
    end

    describe '#divide' do

      it 'should raise argument error if second argument is zero' do
        expect do
          calculator.divide(2, 0)
        end.to raise_error(ArgumentError)
      end

      it 'should divide two numbers giving decimal if a remainder exists' do
        expect(calculator.divide(2, 3)).to eq(2/3.0)
      end

      it 'should divide two numbers giving an integer if no remainder exists' do
        expect(calculator.divide(4, 2)).to eq(2)
      end
    end

    describe '#pow' do

      it 'should return one number to the power of another' do
        expect(calculator.pow(3, 3)).to eq(27)
      end

      it 'should return one number to a decimal power' do
        expect(calculator.pow(27, 1/3.0)).to eq(3.0)
      end

      it 'should raise a number to a negative power' do
        expect(calculator.pow(3, -1)).to eq(1/3.0)
      end

      it 'should raise a number to the zeroth power' do
        expect(calculator.pow(3, 0)).to eq(1.0)
      end
    end

    describe '#sqrt' do

      it 'should raise an error for a negative input' do
        expect do
          calculator.sqrt(-1)
        end.to raise_error(ArgumentError)
      end

      it 'should return an integer of a round square root of a positive number' do
        expect(calculator.sqrt(9)).to eq(3)
      end

      it 'should return a 2-decimal square root for a non-round root' do
        expect(calculator.sqrt(8)).to eq(2.83)
      end
    end

    describe '#memory' do

      it 'should return the memory value when set' do
        expect(calculator.memory=(8)).to eq(8)
      end

      it 'should return the memory value when recalled once' do
        calculator.memory=(8)
        expect(calculator.memory).to eq(8)
      end

      it 'should return nil when memory recalled twice' do
        calculator.memory=(8)
        calculator.memory
        expect(calculator.memory).to eq(nil)
      end

      it 'should overwrite an existing object in memory' do
        calculator.memory=(8)
        calculator.memory=(9)
        expect(calculator.memory).to eq(9)
      end
    end
  end # context

  context 'stringified' do
# If the stringify input is passed to a new calculator, the outputs of each of the computational functions above is turned into a string.

    let(:calculator){Calculator.new(true)}

    describe '#add' do

      it 'should add two positive integers' do
        expect(calculator.add(1, 2)).to eq('3')
      end

      it 'should add two negative integers' do
        expect(calculator.add(-1, -2)).to eq('-3')
      end

      it 'should add a positive and a negative integer' do
        expect(calculator.add(1, -2)).to eq('-1')
      end

      it 'should add two positive floats' do
        expect(calculator.add(1.3, 2.2)).to eq('3.5')
      end

      it 'should add a positive float and positive integer' do
        expect(calculator.add(1.0, 2)).to eq('3.0')
      end

      # TODO:  0.68 did not work
      it 'should add a positive float and negative integer' do
        expect(calculator.add(1.32, -2)).to eq((1.32 - 2).to_s)
      end

      it 'should add two negative floats' do
        expect(calculator.add(-13.6, -2.0)).to eq('-15.6')
      end
    end

    describe '#subtract' do

      it 'should subtract two positive integers' do
        expect(calculator.subtract(1,2)).to eq('-1')
      end

      it 'should subtract two negative integers' do
        expect(calculator.subtract(-1, -2)).to eq('1')
      end

      it 'should subtract a positive and a negative integer' do
        expect(calculator.subtract(1, -2)).to eq('3')
      end

      # TODO:  0.9 did not work
      it 'should subtract two positive floats' do
        expect(calculator.subtract(1.3, 2.2)).to eq((1.3 - 2.2).to_s)
      end

      it 'should subtract a positive float and positive integer' do
        expect(calculator.subtract(1.0, 2)).to eq('-1.0')
      end

      # TODO: 3.32 did not work
      it 'should subtract a positive float and negative integer' do
        expect(calculator.subtract(1.32, -2)).to eq((1.32 - (-2)).to_s)
      end

      it 'should subtract two negative floats' do
        expect(calculator.subtract(-13.6, -2.0)).to eq('-11.6')
      end
    end

    describe '#multiply' do

      it 'should multiply two integers' do
        expect(calculator.multiply(2, 3)).to eq('6')
      end

      it 'should multiply two floats' do
        expect(calculator.multiply(2.0, 3.1)).to eq('6.2')
      end

      it 'should multiply two negative floats' do
        expect(calculator.multiply(-1.0, -2.0)).to eq('2.0')
      end

      it 'should multiply a positive float and negative integer' do
        expect(calculator.multiply(3.2, -2)).to eq('-6.4')
      end
    end

    describe '#divide' do

      it 'should raise argument error if second argument is zero' do
        expect do
          calculator.divide(2, 0)
        end.to raise_error(ArgumentError)
      end

      it 'should divide two numbers giving decimal if a remainder exists' do
        expect(calculator.divide(2, 3)).to eq((2/3.0).to_s)
      end

      it 'should divide two numbers giving an integer if no remainder exists' do
        expect(calculator.divide(4, 2)).to eq('2')
      end
    end

    describe '#pow' do

      it 'should return one number to the power of another' do
        expect(calculator.pow(3, 3)).to eq('27.0')
      end

      it 'should return one number to a decimal power' do
        expect(calculator.pow(27, 1/3.0)).to eq('3.0')
      end

      it 'should raise a number to a negative power' do
        expect(calculator.pow(3, -1)).to eq((1/3.0).to_s)
      end

      it 'should raise a number to the zeroth power' do
        expect(calculator.pow(3, 0)).to eq('1.0')
      end
    end

    describe '#sqrt' do

      it 'should raise an error for a negative input' do
        expect do
          calculator.sqrt(-1)
        end.to raise_error(ArgumentError)
      end

      it 'should return an integer of a round square root of a positive number' do
        expect(calculator.sqrt(9)).to eq('3')
      end

      it 'should return a 2-decimal square root for a non-round root' do
        expect(calculator.sqrt(8)).to eq('2.83')
      end
    end

    describe '#memory' do

      # it 'should return the memory value when set' do
      #   expect(calculator.memory=(8)).to eq('8')
      # end

      # it 'should return the memory value when recalled once' do
      #   calculator.memory=(8)
      #   expect(calculator.memory).to eq('8')
      # end

      it 'should return nil when memory recalled twice' do
        calculator.memory=(8)
        calculator.memory
        expect(calculator.memory).to eq(nil)
      end

      # it 'should overwrite an existing object in memory' do
      #   calculator.memory=(8)
      #   calculator.memory=(9)
      #   expect(calculator.memory).to eq('9')
      # end
    end
  end # context

end
