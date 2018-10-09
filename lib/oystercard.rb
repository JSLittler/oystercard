class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance
  
  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "Max balance of #{ MAX_BALANCE }." unless(@balance + value) <= MAX_BALANCE
    @balance += value
  end

  def pay(fare)
    @balance -= fare
  end

end