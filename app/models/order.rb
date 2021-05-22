class Order < ApplicationRecord
  has_many :order_services, dependent: :destroy
  has_many :pet_sitter_services, through: :order_services

  has_one :payment, dependent: :destroy
  has_one :review
  
  belongs_to :client, foreign_key: 'client_id', class_name: 'User'
  belongs_to :pet_sitter, foreign_key: 'pet_sitter_id', class_name: 'User'

end
