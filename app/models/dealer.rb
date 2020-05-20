class Dealer < ApplicationRecord
	has_secure_password

	has_one :dealerpersonalinfo
	has_many :products
end
