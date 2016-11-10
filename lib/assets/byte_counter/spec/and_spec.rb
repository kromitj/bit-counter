require 'spec_helper'
 
describe And do
  describe "#initialize" do
    it "initializes as an And class" do
      expect(And.new(0,0).class).to eq(And)
    end 
    it "raises an ArgumentError if two inputs aren't given" do
      expect { And.new(0) }.to raise_error(ArgumentError)
    end
    it "sets @input_a to input_a arg" do
      and1 = And.new(0,1)
      expect(and1.input_a).to eq(0)
    end
    it "sets @input_b to input_b arg" do
      and1 = And.new(0,1)
      expect(and1.input_b).to eq(1)
    end
    it "sets @output to the return value of current_state method" do
      and1 = And.new(1,1)
      expect(and1.output).to eq(1)
    end
  end

  describe "#current_state" do
    it "compares input_a and input_b against the class var @@logicTable and returns the corresponding output field" do
      and1 = And.new(1,0)
      expect(and1.output).to eq(0)
    end
  end
end