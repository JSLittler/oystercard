require './lib/oystercard.rb'

describe Oystercard do

  it 'should have an initialisation balance of 0' do
    expect(subject.balance).to eq 0
  end
end

  
describe Oystercard do
  
  before(:each) { subject.top_up(10) }

  it 'should allow us to top_up the card balance' do
    expect{ subject.top_up(10) }.to change{ subject.balance }.by 10
  end

  it 'should not allow us to have a balance of greater than 90' do
    maximum_balance = Oystercard::MAX_BALANCE
    expect{ subject.top_up(100) }.to raise_error "Max balance of #{ maximum_balance }."
  end

  it 'should deduct the fare from my card' do
  expect{ subject.pay(5) }.to change{ subject.balance }.by -5
  end

  it 'should change status when touched in at start of journey' do
    expect{ subject.touch_in }.to change{ subject.status }.to eq true
  end

  it 'should change status when touched out at end of journey' do
    subject.touch_in
    expect{ subject.touch_out }.to change{ subject.status }.to eq false
  end

  it 'should report being in a journey or not' do
  expect(subject.journey?).to eq(true).or eq(false)
  end

  it "should raise an error if touching in with balance less than the minimum amount " do
    allow(subject).to receive(:check_balance) { 0 }
    minimum_balance = Oystercard::MIN_BALANCE
    expect{subject.touch_in}.to raise_error "Balance below #{minimum_balance}"
  end
end