class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  # relation
  has_many :animals, dependent: :destroy
end
