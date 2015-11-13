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

    describe '.add' do

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

# The subtract method properly subtracts numbers, whether positive, negative, integer or float.
# The multiply method properly multiplies numbers
# The divide method properly divides numbers, raises an ArgumentError if the second argument is zero, returns an integer if there is no remainder and a float if there is.
# The pow method properly raises numbers to their power, including negative and decimal powers
# The sqrt method properly determines square roots for positive numbers, raises errors for negative inputs, returns integers for round roots or 2-digit decimals for non-round roots.
# The memory= function stores an object in memory, overwriting any previous object in memory See the Recipes for hints on testing readers/writers.
# The memory function returns the object in memory and clears memory when returned, and starts as nil.
# If the stringify input is passed to a new calculator, the outputs of each of the computational functions above is turned into a string.
    describe '.subtract' do

      it 'should subtract two positive integers' do
        expect(calculator.subtract(1,2)).to eq(-1)
      end

      it 'should subtract two negative integers' do
        expect(calculator.subtract(-1, -2)).to eq(1)
      end

      it 'should subtract a positive and a negative integer' do
        expect(calculator.subtract(1, -2)).to eq(3)
      end

      it 'should subtract two positive floats' do
        expect(calculator.subtract(1.3, 2.2)).to eq(0.9)
      end

      it 'should subtract a positive float and positive integer' do
        expect(calculator.subtract(1.0, 2)).to eq(-1.0)
      end

      it 'should subtract a positive float and negative integer' do
        expect(calculator.subtract(1.32, -2)).to eq(3.32)
      end

      it 'should subtract two negative floats' do
        expect(calculator.subtract(-13.6, -2.0)).to eq(-11.6)
      end
    end

    describe '.multiply' do

      it 'should multiply two numbers' do
        expect(calculator.multiply(2, 3)).to eq(6)
      end
    end

    describe '.divide' do

      it 'should divide two numbers giving decimal places' do
        expect(calculator.divide(2, 3)).to eq(2/3.0)
      end

      it 'should divide two numbers with no remainders to give integer results' do
        expect(calculator.divide(4, 2)).to eq(2)
      end
    end

    describe '.pow' do

      it 'should return one number to the power of another' do
        expect(calculator.pow(3, 3)).to eq(27)
      end

      it 'should return one number to the power of the result of another calculation' do
        expect(calculator.pow(27, 1/3.0)).to eq(3.0)
      end
    end

    describe '.sqrt' do

      it 'should return the square root of a number' do
        expect(calculator.sqrt(9)).to eq(3)
      end

      it 'should return a non-integer square root of a number' do
        expect(calculator.sqrt(8)).to eq(2.83)
      end
    end

    describe '.memory' do

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
    end
  end # context

  context 'stringified' do

    let(:calculator){Calculator.new(true)}

    describe '.add' do

      it 'should add two numbers and return value as a string' do
        expect(calculator.add(1, 2)).to eq('3')
      end
    end
  end # context

end
