class AvatarProcessingJob < ApplicationJob
  retry_on ActiveStorage::FileNotFoundError, attempts: 3

  def perform(id)
    user = User.find(id)
    return unless user.present? && user&.avatar&.attached?

    User::VARIANTS.each do |_, variant|
      user.avatar.variant(
        variant[:process] => [variant[:width], variant[:height]],
        auto_orient: true,
        strip: true,
        gravity: 'center',
        quality: '100%'
      ).processed
    end
  end
end
