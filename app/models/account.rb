class Account < ActiveRecord::Base
  include Login
  attr_accessible :name, :hashed_password, :salt, :bank_id, :allowance

  belongs_to :bank
  has_many :transactions

  validates_presence_of :bank_id, :hashed_password, :salt, :name
  
  def balance 
    self.transactions.size > 0 && self.transactions.last.balance || 0.0
  end

  def apply_interest
    rate = self.bank.daily_interest_rate
    credit_amount = balance * (rate / 100) 
    credit(credit_amount,"Daily interest calculated at #{rate.to_f.round(4)}")
  end

  def apply_allowance
    a = self.allowance
    credit(a, "Allowance of #{a} applied")
  end

  def credit(amount, description = nil)
    transact(amount,description){ balance + amount }
  end

  def debit(amount, description = nil)
    transact(amount,description){ balance - amount }
  end

  def self.authenticate(n,p)
    if ( acc = Account.find_by_name(n) ) 
      return acc if acc.hashed_password == Login.hash_password(p,acc.salt) 
    end 
    nil
  end

  private

  def transact(amount, description, &block)
    new_balance = yield
    Transaction.create(
      :account_id => self.id,
      :amount => amount,
      :balance => new_balance,
      :description => description
    )
  end

end
