class Service < ApplicationRecord
  belongs_to :user, foreign_key: 'pet_sitter_id'
end
