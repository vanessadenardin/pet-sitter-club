class OrderService < ApplicationRecord
    has_one :pet_sitter_service, foreign_key: "id"
    # with below I can get OrderService.service instead of
    # OrderService.pet_sitter_service.service
    has_one :service, through: :pet_sitter_service

    belongs_to :order
end
