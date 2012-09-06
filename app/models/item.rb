class Item < ActiveRecord::Base
   # attr_accessible :title, :body
   belongs_to :administrator
   belongs_to :category
   def admin=(a)
    (Administrator.find_by_name(a)).items<<self
  end
end
