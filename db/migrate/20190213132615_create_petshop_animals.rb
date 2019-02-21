class CreatePetshopAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :petshop_animals do |t|
      t.references :animal, foreign_key: true
      t.references :petshop, foreign_key: true

      t.timestamps
    end
  end
end
