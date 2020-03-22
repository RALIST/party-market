class AvatarProcessingJob < ApplicationJob

  def perform(id)
    user = User.find(id)
    return unless user.present? && user&.avatar&.attached?

    user.avatar.variant(resize_to_fill: %w(100 100)).processed
    user.avatar.variant(resize_to_fill: %w(200 200)).processed
    user.avatar.variant(resize_to_fill: %w(300 300)).processed
  end
end
