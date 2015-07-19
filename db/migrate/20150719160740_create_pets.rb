class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :animal_type, null: false
      t.string :sex, null: false

      t.timestamps
    end
  end
end
