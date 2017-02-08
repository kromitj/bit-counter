require_relative "./nand"

class And
  attr_reader :input_a, :input_b, :output

  def initialize(input_a, input_b)
    @nand1 = Nand.new(input_a, input_b)
    @nand2 = Nand.new(@nand1.output, @nand1.output)
    @ouput = @nand2.output       
  end

  def sendJSON
    {
      output: @output,
      nand1: @nand1.sendJSON,
      nand2: @nand2.sendJSON
    }
  end
end