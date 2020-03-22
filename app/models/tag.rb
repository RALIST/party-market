class Tag < ApplicationRecord
  has_many :resource_tags
  has_many :events, through: :resource_tags, source: :resource, source_type: 'Event'
  has_many :images, through: :resource_tags, source: :resource, source_type: 'Image'
end
