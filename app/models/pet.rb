class Pet < ApplicationRecord
  belongs_to :user, foreign_key: 'client_id'
  has_many_attached :images
end
