class Service < ApplicationRecord
  has_many :pet_sitter_services, foreign_key: 'service_id'
  has_one_attached :image

  def update_active(active)
    @active = active
  end

  def active?
    @active
  end


  # validates :name, presence: true, length: { minimum: 2 }
  # validates :price, numericality: true
  # validates :description, length: { is: 5 }, allow_blank: true
end
