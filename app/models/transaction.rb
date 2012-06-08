class Transaction < ActiveRecord::Base
  attr_accessible :amount, :balance, :description
  belongs_to :account
end
