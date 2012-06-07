class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name, :null => false
      t.decimal :interest_rate, :null => false
      t.string :interest_period, :null => false

      t.timestamps
    end
  end
end
