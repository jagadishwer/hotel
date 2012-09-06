# To change this template, choose Tools | Templates
# and open the template in the editor.

class Gallery < Picture
  has_attached_file :photo,
    :styles => {
    :thumb=> "100x100#",
    :small  => "300x300>",
    :large => "600x600>"
  }
  belongs_to :administrator
  def admin=(a)
    (Administrator.find_by_name(a)).galleries<<self
  end
#  def self assignment=(c{})
#    c.each do |k,v|
#   @gallery.picture_type="gallery"
#          @gallery.admin=@admin
#          if @gallery.save
#  end
end
