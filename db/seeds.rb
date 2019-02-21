require 'faker'

PetshopAnimal.destroy_all
Animal.destroy_all
Petshop.destroy_all


20.times do
  animal = Animal.create(name: Faker::Creature::Animal.name)
  petshop = Petshop.create(name: Faker::Name.first_name + "'s Shop")
end

50.times do
  PetshopAnimal.create(petshop: Petshop.all.sample, animal: Animal.all.sample)
end
