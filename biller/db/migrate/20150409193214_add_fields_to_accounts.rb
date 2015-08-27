class AddFieldsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :city, :string
    add_column :accounts, :zipcode, :integer
    add_column :accounts, :state, :string
    add_column :accounts, :employees, :integer
  end
end
