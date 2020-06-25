class Product < ApplicationRecord
  belongs_to :dealer
  has_many :cart, dependent: :destroy
  has_many :pendingorder, dependent: :destroy

  mount_uploader :image, PhotoUploader
end
