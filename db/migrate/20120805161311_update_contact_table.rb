class UpdateContactTable < ActiveRecord::Migration
  def up
    add_column :contacts, :mobile_no, :string
    add_column :contacts, :landline_no, :string
    add_column :contacts, :house_no, :integer
    add_column :contacts, :administrator_id, :integer
    add_column :contacts, :street, :string
    add_column :contacts, :city, :string
    add_column :contacts, :state, :string
    add_column :contacts, :country, :string
    add_column :contacts, :pincode, :string
  end

  def down
    remove_column :contacts, :mobile_no
    remove_column :contacts, :landline_no
    remove_column :contacts, :house_no
    remove_column :contacts, :administrator_id
    remove_column :contacts, :street
    remove_column :contacts, :city
    remove_column :contacts, :state
    remove_column :contacts, :country
    remove_column :contacts, :pincode
  end
end
