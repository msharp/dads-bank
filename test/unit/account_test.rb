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

  test 'allowance' do
    a = Account.first

    ab = a.balance
    aa = a.allowance
    tc = a.transactions.count

    a.apply_allowance 
    a.reload

    assert a.transactions.count == tc + 1
    assert a.balance == ab + aa
  end

end
