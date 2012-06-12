class AddAllowanceToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :allowance, :decimal, :null => false, :default => 0.0
  end
end
