namespace :bank do

  desc "Apply daily allowance credit to all accounts."
  task :allowance => :environment do 

    if Time.now.wday == 0 # only on sunday
      accounts = Account.all 
      accounts.each do |account|
        account.apply_allowance
      end
    else
      raise "Allowance can only be applied on Sunday"
    end

  end
end
