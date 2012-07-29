
class AccountsController < ApplicationController

  before_filter :load_bank, :except => :show

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.find_all_by_bank_id(@bank.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    if (acc = session[:account])
      @account = Account.find(acc)
      @bank = Bank.find(@account.bank_id)
    elsif load_bank
      @account = Account.find(params[:id])
    else
      flash[:alert] = "Invalid account details"
      redirect_to :root and return
    end

    @chart_data = [["Time","Balance"]].concat(
      @account.transactions.map{|t| [t.created_at, t.balance.to_f.round(2)] }
    )

    respond_to do |format|
      format.html # show.html.erba
      format.json { render :json => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new(:bank_id => @bank.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new( 
      :name => params[:account][:name],
      :allowance => params[:account][:allowance],
      :password => params[:account][:password],
      :bank_id => @bank.id)

    respond_to do |format|
      if @account.save
        format.html { redirect_to bank_accounts_path(@bank), :notice => 'Account was successfully created.' }
        format.json { render :json => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.json { render :json => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])
    @account.name = params[:account][:name]
    @account.allowance = params[:account][:allowance]
    @account.password = params[:account][:password] unless params[:account][:password].length == 0
    
    respond_to do |format|
      if @account.save
        format.html { redirect_to bank_accounts_path(@bank), :notice => 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy 

    respond_to do |format|
      format.html { redirect_to bank_accounts_path(@bank) }
      format.json { head :no_content }
    end
  end

  private

  def load_bank
    if session[:bank].nil?
      flash[:error] = "Not logged in."
      redirect_to :login 
    else
      @bank = Bank.find(session[:bank])
    end
  end

end
