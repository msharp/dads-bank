require 'digest'
class Account < ActiveRecord::Base
  attr_accessible :name, :hashed_password, :salt, :bank_id

  belongs_to :bank
  validates_presence_of :bank_id, :hashed_password, :salt, :name
  
  def balance 
    0.0
  end

end
