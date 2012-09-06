# To change this template, choose Tools | Templates
# and open the template in the editor.

class Logo < Picture
  #ßßßattr_accessible :admin1
  belongs_to :administrator
  
  def admin=(a)
    puts "xxxxxxxxxxxxxxxxxxxxx==========================xxx"
    
    (Administrator.find_by_name(a)).logo=self
  end
end
