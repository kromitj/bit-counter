class NPN 
  attr_reader :base
  def initialize(base)
    self.base(base)
  end

  def base(state)
    if state == 1
      @base = 1
    else
     @base = 0
    end
  end

  def update_state(input)
    @base = input
  end

  def state
    @base
  end

  def sendJSON
    { base: @base}
  end
end