class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.string :description
      t.integer :category_id
    t.integer :adminstrator_id
    end
  end
end
