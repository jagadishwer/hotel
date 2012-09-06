class Tax < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :administrator
  def admin=(a)
    (Administrator.find_by_name(a)).tax=self
  end
end
