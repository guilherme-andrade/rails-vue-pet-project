class CreatePetshops < ActiveRecord::Migration[5.2]
  def change
    create_table :petshops do |t|
      t.string :name

      t.timestamps
    end
  end
end
