require 'digest'
class Account < ActiveRecord::Base
  attr_accessible :name, :hashed_password, :salt, :bank_id

  belongs_to :bank
  has_many :transactions

  validates_presence_of :bank_id, :hashed_password, :salt, :name
  
  def balance 
    self.transactions.size > 0 && self.transactions.last.balance || 0.0
  end

  def apply_interest
    rate = self.bank.daily_interest_rate
    credit_amount = balance * (rate / 100) 
    credit(credit_amount,"Daily interest calculated at #{rate.to_s}")
  end

  def credit(amount, description = nil)
    t = Transaction.new
    t.account = self
    t.amount = amount
    t.balance = balance + amount
    t.description = description
    t.save
  end

  def debit(amount, description = nil)
    t = Transaction.new
    t.account = self
    t.amount = amount * -1
    t.balance = balance - amount
    t.description = description
    t.save
  end


end
