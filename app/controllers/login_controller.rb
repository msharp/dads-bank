class LoginController < ApplicationController

  def login
    render :login
  end

  def logout
    reset_session
    redirect_to :root
  end

  def authenticate
    un,pw = request[:name],request[:password]
    if (acct = Account.authenticate(un,pw))
      session[:account] = acct
      redirect_to :account and return
    elsif (bank = Bank.authenticate(un,pw))
      session[:bank] = bank 
      redirect_to bank_accounts_path(bank) and return
    else
      flash[:error] = "Invalid login details"
      redirect_to :login
    end
  end


end
