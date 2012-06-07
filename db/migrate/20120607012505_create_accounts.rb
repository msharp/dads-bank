class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, :null => false
      t.string :hashed_password, :null => false
      t.string :salt, :null => false

      t.references :bank
      t.timestamps
    end
  end
end
