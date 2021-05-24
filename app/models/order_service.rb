class OrderService < ApplicationRecord
    belongs_to :pet_sitter_service
    # with below I can get OrderService.service instead of
    # OrderService.pet_sitter_service.service
    has_one :service, through: :pet_sitter_service

    belongs_to :order
end
