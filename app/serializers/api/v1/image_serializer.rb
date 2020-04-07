class Api::V1::ImageSerializer < Api::V1::BaseSerializer
  attribute :file

  def file
    hash = {}
    Image::VARIANTS.each do |variant, props|
      url =
        object.file.variant(
          props[:process] => [props[:width], props[:height]],
          auto_orient: true,
          strip: true,
          gravity: 'center',
          quality: '100%'
      ).service_url.split('?').first
      hash[:"#{variant}"] = url
    end
    hash
  end
end
