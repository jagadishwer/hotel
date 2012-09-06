class Picture < ActiveRecord::Base
  # attr_accessible :title, :body
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }

end
