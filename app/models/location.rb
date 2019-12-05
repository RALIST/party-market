class Location < ApplicationRecord
  has_many_attached :images
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_presence_of :name, :city, :price, :loc_type, :capicity
end
