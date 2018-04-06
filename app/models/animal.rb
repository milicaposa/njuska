class Animal < ApplicationRecord
  # relation
  belongs_to :user

  # enum
  enum species: [:pas, :macka, :ostalo]
  enum status:  [:poklon, :nestala]

  # validation
  validates_presence_of :name, :years, :description, :user_id, :thumb_image, :main_image
  validates :species, inclusion: { in: species.keys }
  validates :status, inclusion: { in: statuses.keys }
  validates_length_of :description, minimum: 5, maximum: 1500

  # upload
  mount_uploader :thumb_image, AnimalUploader
  mount_uploader :main_image, AnimalUploader

  # scopes
  scope :dogs, -> { Animal.pas }
  scope :cats, -> { Animal.macka }
  scope :other, -> { Animal.ostalo }
  scope :missing, -> { Animal.nestala }
  scope :adoption, -> { Animal.poklon }
end
