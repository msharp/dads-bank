class Bank < ActiveRecord::Base
  attr_accessible :interest_period, :interest_rate, :name
  
  validates :interest_period, :inclusion => {:in => %w{weekly monthly yearly}}

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

end
