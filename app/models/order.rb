class Order < ApplicationRecord
  belongs_to :user, foreign_key: 'client_id'
  belongs_to :user, foreign_key: 'pet_sitter_id'
end
