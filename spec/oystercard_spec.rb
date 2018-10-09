require './lib/oystercard.rb'

describe Oystercard do
  it 'should have an initialisation balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'should allow us to top_up the card balance' do
    expect{ subject.top_up(10) }.to change{ subject.balance }.by 10
  end

  it 'should not allow us to have a balance of greater than 90' do
    maximum_balance = Oystercard::MAX_BALANCE
    expect{ subject.top_up(100) }.to raise_error "Max balance of #{ maximum_balance }."
  end

  it 'should deduct the fare from my card' do
  subject.top_up(10)
  expect{ subject.pay(5) }.to change{ subject.balance }.by -5
  end

end