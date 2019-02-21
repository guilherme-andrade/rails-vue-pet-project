class Animal < ApplicationRecord
  has_many :petshop_animals, dependent: :restrict_with_exception
  validates :name, presence: true
end
