class Order < ApplicationRecord
  has_many :order_services, dependent: :destroy
  has_one :payment, dependent: :destroy
end
