require 'digest'
module Login

  def self.included(base)
    base.send :attr_accessible, :password, :hashed_password, :salt
    base.send :validates_presence_of, :hashed_password, :salt
  end

  def password=(pass)
    @password = pass
    self.salt = Login.generate_salt unless self.salt?
    self.hashed_password = Login.hash_password(@password, self.salt)
  end

  def authenticate(*a)
    nil # must implement in class
  end
 
  def self.generate_salt
    Digest::SHA1.hexdigest(rand(1000000).to_s)
  end

  def self.hash_password(p,s)
    return nil if p.nil? or s.nil?
    Digest::SHA1.hexdigest(p+s)
  end

end
