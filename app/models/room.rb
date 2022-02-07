class Room < ApplicationRecord
  belongs_to      :user
  has_many        :reservations
  mount_uploader  :room_image, ImagesUploader

  with_options presence: true do
    validates :room_name
    validates :room_introduction, length: {maximum: 100}
    validates :room_price,        numericality: true
    validates :room_address
    validates :room_image
  end
end
