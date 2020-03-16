class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many  :access_grants, class_name:  "Doorkeeper::AccessGrant",
                            foreign_key: :resource_owner_id,
                            dependent:   :destroy

  has_many  :access_tokens, class_name:  "Doorkeeper::AccessToken",
                            foreign_key: :resource_owner_id,
                            dependent:   :destroy

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end