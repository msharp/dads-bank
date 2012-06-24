class AddLoginToBank < ActiveRecord::Migration
  def change
    change_table :banks do |t|
      t.string :hashed_password, :null => false, :default => "539a93b92323ca497e9a00576d70c155f4d2d61c"
      t.string :salt, :null => false, :default => "611347a946294d749f0078e19cbc32febdc6311d"
    end
  end
end
