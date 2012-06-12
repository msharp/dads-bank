namespace :bank do
  task :allowance => :environment do 

    accounts = Account.all 
    accounts.each do |account|
      account.apply_allowance
    end

  end
end
