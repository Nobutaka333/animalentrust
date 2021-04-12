class Animal < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :storage_place_pet
  belongs_to :storage_time
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :storage_place_pet_id
      validates :prefecture_id
      validates :storage_time_id
    end
  end
end
