class CreatePetFollows < ActiveRecord::Migration
  def change
    create_table :pet_follows do |t|
      t.integer :user_id, null: false
      t.integer :pet_id, null: false

      t.timestamps
    end

    add_index :pet_follows, :user_id
    add_index :pet_follows, :pet_id
  end
end
