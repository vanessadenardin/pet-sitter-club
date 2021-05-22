class Pet < ApplicationRecord
  belongs_to :user, foreign_key: 'client_id'
  has_many_attached :images
  has_one :pet_type, foreign_key: 'id'

  validates :name, presence: true, length: { minimum: 2 }
  validates :age, numericality: { only_integer: true }
  validates :pet_type, presence: true
  validates :observations, length: { is: 5 }, allow_blank: true
end
