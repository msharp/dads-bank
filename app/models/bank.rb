class Bank < ActiveRecord::Base
  include Login
  attr_accessible :interest_period, :interest_rate, :name, :hashed_password, :salt
  
  validates :interest_period, :inclusion => {:in => %w{weekly monthly yearly}}
  validates :interest_rate, :numericality => true
  validates_presence_of :hashed_password, :salt, :name

  has_many :accounts

  def daily_interest_rate
    case self.interest_period
    when 'weekly'
      self.interest_rate / (365.0 / 7.0)  
    when 'monthly'
      self.interest_rate / (365.0 / 12.0) 
    when 'yearly'
      self.interest_rate / 365.0 
    else
      raise "Interest period not valid"
    end
  end

  def interest_readable
    "#{interest_rate}% #{interest_period.capitalize}"
  end

  def self.authenticate(n,p)
    if ( bank = Bank.find_by_name(n) ) 
      if bank.hashed_password == Login.hash_password(p,bank.salt) 
        return bank 
      end
    end 
    nil
  end

end
