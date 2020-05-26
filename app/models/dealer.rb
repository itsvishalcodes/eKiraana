class Dealer < ApplicationRecord
	has_secure_password

	has_one :dealerpersonalinfo
	has_many :products
	validates :email, presence: true
	validates :password, presence: true
end
