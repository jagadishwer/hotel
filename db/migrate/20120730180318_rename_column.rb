class RenameColumn < ActiveRecord::Migration
  def up
    rename_column :items,:adminstrator_id, :administrator_id
    change_column :pictures, :administrator_id, :integer
  end

  def down
    rename_column :items,:administrator_id, :adminstrator_id
    change_column :pictures, :administrator_id, :string
  end
end
