require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  
  test 'credit account' do
    a = Account.first

    tc = a.transactions.count
    ab = a.balance
    a.credit(5)

    a.reload

    assert a.transactions.count == tc + 1
    assert a.balance == ab + 5
  end
 
  test 'debit account' do
    a = Account.first

    tc = a.transactions.count
    ab = a.balance
    a.debit(5)

    a.reload

    assert a.transactions.count == tc + 1
    assert a.balance == ab - 5
  end


end
