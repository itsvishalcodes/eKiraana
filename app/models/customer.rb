class Customer < ApplicationRecord
	has_secure_password

	has_one :customerpersonalinfo, dependent: :destroy
end
