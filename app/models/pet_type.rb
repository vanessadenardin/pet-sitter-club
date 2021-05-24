class PetType < ApplicationRecord
  has_many :pets, foreign_key: 'pet_types_id'
end
