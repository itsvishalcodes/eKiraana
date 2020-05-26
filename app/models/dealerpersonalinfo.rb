class Dealerpersonalinfo < ApplicationRecord
  belongs_to :dealer
	validates :shopname, presence: true
	validates :phone, presence: true
	validates :review, presence: true
end
