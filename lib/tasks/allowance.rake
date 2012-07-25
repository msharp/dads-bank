namespace :bank do

  desc "Apply daily allowance credit to all accounts."
  task :allowance => :environment do 

    accounts = Account.all 
    accounts.each do |account|
      account.apply_allowance
    end

  end
end
