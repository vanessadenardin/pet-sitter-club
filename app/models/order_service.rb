class OrderService < ApplicationRecord
    has_many :pet_sitter_services
    has_many :services, through: :pet_sitter_services
    belongs_to :order
    belongs_to :pet_sitter_service
end
