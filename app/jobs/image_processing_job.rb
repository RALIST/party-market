class ImageProcessingJob < ApplicationJob

  retry_on ActiveStorage::FileNotFoundError, attempts: 3

  def perform(id)
    image = Image.find_by(id: id)
    return unless image.present? && image&.file&.attached?

    Image::VARIANTS.each do |_, variant|
      image.file.variant(
        variant[:process] => [variant[:width], variant[:height]],
        auto_orient: true,
        strip: true,
        gravity: 'center',
        quality: '100%'
      ).processed
    end
  end
end
