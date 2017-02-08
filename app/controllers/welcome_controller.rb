

class WelcomeController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index
    byte_counter = ByteAdder.new(0, [0,0,0,0,1,1,1,1], [0,0,0,0,1,1,1,1])
    puts byte_counter.sendJSON
    render 'index', locals: {byte_counter: byte_counter.sendJSON}
    # render :json => byte_counter.sendJSON
  end

  def create
    adderByte = []
    addeeByte = []
    adderByte << params["welcome"]["adderBit0"].to_i
    adderByte << params["welcome"]["adderBit1"].to_i
    adderByte << params["welcome"]["adderBit2"].to_i
    adderByte << params["welcome"]["adderBit3"].to_i
    adderByte << params["welcome"]["adderBit4"].to_i
    adderByte << params["welcome"]["adderBit5"].to_i
    adderByte << params["welcome"]["adderBit6"].to_i
    adderByte << params["welcome"]["adderBit7"].to_i

    addeeByte << params["welcome"]["addeeBit0"].to_i
    addeeByte << params["welcome"]["addeeBit1"].to_i
    addeeByte << params["welcome"]["addeeBit2"].to_i
    addeeByte << params["welcome"]["addeeBit3"].to_i
    addeeByte << params["welcome"]["addeeBit4"].to_i
    addeeByte << params["welcome"]["addeeBit5"].to_i
    addeeByte << params["welcome"]["addeeBit6"].to_i
    addeeByte << params["welcome"]["addeeBit7"].to_i
    
    byte_counter = ByteAdder.new(0, adderByte, addeeByte)
    puts byte_counter.sendJSON
    render :json => byte_counter.sendJSON
  end
end
