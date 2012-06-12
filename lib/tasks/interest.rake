namespace :bank do

  task :interest => :environment do 

    accounts = Account.all 
    accounts.each do |account|
      account.apply_interest
    end

  end
end
