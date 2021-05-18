class OrderService < ApplicationRecord
    has_many :pet_sitter_services
    belongs_to :order
end
