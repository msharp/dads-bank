namespace :bank do
  
  desc "Create a new bank"
  task :create, [:name, :password] => :environment do |t, args|
    bank = Bank.new(
      :name => args[:name],
      :password => args[:password],
      :interest_rate => 5.0,
      :interest_period => 'monthly'
    )
    if bank.save
      puts "Created bank [#{bank.id}]"
    end
  end

  desc "Update the name and password for a bank"
  task :update, [:id, :name, :password] => :environment do |t, args|
    bank = Bank.find(:id)
    bank.name = args[:name]
    bank.password = args[:password]
    if bank.save
      puts "Updated bank [#{bank.id}]"
    end
  end

  desc "Update the interest pate and calculation period of a bank"
  task :update_rate, [:id, :rate, :period] => :environment do |t, args|
    bank = Bank.find(:id)
    bank.interest_rate = args[:rate]
    bank.interest_period = args[:period]
    if bank.save
      puts "Updated rate for bank [#{bank.id}]"
    end
  end

end
