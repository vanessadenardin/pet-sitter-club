class Review < ApplicationRecord
  # linking new review with client_id, pet_sitter_id and order_ir
  belongs_to :user, foreign_key: 'client_id'
  belongs_to :user, foreign_key: 'pet_sitter_id'
  belongs_to :order

  validates :order_id, presence: true
  validates :pet_sitter_id, presence: true
  validates :client_id, presence: true
  validates :review, presence: true
  validates :date, presence: true
  validates :rating, length: { minimum: 0, maximum: 5 }
end
