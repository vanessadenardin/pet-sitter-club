class Order < ApplicationRecord
  has_many :order_services, dependent: :destroy
  has_many :pet_sitter_services, through: :order_services
  has_many :services, through: :pet_sitter_services

  has_one :payment, dependent: :destroy
  has_one :review

  belongs_to :client, foreign_key: 'client_id', class_name: 'User'
  belongs_to :pet_sitter, foreign_key: 'pet_sitter_id', class_name: 'User'

  # display the total of the order
  def total
    order_services.inject(0) { |sum, order_service| sum + order_service.service.price }
  end

  # def completed?
  #   complete = true
  #   order_services.each do |order_service|
  #     if !order_service.completed
  #       complete = false
  #     end
  #   end
  #   complete
  # end
end
