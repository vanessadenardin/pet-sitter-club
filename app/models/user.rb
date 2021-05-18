class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :pets, dependent: :destroy, foreign_key: 'client_id'
  has_many :reviews, dependent: :destroy, foreign_key: 'pet_sitter_id'
  # has_many :orders, foreign_key: 'client_id'
  # has_many :orders, foreign_key: 'pet_sitter_id'

  # pet sitter services relationship
  has_many :pet_sitter_services, dependent: :destroy, foreign_key: 'pet_sitter_id'
  has_many :services, through: :pet_sitter_services


  # has_many :services, dependent: :destroy, foreign_key: 'pet_sitter_id'

  # enum role: [:client, :pet_sitter, :admin]
  # after_initialize :set_default_role, :if => :new_record?

  # def set_default_role
  #   self.role ||= :client
  # end

end
