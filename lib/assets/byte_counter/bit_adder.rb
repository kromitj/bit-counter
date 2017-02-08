require_relative "./nand"

class BitAdder
  attr_reader :input, :s_out, :c_out
  def initialize(input_a, input_b, c_in)
    @nand1 = Nand.new(input_a, input_b)
    @nand2 = Nand.new(input_a, @nand1.output)
    @nand3 = Nand.new(@nand1.output, input_b)
    @nand4 = Nand.new(@nand2.output, @nand3.output)
    @nand5 = Nand.new(@nand4.output, c_in)
    @nand6 = Nand.new(@nand4.output, @nand5.output)
    @nand7 = Nand.new(@nand5.output, c_in)
    @nand8 = Nand.new(@nand6.output, @nand7.output)
    @nand9 = Nand.new(@nand5.output, @nand1.output)
    @s_out = @nand8.output
    @c_out = @nand9.output    
    @input = [c_in, input_b, input_a]
  end

  def update_state(input_a, input_b, c_in)
    @nand1.update_state(input_a, input_b)
    @nand2.update_state(input_a, @nand1.output)
    @nand3.update_state(@nand1.output, input_b)
    @nand4.update_state(@nand2.output, @nand3.output)
    @nand5.update_state(@nand4.output, c_in)
    @nand6.update_state(@nand4.output, @nand5.output)
    @nand7.update_state(@nand5.output, c_in)
    @nand8.update_state(@nand6.output, @nand7.output)
    @nand9.update_state(@nand5.output, @nand1.output)
    @s_out = @nand8.output
    @c_out = @nand9.output    
    @output = [@s_out, @c_out]
  end

  def sendJSON
    {
        input: @input,
        nand1: @nand1.sendJSON,
        nand2: @nand2.sendJSON,
        nand3: @nand3.sendJSON,
        nand4: @nand4.sendJSON,
        nand5: @nand5.sendJSON,
        nand6: @nand6.sendJSON,
        nand7: @nand7.sendJSON,
        nand8: @nand8.sendJSON,
        nand9: @nand9.sendJSON,
        s_out: @s_out,
        c_out: @c_out
    }
  end
end