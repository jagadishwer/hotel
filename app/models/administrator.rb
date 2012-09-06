class Administrator < User
  #attr_accessible :title, :body, :galleries_attributes
  has_many :galleries, :conditions=> "picture_type='gallery'"
  has_many :categories, :through => :items
  has_many :items
  has_one :logo, :conditions=> "picture_type='logo'"
  has_many :customers
  has_one :tax
  #accepts_nested_attributes_for :galleries, :allow_destroy => true
has_one :contact
#accepts_nested_attributes_for :galleries
end
