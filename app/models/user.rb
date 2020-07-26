class User < ActiveRecord::Base
    has_secure_password
    has_many :flights
    validates_presence_of :username
end
