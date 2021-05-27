class PetSitterService < ApplicationRecord
    belongs_to :user, foreign_key: 'pet_sitter_id'
    # pet_sitter_service.service.name
    belongs_to :service
end
