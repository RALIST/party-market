class Image < ApplicationRecord
  belongs_to :event_user
  belongs_to :event
  has_many :marks, dependent: :destroy
  has_many :marked_users, through: :marks, class_name: 'User'
  has_many :resource_tags, as: :resource
  has_many :tags, through: :resource_tags
  has_one_attached :file

  after_commit { ImageProcessingJob.perform_later(id) }

  VARIANTS = {
    medium: { width: 400, height: 200, process: :resize_to_limit },
    large: { width: 768, height: 384, process: :resize_to_limit }
  }
end
