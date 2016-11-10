

class And
  attr_reader :input_a, :input_b

   @@logicTable = [
      { inputA: 0, inputB: 0, output: 0},
      { inputA: 1, inputB: 0, output: 0},
      { inputA: 0, inputB: 1, output: 0},
      { inputA: 1, inputB: 1, output: 1}
    ]

  def initialize(input_a, input_b)   
    @input_a = input_a
    @input_b = input_b
    @output = self.output
  end

  defoutput
    @output = current_state
  end

  private
  def current_state
    out = @@logicTable.find do |row|
      (@input_a == row[:inputA]) && (@input_b == row[:inputB]) 
    end
    out[:output]
  end
end