class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :pets, dependent: :destroy, foreign_key: 'client_id'
  has_many :reviews, dependent: :destroy, foreign_key: 'pet_sitter_id'

  # pet sitter services relationship
  has_many :pet_sitter_services, dependent: :destroy, foreign_key: 'pet_sitter_id'
  has_many :services, through: :pet_sitter_services
  # accepts_nested_attributes_for :pet_sitter_services

  has_many :orders, foreign_key: 'pet_sitter_id'
  has_many :orders, foreign_key: 'client_id'

  # some_user.ability.can? :read, @service
  # delegate :can?, :cannot?, to: :ability

  def admin?

    admin
  end

  def client?

    role == "client"
  end

  def pet_sitter?

    role == "pet_sitter"
  end

  def name
    "#{first_name} #{last_name}"
  end
end
