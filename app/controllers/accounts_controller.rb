
class AccountsController < ApplicationController

  before_filter :load_bank

  # GET /accounts
  # GET /accounts.json
  def index
    #@bank = Bank.find(params[:bank_id])
    @accounts = Account.find_all_by_bank_id(@bank.id)

     render 'index' #.html.erb
  # respond_to do |format|
  #   format.html # index.html.erb
  #   format.json { render json: @accounts }
  # end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
    @chart_data = [["Time","Balance"]].concat(@account.transactions.map{|t| [t.created_at, t.balance.to_f.round(2)]})

    respond_to do |format|
      format.html # show.html.erba
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
  # @bank = Bank.find(params[:bank_id])
    @account = Account.new(:bank_id => @bank.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  # @bank = Bank.find(@account.bank_id)
  end

  # POST /accounts
  # POST /accounts.json
  def create
    salt = generate_salt
    pass = hash_password(params[:account][:password], salt)
    opts = {
      :name => params[:account][:name],
      :salt => salt, 
      :hashed_password => pass,
      :bank_id => @bank.id
    }

    @account = Account.new(opts)

    respond_to do |format|
      if @account.save
        format.html { redirect_to bank_account_path(@account), notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    salt = generate_salt
    pass = hash_password(params[:account][:password], salt)
    opts = {
      :name => params[:account][:name],
      :salt => salt, 
      :hashed_password => pass
    }
    respond_to do |format|
      if @account.update_attributes(opts)
        format.html { redirect_to bank_account_path(@account), notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end

  private

  def load_bank
    @bank = Bank.find(params[:bank_id])
  end

  def generate_salt
    Digest::SHA1.hexdigest(rand(1000000).to_s)
  end

  def hash_password(p,s)
    Digest::SHA1.hexdigest(p+s)
  end

end
