class Pet < ApplicationRecord
  belongs_to :user, foreign_key: 'client_id'
  has_many_attached :images
  has_one :pet_type, foreign_key: 'id'
end
