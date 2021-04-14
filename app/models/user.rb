class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :user_birthday
    validates :postal_code
    validates :city
    validates :address
    validates :tel
    with_options numericality: { other_than: 0 } do
      validates :prefecture_id
    end
  end
  has_many :animals
end
