class Customerpersonalinfo < ApplicationRecord
  belongs_to :customer
	validates :name, presence: true
	validates :phone, presence: true
	validates :address, presence: true
end
