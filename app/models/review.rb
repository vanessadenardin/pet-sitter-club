class Review < ApplicationRecord
  belongs_to :user, foreign_key: 'client_id'
  belongs_to :user, foreign_key: 'pet_sitter_id'
  has_one :order

  # validates :review
  # validates :order, presence: true
end
