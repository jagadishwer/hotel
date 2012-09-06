class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.integer :value
      t.integer :administrator_id
    end
  end
end
