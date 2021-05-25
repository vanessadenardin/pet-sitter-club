class Pet < ApplicationRecord
  belongs_to :user, foreign_key: 'client_id'
  has_one_attached :image
  belongs_to :pet_type, foreign_key: 'pet_types_id'

  validates :name, presence: true, length: { minimum: 2 }
  validates :age, numericality: { only_integer: true }
  validates :pet_types_id, presence: true
  validates :observations, length: { minimum: 3 }, allow_blank: true
end
