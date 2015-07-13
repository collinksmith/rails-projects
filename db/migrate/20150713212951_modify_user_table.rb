class ModifyUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string
    remove_column :users, :name, :string

    add_column :users, :username, :string
    change_column :users, :username, :string, null: false

    add_index :users, :username, unique: true
  end
end
