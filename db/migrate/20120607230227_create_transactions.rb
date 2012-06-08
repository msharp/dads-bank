class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description
      t.decimal :amount, :null => false
      t.decimal :balance, :null => false

      t.references :account
      t.timestamps
    end
  end
end
