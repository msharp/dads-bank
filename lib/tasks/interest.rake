namespace :bank do

  desc "Apply daily interest rate credit to all accounts"
  task :interest => :environment do 

    accounts = Account.all 
    accounts.each do |account|
      account.apply_interest
    end

  end
end
