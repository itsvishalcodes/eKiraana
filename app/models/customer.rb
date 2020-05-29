class Customer < ApplicationRecord
	has_secure_password

	has_one :customerpersonalinfo, dependent: :destroy
	has_many :cart, dependent: :destroy
	validates :email, presence: true
	validates :password, presence: true
end
