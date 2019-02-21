class Petshop < ApplicationRecord
  has_many :petshop_animals, dependent: :restrict_with_exception
  has_many :animals, through: :petshop_animals
end
