FactoryBot.define do
  factory :image do
    sequence(:file) { |n| fixture_file_upload Rails.root.join('spec', 'fixtures', 'images', "profile_image_#{(n%11+1).to_s.rjust(2,'0')}.jpg"), 'image/jpg', true }
  end
end
