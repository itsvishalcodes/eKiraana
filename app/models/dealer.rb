class Dealer < ApplicationRecord
	has_one :dealerpersonalinfo
	has_many :products
end
