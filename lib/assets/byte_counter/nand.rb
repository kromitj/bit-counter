require_relative "./npn"

class Nand
  attr_reader :input_a, :input_b, :output

  def initialize(input_a, input_b)
    @npn_a = NPN.new(input_a)
    @npn_b = NPN.new(input_b)     
    @output = circuit_state       
  end

  def update_state(input_a, input_b)
    @npn_a.update_state(input_a)
    @npn_b.update_state(input_b)
    @output = circuit_state  
  end

   def sendJSON
    {
      output: @output,
      base_a: @npn_a.sendJSON,
      base_b: @npn_b.sendJSON
    }
  end
  private
  def circuit_state
    if (@npn_a.state() == 1) && (@npn_b.state() == 1)
      0
    else
      1
    end
  end


end