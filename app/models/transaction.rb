class Transaction < ActiveRecord::Base
  attr_accessible :amount, :balance, :description, :account_id
  belongs_to :account
end
