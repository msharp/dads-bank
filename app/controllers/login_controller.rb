class LoginController < ApplicationController

  def login
    render :login
  end

  def logout
    reset_session
    redirect_to :root
  end

  def authenticate
    un = request[:name]
    pw = request[:pass]
    if (acct = Account.authenticate(un,pw))
      session[:account] = acct.id
      redirect_to bank_account_path(acct.bank,acct) and return
    elsif (bank = Bank.find_by_name(un))
      session[:bank] = bank.id 
      redirect_to bank_accounts_path(bank) and return
    else
      flash[:error] = "Invalid login details"
      redirect_to :login
    end
  end


end
