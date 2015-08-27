class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    create_table :contact_groupings do |t|
      t.integer :group_id, null: false
      t.integer :contact_id, null: false

      t.timestamps null: false
    end

    create_table :user_groupings do |t|
      t.integer :group_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :contact_groupings, [:group_id, :contact_id], unique: true
    add_index :user_groupings, [:group_id, :user_id], unique: true
    
    add_index :contact_groupings, :contact_id
    add_index :user_groupings, :user_id
  end
end
