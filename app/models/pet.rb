class Pet < ApplicationRecord
  belongs_to :user, foreign_key: 'client_id'
end
