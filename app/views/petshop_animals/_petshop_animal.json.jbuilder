json.extract! petshop_animal, :id, :animal_id, :petshop_id, :created_at, :updated_at
json.url petshop_animal_url(petshop_animal, format: :json)
json.animal_name petshop_animal.animal.name
json.petshop_name petshop_animal.petshop.name
