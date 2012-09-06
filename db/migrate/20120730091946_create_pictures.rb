class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
t.string :picture_type
t.string :administrator_id

    t.string :photo_file_name # Original filename
    t.string :photo_content_type # Mime type
    t.integer :photo_file_sizer # File size in bytes

    end
  end
end
