class User < ActiveRecord::Base
 attr_accessible :salt, :name, :org_password
validates :name, :presence=>true,
                 :uniqueness=>true
#validates :org_password, :confirmation=>true
  validates :salt, :presence=>true
  def org_password=(pass)

    puts"*******************"
    puts pass
    @password1=pass
     self.salt=User.random_string(10) if !self.salt?
    self.password=User.encrypt(@password1,self.salt)
  end

  def self.random_string(len)
    chars=("a".."z").to_a+("A".."Z").to_a+("0".."9").to_a
    newpass=""
    1.upto(len){|i|newpass << chars[rand(chars.size-1)]}
    return newpass
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass+salt)
  end

  def self.authenticate(login, pass)
    u=find(:first, :conditions=>["name = ?", login])
    return nil if u.nil?
    return u if User.encrypt(pass, u.salt)==u.password
    
  end

end
