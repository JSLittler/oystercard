class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 1

  attr_reader :balance, :status, :starting_station, :journey_history
  
  def initialize
    @balance = 0
    @status = false
    @journey = {}
    @journey_history = []
    @starting_station = nil
  end

  def top_up(value)
    fail "Max balance of #{ MAX_BALANCE }." unless(@balance + value) <= MAX_BALANCE
    @balance += value
  end

  def touch_in(name)
    fail "Balance below #{MIN_BALANCE}" if self.check_balance < MIN_BALANCE
    @status = true
    @starting_station = name
  end

  def touch_out(name)
    pay(MIN_CHARGE)
    @end_station = name
    @journey = { "starting_station" => @starting_station, "end_station" => @end_station }
    @status = false
    @starting_station = nil
    @end_station = nil
    @journey_history.push(@journey)
    @journey
  end

  def journey?
    true unless(@starting_station ? nil : false)
  end

  def check_balance
    @balance
  end

  private

  def pay(fare)
    @balance -= fare
  end

end

# class Station

#   def initialize(name)
#     @name = name
#   end

# end