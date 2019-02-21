class PetshopAnimal < ApplicationRecord
  belongs_to :animal
  belongs_to :petshop
end
