require_relative "./bit_adder"
require_relative "./xor"

class ByteAdder
  attr_reader :output, :math_problem
  def initialize(c_in, byte_a, byte_b)
    byte_b = ByteAdder.ones_compliment(byte_b) if c_in == 1
    @input_a = byte_a.dup
    @input_b = byte_b.dup
    @math_problem = self.set_math_problem(byte_a, byte_b, c_in)
    @c_in = c_in
    @output = []
    @bit0 = BitAdder.new(byte_a.pop, byte_b.pop, c_in)
    @output.unshift(@bit0.s_out)
    @bit1 = BitAdder.new(byte_a.pop, byte_b.pop, @bit0.c_out)
    @output.unshift(@bit1.s_out)
    @bit2 = BitAdder.new(byte_a.pop, byte_b.pop, @bit1.c_out)
    @output.unshift(@bit2.s_out)
    @bit3 = BitAdder.new(byte_a.pop, byte_b.pop, @bit2.c_out)
    @output.unshift(@bit3.s_out)
    @bit4 = BitAdder.new(byte_a.pop, byte_b.pop, @bit3.c_out)
    @output.unshift(@bit4.s_out)
    @bit5 = BitAdder.new(byte_a.pop, byte_b.pop, @bit4.c_out)
    @output.unshift(@bit5.s_out)
    @bit6 = BitAdder.new(byte_a.pop, byte_b.pop, @bit5.c_out)
    @output.unshift(@bit6.s_out)
    @bit7 = BitAdder.new(byte_a.pop, byte_b.pop, @bit6.c_out)
    @output.unshift(@bit7.s_out)
  end

  def update_state(c_in, byte_a, byte_b)
    byte_b = ByteAdder.ones_compliment(byte_b) if c_in == 1
    @output = []
    @bit0.update_state(byte_a.pop, byte_b.pop, c_in)
    @output.unshift(@bit0.s_out)
    @bit1.update_state(byte_a.pop, byte_b.pop, @bit0.c_out)
    @output.unshift(@bit1.s_out)
    @bit2.update_state(byte_a.pop, byte_b.pop, @bit1.c_out)
    @output.unshift(@bit2.s_out)
    @bit3.update_state(byte_a.pop, byte_b.pop, @bit2.c_out)
    @output.unshift(@bit3.s_out)
    @bit4.update_state(byte_a.pop, byte_b.pop, @bit3.c_out)
    @output.unshift(@bit4.s_out)
    @bit5.update_state(byte_a.pop, byte_b.pop, @bit4.c_out)
    @output.unshift(@bit5.s_out)
    @bit6.update_state(byte_a.pop, byte_b.pop, @bit5.c_out)
    @output.unshift(@bit6.s_out)
    @bit7.update_state(byte_a.pop, byte_b.pop, @bit6.c_out)
    @output.unshift(@bit7.s_out)
  end

  def base2_to_base10(binary_num)
    binary_num.join.to_i(2)
  end

  def set_math_problem(num1, num2, c_in)
    num1 = self.base2_to_base10(num1)
    num2 = self.base2_to_base10(num2)
    c_in == 1 ? operand = "-" : operand = "+"
    "#{num1} #{operand} #{num2}"
  end

  def self.ones_compliment(byte)
    # 0010 0011 => 1101 1100
    result = byte.map { |bit| Xor.new(bit, 1).output}
    return result
  end

  def sendJSON
    {
        input_a: @input_a,
        input_b: @input_b,
        c_in: @c_in,
        math_problem: @math_problem,
        output: @output,
        num_output: self.base2_to_base10(@output),
        bit0: @bit0.sendJSON,
        bit1: @bit1.sendJSON,
        bit2: @bit2.sendJSON,
        bit3: @bit3.sendJSON,
        bit4: @bit4.sendJSON,
        bit5: @bit5.sendJSON,
        bit6: @bit6.sendJSON,
        bit7: @bit7.sendJSON,
        bit_adder_imgs: self.get_bit_adder_array

    }
  end

  def get_bit_adder_array
    img_array = []
    img_array << self.base2_to_base10(@bit0.input)
    img_array << self.base2_to_base10(@bit1.input)
    img_array << self.base2_to_base10(@bit2.input)
    img_array << self.base2_to_base10(@bit3.input)
    img_array << self.base2_to_base10(@bit4.input)
    img_array << self.base2_to_base10(@bit5.input)
    img_array << self.base2_to_base10(@bit6.input)
    img_array << self.base2_to_base10(@bit7.input)
    return img_array
  end

end