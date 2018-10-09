class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 1

  attr_reader :balance, :status
  
  def initialize
    @balance = 0
    @status = false
  end

  def top_up(value)
    fail "Max balance of #{ MAX_BALANCE }." unless(@balance + value) <= MAX_BALANCE
    @balance += value
  end

  def touch_in
    fail "Balance below #{MIN_BALANCE}" if self.check_balance < MIN_BALANCE
    @status = true
  end

  def touch_out
    pay(MIN_CHARGE)
    @status = false
  end

  def journey?
    @status
  end

  def check_balance
    @balance
  end

  private

  def pay(fare)
    @balance -= fare
  end

end