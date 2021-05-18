class PetSitterService < ApplicationRecord
    belongs_to :user, foreign_key: 'pet_sitter_id'
    belongs_to :service
end
