class Customer < ApplicationRecord
	has_one :customerpersonalinfo, dependent: :destroy
end
