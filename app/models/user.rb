class User < ActiveRecord::Base
	has_secure_password
	has_many :tweets
	has_many :followers
	has_many :followings
end
