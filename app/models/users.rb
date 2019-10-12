class Users < ActiveRecord::Base 
    has_many :items 
    has_secure_password
end 