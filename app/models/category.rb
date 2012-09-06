class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :administrator, :through=>:items
  has_many :items
  def admin=(a)
    (Administrator.find_by_name(a)).categories<<self
  end
end
