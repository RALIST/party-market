class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many  :access_grants, class_name:  "Doorkeeper::AccessGrant",
                            foreign_key: :resource_owner_id,
                            dependent:   :destroy

  has_many  :access_tokens, class_name:  "Doorkeeper::AccessToken",
                            foreign_key: :resource_owner_id,
                            dependent:   :destroy

  has_many :event_users, dependent: :destroy
  has_many :events, through: :event_users
  has_many :marks, as: :actor

  has_one_attached :avatar

  after_commit { AvatarProcessingJob.perform_later(id) }

  VARIANTS = {
    small: {width: 100, height: 100, process: :resize_to_limit},
    medium: { width: 200, height: 200, process: :resize_to_limit },
    large: { width: 400, height: 400, process: :resize_to_limit }
  }

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
