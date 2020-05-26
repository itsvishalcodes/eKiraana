class Customer < ApplicationRecord
	has_secure_password

	has_one :customerpersonalinfo, dependent: :destroy
	validates :email, presence: true
	validates :password, presence: true
end
