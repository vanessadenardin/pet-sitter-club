class Service < ApplicationRecord
  has_many :pet_sitter_services
  has_many :users, through: :pet_sitter_services, foreign_key: 'pet_sitter_id'
end
