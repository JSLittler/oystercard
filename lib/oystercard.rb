class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance, :status
  
  def initialize
    @balance = 0
    @status = false
  end

  def top_up(value)
    fail "Max balance of #{ MAX_BALANCE }." unless(@balance + value) <= MAX_BALANCE
    @balance += value
  end

  def pay(fare)
    @balance -= fare
  end

  def touch_in
    fail "Balance below #{MIN_BALANCE}" if @balance < MIN_BALANCE
    @status = true
  end

  def touch_out
    @status = false
  end

  def journey?
    @status
  end




end