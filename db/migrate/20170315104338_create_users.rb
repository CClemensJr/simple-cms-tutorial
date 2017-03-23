class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      #rails automatically adds ID column
      #long hand method for adding a column
      t.column "first_name", :string, :limit => 25
      #short hand method for adding a column
      t.string "last_name", :limit => 50
      t.string "email", :default => '', :null => false
      t.string "password", :limit => 40

      #long hand method of tracking created and updated records
      #t.datetime "created_at"
      #t.datetime "updated_at"
      #rails shorthand for tracking created and updated records
      t.timestamps
    end
  end

  def down
    drop_table :users do |t|

      t.timestamps
    end
  end
end
