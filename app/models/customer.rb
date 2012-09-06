class Customer < User
  # attr_accessible :title, :body
  belongs_to :administrator
  def admin=(a)
    (Administrator.find_by_name(a)).customers<<self
  end
end
