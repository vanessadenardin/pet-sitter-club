class PetSitterService < ApplicationRecord
    belongs_to :user, foreign_key: 'pet_sitter_id'
    has_one :service, foreign_key: 'id'
end
