class AddProperColumnsToUsers < ActiveRecord::Migration
  def change
    rename_table(:users, :names)

    create_table :users do |t|
      t.string   "phone_number"
      t.string   "frequency"
      t.integer  "name_count"
    end
  end
end
