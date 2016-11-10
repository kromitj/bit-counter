require_relative "./nand"

class Xor
  attr_reader :output
  def initialize(input_a, input_b)
    @nand1 = Nand.new(input_a, input_b)
    @nand2 = Nand.new(input_a, @nand1.output)
    @nand3 = Nand.new(@nand1.output, input_b)
    @nand4 = Nand.new(@nand2.output, @nand3.output)
    @output = @nand4.output
    return @output
  end

  def update_state(input_a, input_b)
    @nand1.update_state(input_a, input_b)
    @nand2.update_state(input_a, @nand1.output)
    @nand3.update_state(@nand1.output, input_b)
    @nand4.update_state(@nand2.output, @nand3.output)
    @output = @nand4.output
    return @output
  end
end