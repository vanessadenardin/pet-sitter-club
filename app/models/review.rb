class Review < ApplicationRecord
  belongs_to :user, foreign_key: 'client_id'
  belongs_to :user, foreign_key: 'pet_sitter_id'
  belongs_to :order

  # validates :review
  validates :order_id, presence: true
  validates :pet_sitter_id, presence: true
  validates :client_id, presence: true
  validates :review, presence: true
  validates :date, presence: true
  validates :rating, length: { minimum: 0, maximum: 5 }
end
