class Service < ApplicationRecord
  has_many :pet_sitter_services
  has_many :users, through: :pet_sitter_services, foreign_key: 'pet_sitter_id'

  validates :name, presence: true, length: { minimum: 2 }
  validates :price, numericality: true
  validates :description, length: { is: 5 }, allow_blank: true
end
