class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
t.string :name
t.string :password
t.string :user_type
t.integer :administrator_id
      
    end
  end
end
