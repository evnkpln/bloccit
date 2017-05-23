class User < ActiveRecord::Base
    
    before_save { self.email = email.downcase if email.present? }
    before_save {
        if name.present? 
            split_name = self.name.split
            split_name.each do |word|
                word.capitalize!
            end
            self.name = split_name.join(" ")
        end
    }
    
    validates :name, length: { minimum:1, maximum: 100 }, presence: true
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: { minimum: 6 }, allow_blank: true
    
    validates :email,
        presence: true,
        uniqueness: { case_sensitive: false },
        length: { minimum: 3, maximum: 254 }
        
    has_secure_password
end
